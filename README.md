# E-Commerce Customer Retention & Lifetime Value (CLV) Analysis

## 📌 Project Overview
Customer acquisition costs (CAC) are rising. For modern e-commerce brands, profitability depends entirely on repeat business, strong retention curves, and maximizing Customer Lifetime Value (CLV). 

This project establishes a relational database framework to model, evaluate, and track user behavioral patterns. By transforming transaction data into analytical insights, this project isolates top-performing marketing channels, assesses global revenue generation, calculates customer purchase frequency metrics, and flags users displaying a high risk of churn.

---

## 🛠️ Tech Stack & Concepts
* **Database Engine:** MySQL / PostgreSQL compatibility
* **SQL Techniques:** Multi-stage `JOINs`, Correlated Subqueries, Window Functions (`DENSE_RANK() OVER`), Aggregate Functions (`SUM`, `AVG`, `COUNT`), Date Engineering (`DATEDIFF`, `DATE_FORMAT`, `INTERVAL`), Conditonal Logic (`IFNULL`, `HAVING`).

---

## 🗄️ Database Architecture & Schema
The database (`ECommerceRetentionDB`) uses a clean star-schema design optimizing relational integrity between user attributes and transaction histories.

### 1. `users` Table
Stores foundational customer demographics and original acquisition sources.
* `user_id` (INT, Primary Key)
* `signup_date` (DATE, Not Null)
* `country` (VARCHAR)
* `acquisition_channel` (VARCHAR)

### 2. `orders` Table
Tracks granular purchasing records linked dynamically back to the user profiles.
* `order_id` (INT, Primary Key)
* `user_id` (INT, Foreign Key referencing `users.user_id`)
* `order_date` (DATE, Not Null)
* `order_amount` (DECIMAL)

---

## 📈 Key Business Questions & SQL Insights

### 1. Repeat Buyer Velocity (Time-to-Second-Purchase)
* **Objective:** Determine the operational lag between initial conversion and repeat behavior.
* **The Logic:** Employs a self-join alongside a correlated subquery to lock down the exact debut purchase date, evaluating the minimum gap before order number two.
```sql
SELECT 
    o1.user_id,
    u.acquisition_channel,
    o1.order_date AS first_purchase_date,
    MIN(o2.order_date) AS second_purchase_date,
    DATEDIFF(MIN(o2.order_date), o1.order_date) AS days_to_repeat_purchase
FROM orders o1
JOIN users u ON o1.user_id = u.user_id
JOIN orders o2 ON o1.user_id = o2.user_id AND o2.order_date > o1.order_date
WHERE o1.order_date = (
    SELECT MIN(sub.order_date)
    FROM orders sub
    WHERE sub.user_id = o1.user_id
)
GROUP BY o1.user_id, u.acquisition_channel, o1.order_date;
```

### 2. Customer Value Segmentation (VIP Indexing)
* **Objective:** Isolate high-performing consumers to enable tailored loyalty incentives.
* **The Logic:** Evaluates full Lifetime Value (LTV) and order frequencies per user, using window rankings (`DENSE_RANK()`) to segment profiles dynamically.
```sql
SELECT 
    user_id,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS lifetime_value,
    ROUND(AVG(order_amount), 2) AS average_order_value,
    DENSE_RANK() OVER (ORDER BY SUM(order_amount) DESC) AS customer_value_rank
FROM orders
GROUP BY user_id;
```

### 3. Marketing Acquisition Channel Efficiency
* **Objective:** Grade inbound acquisition channels based on pure monetization results rather than surface volume metrics.
* **The Logic:** Left-joins the customer base to revenue listings, calculating a true **Revenue Per Acquired User (RPAU)** baseline.
```sql
SELECT
    u.acquisition_channel,
    COUNT(DISTINCT u.user_id) AS total_users_acquired,
    COUNT(o.order_id) AS total_orders_placed,
    IFNULL(SUM(o.order_amount), 0) AS total_revenue,
    ROUND(IFNULL(SUM(o.order_amount), 0) / COUNT(DISTINCT u.user_id), 2) AS revenue_per_acquired_user
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.acquisition_channel
ORDER BY total_revenue DESC;
```

### 4. Dormancy & Churn Risk Warning Indicators
* **Objective:** Flag accounts showing zero transactional activity for 30+ sequential days.
* **The Logic:** Uses aggregated maximum date thresholds checked directly against the ultimate operational date marker using a `HAVING` filter.
```sql
SELECT
    u.user_id,
    u.country,
    MAX(o.order_date) AS last_purchase_date, 
    DATEDIFF((SELECT MAX(order_date) FROM orders), MAX(o.order_date)) AS days_since_last_order
FROM users u
JOIN orders o ON u.user_id = o.user_id 
GROUP BY u.user_id, u.country
HAVING days_since_last_order > 30;
```

### 5. Month-over-Month Retention & Churn Rates
* **Objective:** Track the macroscopic behavioral stability of active customer cycles month-over-month.
* **The Logic:** Compares user tables against forward shift periods via custom interval evaluation logic to compute dynamic mathematical retention ratios.
```sql
SELECT 
    DATE_FORMAT(o1.order_date, '%Y-%m') AS current_month,
    COUNT(DISTINCT o1.user_id) AS active_users,
    COUNT(DISTINCT o2.user_id) AS retained_users,
    (COUNT(DISTINCT o1.user_id) - COUNT(DISTINCT o2.user_id)) AS churned_users,
    ROUND((COUNT(DISTINCT o2.user_id) / COUNT(DISTINCT o1.user_id)) * 100, 1) AS retention_rate,
    ROUND(((COUNT(DISTINCT o1.user_id) - COUNT(DISTINCT o2.user_id)) / COUNT(DISTINCT o1.user_id)) * 100, 1) AS churn_rate
FROM orders o1
LEFT JOIN orders o2 
    ON o1.user_id = o2.user_id 
    AND DATE_FORMAT(o2.order_date, '%Y-%m') = DATE_FORMAT(o1.order_date + INTERVAL 1 MONTH, '%Y-%m')
GROUP BY DATE_FORMAT(o1.order_date, '%Y-%m')
ORDER BY current_month;
```

---

## 🎯 Strategic Business Findings
1. **Organic vs. Paid Optimization:** While *Organic Search* drives the largest absolute traffic stream, *Social Media* channels captured the most profitable customer cohort, delivering a leading revenue density per user.
2. **Re-engagement Timelines:** The customer return loop operates on a tight timeframe, averaging a ~22-day conversion lag for repeat actions. Re-targeting strategies should deploy dynamically around day 18 post-purchase.
3. **Geographic Concentrations:** Global revenue relies heavily on centralized nodes, with the UK and USA commanding over 48% of gross transactional distributions.

---

## 🚀 How to Run locally
1. Clone this repository down to your computer.
2. Fire up your preferred workspace environment (MySQL Workbench, pgAdmin, PopSQL).
3. Execute the `schema_and_queries.sql` file script package to instantly populate the structures, insert mock transactional logs, and run analytical queries.







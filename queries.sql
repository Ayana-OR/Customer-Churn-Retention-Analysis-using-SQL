CREATE DATABASE IF NOT EXISTS ECommerceRetentionDB;

USE ECommerceRetentionDB;

CREATE TABLE users(
	user_id INT PRIMARY KEY,
    signup_date DATE NOT NULL,
    country VARCHAR(50),
    acquisition_channel VARCHAR(30)
    );
    
CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE NOT NULL,
    order_amount DECIMAL(10,2),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
    );
    
INSERT INTO users (user_id,signup_date,country,acquisition_channel)
VALUES
(1, '2026-03-03', 'Netherlands', 'Organic Search'),
(2, '2026-01-04', 'UK', 'Affiliate'),
(3, '2026-03-29', 'Netherlands', 'Paid Ads'),
(4, '2026-03-24', 'Germany', 'Paid Ads'),
(5, '2026-03-17', 'Netherlands', 'Paid Ads'),
(6, '2026-01-02', 'USA', 'Social Media'),
(7, '2026-01-07', 'Germany', 'Affiliate'),
(8, '2026-02-14', 'France', 'Organic Search'),
(9, '2026-01-16', 'France', 'Organic Search'),
(10, '2026-01-20', 'USA', 'Email'),
(11, '2026-03-24', 'USA', 'Organic Search'),
(12, '2026-01-02', 'Germany', 'Referral'),
(13, '2026-02-18', 'Germany', 'Affiliate'),
(14, '2026-01-15', 'USA', 'Referral'),
(15, '2026-03-07', 'UK', 'Email'),
(16, '2026-03-21', 'Germany', 'Paid Ads'),
(17, '2026-01-19', 'UK', 'Affiliate'),
(18, '2026-02-09', 'Canada', 'Organic Search'),
(19, '2026-02-05', 'USA', 'Email'),
(20, '2026-01-08', 'UK', 'Affiliate'),
(21, '2026-02-23', 'Canada', 'Paid Ads'),
(22, '2026-02-17', 'France', 'Referral'),
(23, '2026-01-26', 'Canada', 'Paid Ads'),
(24, '2026-01-20', 'UK', 'Email'),
(25, '2026-03-02', 'USA', 'Affiliate'),
(26, '2026-01-07', 'UK', 'Paid Ads'),
(27, '2026-03-15', 'USA', 'Social Media'),
(28, '2026-03-19', 'Germany', 'Social Media'),
(29, '2026-02-14', 'Canada', 'Social Media'),
(30, '2026-02-27', 'Germany', 'Referral'),
(31, '2026-02-15', 'Canada', 'Referral'),
(32, '2026-02-14', 'France', 'Referral'),
(33, '2026-01-14', 'France', 'Organic Search'),
(34, '2026-01-01', 'France', 'Email'),
(35, '2026-02-12', 'UK', 'Organic Search'),
(36, '2026-03-13', 'Canada', 'Organic Search'),
(37, '2026-03-23', 'Netherlands', 'Organic Search'),
(38, '2026-01-06', 'Canada', 'Organic Search'),
(39, '2026-01-14', 'UK', 'Email'),
(40, '2026-02-04', 'France', 'Social Media'),
(41, '2026-03-15', 'UK', 'Email'),
(42, '2026-02-18', 'Canada', 'Email'),
(43, '2026-03-28', 'USA', 'Social Media'),
(44, '2026-03-20', 'UK', 'Paid Ads'),
(45, '2026-01-15', 'Netherlands', 'Referral'),
(46, '2026-02-06', 'France', 'Organic Search'),
(47, '2026-03-22', 'USA', 'Organic Search'),
(48, '2026-01-14', 'UK', 'Paid Ads'),
(49, '2026-02-05', 'Germany', 'Paid Ads'),
(50, '2026-01-13', 'USA', 'Paid Ads');

INSERT INTO orders (order_id, user_id, order_date, order_amount)
VALUES
(1, 1, '2026-03-12', 237.95),
(2, 1, '2026-03-24', 240.23),
(3, 2, '2026-01-08', 321.74),
(4, 2, '2026-02-14', 201.21),
(5, 3, '2026-05-18', 290.41),
(6, 4, '2026-04-18', 485.45),
(7, 5, '2026-04-03', 485.40),
(8, 6, '2026-01-17', 453.64),
(9, 6, '2026-02-12', 279.79),
(10, 7, '2026-01-18', 171.74),
(11, 8, '2026-03-19', 308.20),
(12, 9, '2026-01-26', 458.07),
(13, 10, '2026-02-04', 188.75),
(14, 11, '2026-05-24', 196.48),
(15, 12, '2026-01-25', 58.74),
(16, 13, '2026-03-01', 234.33),
(17, 14, '2026-01-30', 55.93),
(18, 15, '2026-04-20', 183.08),
(19, 16, '2026-03-22', 467.49),
(20, 17, '2026-01-22', 333.15),
(21, 18, '2026-02-11', 241.67),
(22, 19, '2026-03-07', 434.78),
(23, 20, '2026-02-01', 365.17),
(24, 21, '2026-03-19', 332.96),
(25, 22, '2026-03-13', 54.49),
(26, 23, '2026-02-23', 73.18),
(27, 24, '2026-02-16', 339.42),
(28, 25, '2026-03-16', 423.83),
(29, 26, '2026-01-14', 357.75),
(30, 27, '2026-04-08', 207.27),
(31, 28, '2026-03-29', 190.56),
(32, 29, '2026-02-17', 270.81),
(33, 30, '2026-03-26', 429.61),
(34, 31, '2026-03-08', 443.95),
(35, 32, '2026-02-18', 111.43),
(36, 33, '2026-01-25', 320.15),
(37, 34, '2026-01-14', 142.36),
(38, 35, '2026-02-23', 230.11),
(39, 36, '2026-03-31', 263.29),
(40, 37, '2026-04-18', 349.56),
(41, 38, '2026-01-08', 300.22),
(42, 39, '2026-01-21', 353.48),
(43, 40, '2026-02-25', 482.02),
(44, 41, '2026-03-28', 255.43),
(45, 42, '2026-03-08', 290.72),
(46, 43, '2026-04-11', 466.90),
(47, 44, '2026-04-03', 248.86),
(48, 45, '2026-02-05', 160.03),
(49, 46, '2026-02-19', 376.10),
(50, 47, '2026-04-10', 381.18),
(51, 48, '2026-01-28', 318.52),
(52, 49, '2026-02-07', 249.77),
(53, 50, '2026-01-26', 431.12),
(54, 1, '2026-03-29', 154.20),
(55, 2, '2026-03-02', 89.50),
(56, 6, '2026-03-05', 112.40),
(57, 8, '2026-04-01', 420.15),
(58, 10, '2026-02-20', 310.60),
(59, 12, '2026-02-14', 145.25),
(60, 15, '2026-05-02', 99.99),
(61, 17, '2026-02-18', 215.40),
(62, 19, '2026-04-01', 180.30),
(63, 20, '2026-03-10', 250.00),
(64, 24, '2026-03-05', 125.75),
(65, 26, '2026-02-22', 410.20),
(66, 29, '2026-03-12', 95.40),
(67, 33, '2026-02-10', 185.60),
(68, 34, '2026-02-01', 220.00),
(69, 35, '2026-03-15', 310.45),
(70, 39, '2026-02-28', 142.90),
(71, 40, '2026-03-10', 385.00),
(72, 44, '2026-04-25', 115.60),
(73, 45, '2026-02-28', 210.50),
(74, 48, '2026-02-20', 135.80),
(75, 50, '2026-02-15', 295.30);

SELECT * FROM users;

SELECT * FROM orders;

-- Filter out repeat buyers and no of days taken by a customer to place the second order.

SELECT 
	o1.user_id,
    u.acquisition_channel,
    o1.order_date AS first_purchase_date,
    MIN(o2.order_date) AS second_purchase_date,
    DATEDIFF(MIN(o2.order_date),o1.order_date) AS days_to_repeat_purchase
    FROM orders o1
    JOIN users u ON o1.user_id = u.user_id
    JOIN orders o2 ON o1.user_id = o2.user_id AND o2.order_date > o1.order_date
    
    WHERE o1.order_date = (
    SELECT MIN(sub.order_date)
    FROM orders sub
    WHERE sub.user_id = o1.user_id
    )
    GROUP BY o1.user_id,u.acquisition_channel,o1.order_date;

-- Customer lifetime value (CLV) & Order frequency [ for isolating VIP segments ]

SELECT 
	user_id,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS lifetime_value,
    ROUND(AVG(order_amount),2) AS average_order_value,
    DENSE_RANK() OVER (ORDER BY SUM(order_amount) DESC) AS customer_value_rank
    FROM orders
    GROUP BY user_id;
    
-- Marketing channel efficiency [ marketing channel bringing highest spending customers ]

SELECT
	u.acquisition_channel,
    COUNT(DISTINCT u.user_id) AS total_users_acquired,
    COUNT(o.order_id) AS total_orders_placed,
    IFNULL(SUM(o.order_amount),0) AS total_revenue,
    ROUND(IFNULL(SUM(o.order_amount),0)/COUNT(DISTINCT u.user_id),2) AS revenue_per_acquired_user
    FROM users u
    LEFT JOIN orders o ON u.user_id = o.user_id
    GROUP BY u.acquisition_channel
    ORDER BY total_revenue DESC;
    
-- Dormant / High Churn Risk Users (No order for 30+ days)

SELECT
    u.user_id,
    u.country,
    MAX(o.order_date) AS last_purchase_date, 
    DATEDIFF((SELECT MAX(order_date) FROM orders), MAX(o.order_date)) AS days_since_last_order
FROM users u
JOIN orders o ON u.user_id = o.user_id 
GROUP BY u.user_id, u.country
HAVING days_since_last_order > 30;

    
-- Geographical Revenue Distribution Analysis

SELECT
    u.country,
    COUNT(DISTINCT u.user_id) AS total_customers,
    SUM(o.order_amount) AS total_sales,
    ROUND((SUM(o.order_amount) / (SELECT SUM(order_amount) FROM orders)) * 100, 2) AS percentage_of_global_sales
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.country
ORDER BY total_sales DESC;

    
-- Customer Retention rate and churn rate

SELECT 
    DATE_FORMAT(o1.order_date, '%Y-%m') AS current_month,
    COUNT(DISTINCT o1.user_id) AS active_users,
    COUNT(DISTINCT o2.user_id) AS retained_users,
    (COUNT(DISTINCT o1.user_id) - COUNT(DISTINCT o2.user_id)) AS churned_users,
    
    -- Retention Rate %
    ROUND((COUNT(DISTINCT o2.user_id) / COUNT(DISTINCT o1.user_id)) * 100, 1) AS retention_rate,
    
    -- Churn Rate %
    ROUND(((COUNT(DISTINCT o1.user_id) - COUNT(DISTINCT o2.user_id)) / COUNT(DISTINCT o1.user_id)) * 100, 1) AS churn_rate

FROM orders o1
LEFT JOIN orders o2 
    ON o1.user_id = o2.user_id 
    AND DATE_FORMAT(o2.order_date, '%Y-%m') = DATE_FORMAT(o1.order_date + INTERVAL 1 MONTH, '%Y-%m')
GROUP BY DATE_FORMAT(o1.order_date, '%Y-%m')
ORDER BY current_month;

CREATE DATABASE sales;
USE sales;
CREATE TABLE sales_data (id INT PRIMARY KEY,Product VARCHAR(50),city VARCHAR(50),amount INT,Sale_date DATE);
INSERT INTO sales_data (id, product, city, amount, sale_date) VALUES
(1, 'Laptop', 'Kochi', 50000, '2025-01-10'),
(2, 'Phone', 'Mumbai', 20000, '2025-01-15'),
(3, 'Shoes', 'Kochi', 10000, '2025-02-01'),
(4, 'Laptop', 'Delhi', 60000, '2025-02-10'),
(5, 'Phone', 'Kochi', 15000, '2025-03-05'),
(6, 'Shoes', 'Mumbai', 12000, '2025-03-12');
SELECT * FROM sales_data;
-- Total Revenue
SELECT SUM(amount) AS total_revenue 
FROM sales_data;

-- Revenue by City
SELECT city, SUM(amount) AS total_revenue
FROM sales_data
GROUP BY city
ORDER BY total_revenue DESC;

-- Revenue by Product
SELECT product, SUM(amount) AS total_revenue
FROM sales_data
GROUP BY product
ORDER BY total_revenue DESC;

-- Highest Sale
SELECT *
FROM sales_data
ORDER BY amount DESC
LIMIT 1;

-- Monthly Sales Trend
SELECT 
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(amount) AS total_revenue
FROM sales_data
GROUP BY month
ORDER BY month;

-- Top 3 Cities by Revenue
SELECT city, SUM(amount) AS total_revenue
FROM sales_data
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 3;

-- Average Sale Value
SELECT AVG(amount) AS avg_sale_value
FROM sales_data;

-- Product-wise Sales by City
SELECT product, city, SUM(amount) AS total_revenue
FROM sales_data
GROUP BY product, city
ORDER BY total_revenue DESC;
DROP DATABASE SALES;
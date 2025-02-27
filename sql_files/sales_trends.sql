-- 1. Total Revenue Across All Branches
SELECT ROUND(SUM(Total), 2) AS total_revenue
FROM Sales;

-- 2. Daily Sales Trends
SELECT Date, SUM(Total) AS daily_sales
FROM Sales
GROUP BY Date
ORDER BY Date;

-- 3. Revenue by Branch (Highest & Lowest Revenue)
SELECT Branch, ROUND(SUM(Total), 2) AS total_revenue
FROM Sales
GROUP BY Branch
ORDER BY total_revenue DESC;

-- 4. Top-Selling Product Categories Based on Revenue
SELECT `Product line`, ROUND(SUM(Total), 2) AS total_revenue
FROM Sales
GROUP BY `Product line`
ORDER BY total_revenue DESC
LIMIT 6;

-- 5. Top-Selling Product Categories Based on Quantity Sold
SELECT `Product line`, SUM(Quantity) AS total_quantity_sold
FROM Sales
GROUP BY `Product line`
ORDER BY total_quantity_sold DESC
LIMIT 6;

-- 6. Sales Variation by Payment Method
SELECT Payment, COUNT(*) AS transaction_count, ROUND(SUM(Total), 2) AS total_sales
FROM Sales
GROUP BY Payment
ORDER BY total_sales DESC;



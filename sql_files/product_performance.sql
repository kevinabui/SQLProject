-- 1. Which product categories contribute the most to total revenue?
SELECT 
`Product line`,
ROUND(SUM(Total), 2) as `Total Revenue`
FROM sales
GROUP BY `Product line`
ORDER BY `Total Revenue` DESC;

-- 2. Are certain items more popular during certain hours of the day?
SELECT 
    `Branch`,
    `Product line`,
    DATE_FORMAT(STR_TO_DATE(`Time`, '%H:%i'), '%h %p') AS `Time of Day`,
    COUNT(`Invoice ID`) AS `Sales Count`
FROM sales
GROUP BY `Branch`, `Product line`, `Time of Day`
ORDER BY `Branch`, `Sales Count` DESC;

-- 3. Which products have the highest/lowest profit margins?
SELECT
	`Product line`,
	ROUND(SUM(`gross income`) / SUM(`cogs`) * 100, 2) AS `profit margin percentage`
FROM sales
GROUP BY `Product line`
ORDER BY `profit margin percentage` DESC;

-- 4. Which products have the highest quantity of sales?
SELECT
	`Product line`,
    SUM(Quantity) AS `Total Products Sold`
FROM sales
GROUP BY `Product line`
ORDER BY `Total Products Sold` DESC;

-- 5. How does the time of day (morning, afternoon, evening) affect sales volume and revenue for different product categories?
SELECT 
    `Product line`,
    CASE 
        WHEN TIME(`Time`) BETWEEN '06:00:00' AND '12:00:00' THEN 'Morning'
        WHEN TIME(`Time`) BETWEEN '12:00:01' AND '18:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS `Time of Day`,
    COUNT(`Invoice ID`) AS `Sales Volume`,
    ROUND(SUM(`Total`), 2) AS `Total Revenue`
FROM sales
GROUP BY `Product line`, `Time of Day`
ORDER BY `Product line`, `Time of Day`;

-- 6. What is the average customer rating for each product category, and how does it correlate with sales volume?
 SELECT 
    `Product line`,
    ROUND(AVG(`Rating`), 2) AS `Average Rating`,
    SUM(`Quantity`) AS `Total Quantity Sold`,
    ROUND(SUM(`Total`), 2) AS `Total Revenue`
FROM sales
GROUP BY `Product line`
ORDER BY `Average Rating` DESC, `Total Revenue` DESC;
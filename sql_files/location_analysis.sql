-- 1. What is the average customer rating by branch, and how does it correlate with sales performance?
SELECT  
	`Branch`,
	`City`, 
	ROUND(AVG(`Rating`), 2) AS `Average Rating`,
	ROUND(SUM(`Total`), 2) AS `Total Revenue`,
	SUM(`Quantity`) AS  `Total Quantity Sold`
FROM sales 
GROUP BY `Branch`, `City`
ORDER BY `Average Rating` DESC, `Total Revenue` DESC;

-- 2. Which branch has the highest and lowest customer traffic (number of transactions), and how does this impact revenue?
SELECT
	Branch,
    City,
    COUNT(`Invoice ID`) AS `Total Transactions`,
    ROUND(SUM(Total), 2) AS `Total Revenue`  
FROM sales
GROUP BY Branch, City
ORDER BY `Total Revenue`;

-- 3. How does the time of day (morning, afternoon, evening) affect sales volume and revenue in each branch?
SELECT
	Branch,
	City,
    CASE 
        WHEN TIME(`Time`) BETWEEN '06:00:00' AND '12:00:00' THEN 'Morning'
        WHEN TIME(`Time`) BETWEEN '12:00:01' AND '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS `Time of Day`,
    COUNT(`Invoice ID`) AS `Sales Volume`,
    ROUND(SUM(`Total`), 2) AS `Total Revenue`
FROM sales
GROUP BY `Time of Day`, Branch, City
ORDER BY `Time of Day`, `Branch`;

-- 4. Which branch has the highest and lowest customer satisfaction (based on ratings), and how does this correlate with sales performance?
SELECT
	Branch,
    City, 
    ROUND(AVG(Rating), 2) AS ` Average Rating`,
    ROUND(SUM(Total), 2) AS `Total Revenue`,
    SUM(Quantity) AS `Total Items Sold`
FROM sales
GROUP BY Branch, City
ORDER BY `Average Rating` DESC, `Total Revenue` DESC, `Total Items Sold`;

-- 5. How does product performance vary by branch?
SELECT
	Branch,
    City,
    `Product line`,
	ROUND(AVG(Rating), 2) AS ` Average Rating`,
    ROUND(SUM(Total), 2) AS `Total Revenue`,
    SUM(Quantity) AS `Total Items Sold`
FROM sales
GROUP BY Branch, City, `Product line`
ORDER BY Branch, `Total Revenue` DESC; 
-- 1. What is the average spending per customer per transaction?
SELECT 
    `Invoice ID`,
    `Customer type`,
    ROUND(AVG(`Total`), 2) AS Avg_Spending_Per_Transaction
FROM sales
GROUP BY `Invoice ID`, `Customer type`;

-- 2. How does customer spending differ between members and non-members?
SELECT
	`Customer type`,
    ROUND(AVG(`Total`), 2) AS `Average Spending`
FROM sales
GROUP BY `Customer type`;

-- 3. What are the peak shopping hours across different days?
SELECT 
    DAYNAME(STR_TO_DATE(`Date`, '%m/%d/%Y')) AS Day_of_Week,
    HOUR(STR_TO_DATE(`Time`, '%H:%i')) AS Hour_of_Day,
    COUNT(`Invoice ID`) AS Transaction_Count
FROM sales
GROUP BY Day_of_Week, Hour_of_Day
ORDER BY Transaction_Count DESC;

-- 4. Do certain customer demographics like gender or membership status impact spending behavior and overall customer shopping experience ratings?
SELECT
	Gender,
    `Customer type`,
    Rating,
    ROUND(AVG(`Total`), 2) AS `Average Spending`
FROM sales
GROUP BY Gender, `Customer type`, Rating;

-- 5. What are the most common payment methods, and do they affect purchase sizes?
SELECT
    Payment,
    COUNT(`Invoice ID`) AS `Transaction Count`,
    ROUND(AVG(`Total`), 2) AS `Average Spending`
FROM sales
GROUP BY Payment
ORDER BY `Transaction Count`;
    

    


    

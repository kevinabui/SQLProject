-- What marketing or discount strategies could be applied during peak sales periods?
SELECT 
    `Branch`,
    `City`,
    MONTH(`Date`) AS `Month`,
    DAYOFWEEK(`Date`) AS `Day of Week`,
    COUNT(`Invoice ID`) AS `Transaction Count`,
    ROUND(SUM(`Total`), 2) AS `Total Revenue`
FROM sales
GROUP BY `Branch`, `City`, `Month`, `Day of Week`
ORDER BY `Total Revenue` DESC;

-- How can the supermarket optimize payment method offerings to enhance customer convenience?
SELECT
	Branch,
    City,
	Payment,
    COUNT(`Invoice ID`) AS `Transaction Count`,
    ROUND(SUM(`Total`)) AS `Total Revenue`
FROM sales
GROUP BY Branch, City, Payment
ORDER BY Branch, `Transaction Count` DESC;
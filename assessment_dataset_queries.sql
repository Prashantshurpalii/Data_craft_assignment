

-- 1. Total Sales
SELECT SUM(TransactionAmount) AS TotalSales
FROM assessment_dataset;

-- 2. Total Transactions
SELECT COUNT(*) AS TotalTransactions
FROM assessment_dataset;

-- 3. Average Discount Percentage
SELECT AVG(DiscountPercent) AS AvgDiscount
FROM assessment_dataset;

-- 4. Total Returns
SELECT COUNT(*) AS TotalReturns
FROM assessment_dataset
WHERE Returned = 'Yes';


-- 5. Sales by Region
SELECT Region, SUM(TransactionAmount) AS TotalSales
FROM assessment_dataset
GROUP BY Region;

-- 6. Sales by Payment Method
SELECT PaymentMethod, SUM(TransactionAmount) AS TotalSales
FROM assessment_dataset
GROUP BY PaymentMethod;

-- 7. Top 3 Transactions by Sales
SELECT *
FROM assessment_dataset
ORDER BY TransactionAmount DESC
LIMIT 3;

-- 8. Average Delivery Time by Region
SELECT Region, AVG(DeliveryTimeDays) AS AvgDeliveryTime
FROM assessment_dataset
GROUP BY Region;


-- 9. Return Rate by Region
SELECT Region, 
       (SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ReturnRatePercentage
FROM assessment_dataset
GROUP BY Region;

-- 10. Evaluate the impact of promotions on sales.

SELECT 
    IsPromotional, 
    COUNT(*) AS TotalTransactions, 
    SUM(TransactionAmount) AS TotalSales, 
    AVG(TransactionAmount) AS AvgTransactionValue
FROM assessment_dataset
GROUP BY IsPromotional;


-- 11. Identify products with the highest return rates.

SELECT 
    ProductName, 
    COUNT(*) AS TotalTransactions, 
    SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) AS TotalReturns,
    (SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ReturnRate
FROM assessment_dataset
GROUP BY ProductName
ORDER BY ReturnRate DESC
LIMIT 5;


-- 12. Identify the Top Returning Products
SELECT ProductName, COUNT(*) AS TotalReturns
FROM assessment_dataset
WHERE Returned = 'Yes'
GROUP BY ProductName
ORDER BY TotalReturns DESC
LIMIT 5;


-- 13. Customer Segmentation by Age Group
SELECT 
    CASE 
        WHEN CustomerAge < 20 THEN 'Teen'
        WHEN CustomerAge BETWEEN 20 AND 35 THEN 'Young'
        WHEN CustomerAge BETWEEN 36 AND 55 THEN 'Middle age'
        ELSE 'Senior'
    END AS AgeGroup,
    COUNT(*) AS CustomerCount,
    SUM(TransactionAmount) AS TotalSales
FROM assessment_dataset
GROUP BY AgeGroup;

-- 14. Return Rate by Product Category and Region
SELECT ProductName, Region, 
       (SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ReturnRate
FROM assessment_dataset
GROUP BY ProductName, Region
ORDER BY ReturnRate DESC;




-- 15. Analyze sales performance over months to identify trends. -- partially executed

SELECT 
    YEAR(TransactionDate) AS Year, 
    MONTH(TransactionDate) AS Month, 
    SUM(TransactionAmount) AS MonthlySales
FROM assessment_dataset
GROUP BY YEAR(TransactionDate), MONTH(TransactionDate)
ORDER BY Year, Month;



-- 16. Identify products with the highest return rates.

SELECT 
    ProductName, 
    COUNT(*) AS TotalTransactions, 
    SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) AS TotalReturns,
    (SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ReturnRate
FROM assessment_dataset
GROUP BY ProductName
ORDER BY ReturnRate DESC
LIMIT 5;



-- 17. Compare sales across regions and identify the highest-performing regions.

SELECT 
    Region, 
    COUNT(*) AS TotalTransactions, 
    SUM(TransactionAmount) AS TotalSales, 
    AVG(TransactionAmount) AS AvgTransactionValue
FROM assessment_dataset
GROUP BY Region
ORDER BY TotalSales DESC;



-- 18. Identify the percentage of transactions from repeat customers.

SELECT 
    CASE 
        WHEN COUNT(*) > 1 THEN 'Repeat Customer'
        ELSE 'New Customer'
    END AS CustomerType,
    COUNT(DISTINCT CustomerID) AS CustomerCount,
    SUM(TransactionAmount) AS TotalSales
FROM assessment_dataset
GROUP BY CustomerType;


-- 19. Analyze if delivery time affects the returns.

SELECT 
    DeliveryTimeDays, 
    COUNT(*) AS TotalTransactions, 
    SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) AS TotalReturns,
    (SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ReturnRate
FROM assessment_dataset
GROUP BY DeliveryTimeDays
ORDER BY DeliveryTimeDays;


-- 20. Identify the most popular products based on the number of transactions.


SELECT 
    ProductName, 
    COUNT(TransactionID) AS TotalPurchases
FROM assessment_dataset
GROUP BY ProductName
ORDER BY TotalPurchases DESC
LIMIT 10;




-- 21> Identify repeat customers

SELECT 
    CustomerID, 
    COUNT(TransactionID) AS TotalTransactions
FROM assessment_dataset
GROUP BY CustomerID
HAVING COUNT(TransactionID) > 1
ORDER BY TotalTransactions DESC;



-- 22. customers with higher loyalty points tend to return products more frequently
SELECT 
    CASE 
        WHEN LoyaltyPoints < 1000 THEN 'Low Loyalty'
        WHEN LoyaltyPoints BETWEEN 1000 AND 5000 THEN 'Moderate Loyalty'
        ELSE 'High Loyalty'
    END AS LoyaltyCategory,
    SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) AS TotalReturns,
    COUNT(*) AS TotalTransactions,
    (SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ReturnRate
FROM assessment_dataset
GROUP BY LoyaltyCategory
ORDER BY ReturnRate DESC;


-- 23. Find cities that contribute the most to total sales.

SELECT 
    City, 
    SUM(TransactionAmount) AS TotalSales,
    (SUM(TransactionAmount) * 100.0 / (SELECT SUM(TransactionAmount) FROM assessment_dataset)) AS ContributionPercentage
FROM assessment_dataset
GROUP BY City
ORDER BY TotalSales DESC
LIMIT 10;


Key Insights from SQL Queries

Aggregate Metrics:

Total Sales: Provides the cumulative sales amount for all transactions.

Query: SELECT SUM(TransactionAmount) AS TotalSales FROM assessment_dataset;

Total Transactions: Calculates the number of transactions in the dataset.

Query: SELECT COUNT(*) AS TotalTransactions FROM assessment_dataset;

Average Discount Percentage: Analyzes the average discount offered across all transactions.

Query: SELECT AVG(DiscountPercent) AS AvgDiscount FROM assessment_dataset;

Total Returns: Identifies the number of returned transactions.

Query: SELECT COUNT(*) AS TotalReturns FROM assessment_dataset WHERE Returned = 'Yes';

Regional and Payment Analysis:

Sales by Region: Highlights the total sales grouped by region.

Key Insight: Top-performing regions can be identified for strategic focus.

Query: SELECT Region, SUM(TransactionAmount) AS TotalSales FROM assessment_dataset GROUP BY Region;

Sales by Payment Method: Evaluates the effectiveness of payment methods based on total sales.

Key Insight: Identifies the most preferred payment methods.

Query: SELECT PaymentMethod, SUM(TransactionAmount) AS TotalSales FROM assessment_dataset GROUP BY PaymentMethod;

Product Insights:

Top 3 Transactions by Sales: Lists the top three transactions with the highest sales values.

Query: SELECT * FROM assessment_dataset ORDER BY TransactionAmount DESC LIMIT 3;

Products with Highest Return Rates: Identifies products with the most frequent returns.

Key Insight: These products may need quality improvement or better customer education.

Query: See Queries 11 and 16.

Most Popular Products: Determines the products with the highest transaction counts.

Query: SELECT ProductName, COUNT(TransactionID) AS TotalPurchases FROM assessment_dataset GROUP BY ProductName ORDER BY TotalPurchases DESC LIMIT 10;

Promotional and Delivery Insights:

Impact of Promotions: Assesses whether promotions boost sales volume and value.

Key Insight: Promotional transactions show differing average values.

Query: SELECT IsPromotional, COUNT(*) AS TotalTransactions, SUM(TransactionAmount) AS TotalSales, AVG(TransactionAmount) AS AvgTransactionValue FROM assessment_dataset GROUP BY IsPromotional;

Delivery Time Impact on Returns: Analyzes how delivery time correlates with return rates.

Key Insight: Longer delivery times may lead to increased returns.

Query: SELECT DeliveryTimeDays, COUNT(*) AS TotalTransactions, SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) AS TotalReturns, (SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS ReturnRate FROM assessment_dataset GROUP BY DeliveryTimeDays ORDER BY DeliveryTimeDays;

Customer Analysis:

Repeat Customers: Identifies customers who made multiple transactions.

Query: SELECT CustomerID, COUNT(TransactionID) AS TotalTransactions FROM assessment_dataset GROUP BY CustomerID HAVING COUNT(TransactionID) > 1 ORDER BY TotalTransactions DESC;

Customer Segmentation by Age Group: Segments customers into age brackets and calculates their sales contribution.

Key Insight: Middle-aged customers may contribute the most to sales.

Query: See Query 13.

Loyalty Points and Return Behavior: Examines if customers with higher loyalty points tend to return products more frequently.

Query: See Query 22.

Additional Insights:

Sales Trends Over Time: Tracks monthly sales to identify seasonal trends.

Query: See Query 15.

Top Cities by Sales Contribution: Lists cities contributing the most to total sales.

Key Insight: Provides geographical focus for marketing efforts.

Query: See Query 23.

Return Rate by Region: Highlights regions with the highest return rates.

Query: See Query 9.

Sales Performance by Region: Compares regions based on total transactions, average transaction values, and total sales.

Query: See Query 17.

Summary:

These SQL queries provide actionable insights into sales performance, customer behavior, product popularity, and promotional effectiveness. By leveraging this analysis, businesses can optimize their strategies, improve product offerings, and enhance customer satisfaction.

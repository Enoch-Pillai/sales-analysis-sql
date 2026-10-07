-- Creating Table and Populating it:
DROP TABLE IF EXISTS Superstore_Sales;
CREATE TABLE Superstore_Sales(
Row_ID SERIAL PRIMARY KEY,
Order_ID VARCHAR (20),
Order_Date DATE,
Ship_Date DATE,
Ship_Mode VARCHAR(20),
Customer_ID	VARCHAR(20),
Customer_Name VARCHAR(25),	
Segment VARCHAR(15),
Country VARCHAR(20),
City VARCHAR(20),
State VARCHAR(20),
Postal_Code INT,
Region VARCHAR(10),
Product_ID VARCHAR(15),
Category VARCHAR(15),
Sub_Category VARCHAR(15),
Product_Name VARCHAR(150),	
Sales DECIMAL(12,4),
Quantity INT,
Discount DECIMAL(5,4),	
Profit DECIMAL(12,4)
);

-- Checking the imported value:
SELECT * FROM Superstore_Sales;

-- Checking for duplicates,Null:
SELECT COUNT(Row_ID) AS "Total_Row",COUNT(DISTINCT(Row_ID)) AS "Distinct_ROW" FROM Superstore_Sales;
SELECT COUNT(*)FILTER (WHERE Row_ID IS NULL),
COUNT(*)FILTER (WHERE Order_ID IS NULL),
COUNT(*)FILTER (WHERE Order_Date IS NULL),
COUNT(*)FILTER (WHERE Ship_Date IS NULL),
COUNT(*)FILTER (WHERE Ship_Mode IS NULL),
COUNT(*)FILTER (WHERE Customer_ID IS NULL),
COUNT(*)FILTER (WHERE Customer_Name IS NULL),
COUNT(*)FILTER (WHERE Segment IS NULL),
COUNT(*)FILTER (WHERE Country IS NULL),
COUNT(*)FILTER (WHERE City IS NULL),
COUNT(*)FILTER (WHERE State IS NULL),
COUNT(*)FILTER (WHERE Postal_Code IS NULL),
COUNT(*)FILTER (WHERE Region IS NULL),
COUNT(*)FILTER (WHERE Product_ID IS NULL),
COUNT(*)FILTER (WHERE Category IS NULL),
COUNT(*)FILTER (WHERE Sub_Category IS NULL),
COUNT(*)FILTER (WHERE Product_Name IS NULL),
COUNT(*)FILTER (WHERE Sales IS NULL),
COUNT(*)FILTER (WHERE Quantity IS NULL),
COUNT(*)FILTER (WHERE Discount IS NULL),
COUNT(*)FILTER (WHERE Profit IS NULL) FROM Superstore_Sales;

-- DATA EXPLORATION:
SELECT COUNT(DISTINCT(Order_ID)) AS "Unique Order ID", COUNT(DISTINCT(Customer_ID)) AS "Uniques Customer ID", COUNT(DISTINCT(Customer_Name)) AS "Uniques Customer Name" FROM Superstore_Sales;
SELECT MIN (Order_Date) AS "First Order Date",MAX (Order_Date) AS "last Order Date" FROM Superstore_Sales;
SELECT DISTINCT(Ship_Mode) AS "Uniques Ship mode" FROM Superstore_Sales;
SELECT COUNT(DISTINCT(CITY)) AS "No. City",Count(DISTINCT(State)) AS "No. State" FROM Superstore_Sales;
SELECT DISTINCT(Country) AS "No. Country" FROM Superstore_Sales;
SELECT DISTINCT(Region) AS "Regions" FROM Superstore_Sales;
SELECT DISTINCT(Segment) AS "Segments" FROM Superstore_Sales;
SELECT DISTINCT(Category) AS "Category" FROM Superstore_Sales;
SELECT DISTINCT(Sub_Category) AS "Sub_Category" FROM Superstore_Sales;
SELECT COUNT(DISTINCT(Product_Name)) AS "Unique Product Name"FROM Superstore_Sales;

-- DATA ANALYSIS:
-- 1-KPI ANALYSIS:

SELECT SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit" FROM Superstore_Sales;
SELECT SUM(Quantity) AS "Total Quantity" FROM Superstore_Sales;
SELECT ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin" FROM Superstore_Sales;
SELECT ROUND(SUM(Sales)/Count(DISTINCT(Order_ID)),2) AS "Avg. Order Value" FROM Superstore_Sales;

-- Category Analysis:

SELECT Category, SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit", 
ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin" 
FROM Superstore_Sales GROUP BY Category ORDER BY "Total Sales" DESC;

-- Sub_Category Analysis:
-- By Sales:
SELECT Sub_Category, SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit", ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin" 
FROM Superstore_Sales GROUP BY Sub_Category ORDER BY "Total Sales" DESC;
-- By Profit Margin:
SELECT Sub_Category, SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit", ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin" 
FROM Superstore_Sales GROUP BY Sub_Category ORDER BY "Profit Margin" DESC;

-- Top 10 Product:

SELECT Product_ID, Product_Name, SUM(Quantity) AS "Total Quantity", SUM(Sales) AS "Total Sales", 
SUM(Profit) AS "Total Profit",ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY Product_ID, Product_Name ORDER BY "Total Sales" DESC LIMIT 10;

-- Bottom 10 Products by Profit:

SELECT Product_ID, Product_Name, SUM(Quantity) AS "Total Quantity", SUM(Sales) AS "Total Sales",
SUM(Profit) AS "Total Profit",ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY Product_ID, Product_Name ORDER BY "Total Profit" LIMIT 10;

-- Regional and State analysis:

SELECT Region, SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit",ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY Region ORDER BY "Total Sales" DESC;
-- BY Sales:
SELECT State, SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit",ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY State ORDER BY "Total Sales" DESC LIMIT 10;
-- By Profit margin:
SELECT State, SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit",ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY State ORDER BY "Profit Margin" DESC LIMIT 10;
-- Segment Analysis:

SELECT Segment AS "Segments", SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit",ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY Segment ORDER BY "Total Sales" DESC;

-- Customer Analysis:

SELECT Customer_ID, Customer_Name, SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit"
FROM Superstore_Sales GROUP BY Customer_ID,  Customer_Name ORDER BY "Total Sales" DESC LIMIT 10;

-- Discount analysis:

SELECT Discount, SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit", ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY Discount ORDER BY Discount;

-- Yearly Sales Analysis:

SELECT EXTRACT(Year FROM Order_Date) AS "Years", SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit",ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY "Years" ORDER BY "Years";

-- Monthly Sales Analysis:

SELECT EXTRACT(Year FROM Order_Date) AS "Years",EXTRACT(MONTH FROM Order_Date) AS "Months", 
SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit", ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY "Years","Months" ORDER BY "Years","Months";

-- Ship Mode Analysis:
SELECT Ship_Mode,SUM(Sales) AS "Total Sales", SUM(Profit) AS "Total Profit",ROUND(SUM(Profit) / SUM(Sales)*100,2) AS "Profit Margin"
FROM Superstore_Sales GROUP BY Ship_Mode ORDER BY "Total Profit" DESC;
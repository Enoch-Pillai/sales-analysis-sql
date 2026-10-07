# Sales Analysis Using PostgreSQL

## Project Overview

This project analyzes sales data from a Superstore dataset using PostgreSQL.

The objective is to understand sales performance, profitability, customer behavior, product performance, regional trends, discount impact, and sales trends over time.

The analysis focuses on answering business questions using SQL and identifying actionable insights from the data.

---

## Business Objectives

- Analyze overall sales and profitability.
- Identify the best-performing product categories and sub-categories.
- Identify top-selling and least profitable products.
- Analyze sales and profitability across regions and states.
- Understand customer and segment performance.
- Analyze the impact of discounts on profitability.
- Identify yearly and monthly sales trends.
- Compare different shipping modes based on sales and profit.

---

## Dataset

The dataset contains Superstore sales transactions from **2011 to 2014**.

Key columns include:

- Order ID
- Order Date
- Ship Date
- Ship Mode
- Customer ID
- Customer Name
- Segment
- Country
- City
- State
- Postal Code
- Region
- Product ID
- Category
- Sub-Category
- Product Name
- Sales
- Quantity
- Discount
- Profit

The dataset contains **793 unique customers**.

---

## Tools & Technologies

- PostgreSQL
- SQL
- VS Code
- GitHub
- GitHub Desktop
- Excel

---

## Data Quality Checks

The dataset was checked for:

- Duplicate records
- NULL values
- Unique orders
- Unique customers
- Unique products
- Date range
- Distinct categories, sub-categories, regions, segments, and shipping modes

---

## Key Performance Indicators

| KPI | Value |
|---|---:|
| Total Sales | 2,297,200.86 |
| Total Profit | 286,397.02 |
| Total Quantity | 37,873 |
| Profit Margin | 12.47% |
| Average Order Value | 458.61 |
| Unique Customers | 793 |
| Order Period | 2011–2014 |

---

## Analysis & Key Insights

### 1. Category Analysis

- **Technology** generated the highest sales at approximately **836,154** and had a profit margin of **17.40%**.
- **Furniture** generated approximately **742,000** in sales but had the lowest profit margin at only **2.49%**.
- **Office Supplies** generated approximately **719,047** in sales with a strong profit margin of **17.04%**.
- Technology and Office Supplies showed stronger profitability compared with Furniture.

### 2. Sub-Category Analysis

- **Phones, Chairs, and Storage** were among the highest-selling sub-categories.
- **Labels, Paper, and Envelopes** had profit margins above **40%**, indicating strong profitability relative to their sales.

### 3. Product Analysis

The **Canon imageCLASS 2200 Advanced Copier** was the highest-selling product, generating approximately **61,599.82** in sales with a **40.91% profit margin**.

The least profitable products included:

- Cubify CubeX 3D Printer Double Head Print
- Lexmark MX611dhe Monochrome Laser Printer
- Cubify CubeX 3D Printer Triple Head Print

### 4. Regional & State Analysis

- The **West and East** regions were the strongest regions in terms of sales and profit.
- **California, New York, and Texas** were among the highest-selling states.
- **District of Columbia, Delaware, and Minnesota** had the highest profit margins.
- Texas generated high sales but showed relatively weak profitability.

### 5. Segment Analysis

- The **Consumer** segment generated the highest sales.
- The **Corporate** segment was the second-highest sales-generating segment.

### 6. Customer Analysis

- **Sean Miller** was the highest-selling customer but generated negative profit.
- **Tamara Chand, Raymond Buch, and Tom Ashbrook** were among the strong customers in terms of both sales and profit.

This shows why customer performance should be evaluated using both revenue and profitability rather than sales alone.

### 7. Discount Analysis

Discounts had a significant impact on profitability.

- Discounts above **30%** resulted in negative profit.
- An **80% discount** produced the lowest profit margin at approximately **-180%**.

This indicates that excessive discounting can significantly reduce or eliminate profitability.

### 8. Yearly Sales Analysis

Sales increased over the years, with **2013 and 2014** recording the highest sales.

This indicates an overall positive sales trend during the analyzed period.

### 9. Monthly Sales Analysis

The months from **September to December** generated the highest sales and profit.

This indicates stronger business activity toward the end of the year.

### 10. Ship Mode Analysis

**Standard Class** generated the highest sales and profit among the available shipping modes.

---

## Business Recommendations

Based on the analysis:

1. Focus on profitable categories such as Technology and Office Supplies.
2. Review the profitability of Furniture and identify ways to improve margins.
3. Control excessive discounts, especially discounts above 30%.
4. Investigate products that consistently generate low or negative profit.
5. Evaluate customers using both sales and profitability.
6. Use the September–December period for targeted inventory and marketing planning.
7. Compare sales performance with profit margins before making business decisions.

---

## SQL Skills Demonstrated

This project demonstrates the use of:

- `CREATE TABLE`
- `DROP TABLE`
- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- `LIMIT`
- `COUNT`
- `COUNT(DISTINCT)`
- `SUM`
- `MIN`
- `MAX`
- `ROUND`
- `EXTRACT`
- `FILTER`
- Aggregate functions
- Profit margin calculations
- Data quality checks
- Product analysis
- Customer analysis
- Regional analysis
- Time-series analysis

---

## Project Structure

```text
sales-analysis-sql/
├── dataset
│   └── Superstore.xlsx
├── screenshots/
│   ├── Category Analysis.png
│   ├── Discount Analysis.png
│   ├── Regional Analysis.png
│   ├── Yearly Sales.png
├── sql
│   └── Superstore_Sales_Analysis.sql
└── README.md
```

---

## Conclusion

This project analyzed Superstore sales data using PostgreSQL to evaluate overall sales and profitability, product and category performance, regional and state performance, customer and segment performance, discount impact, shipping modes, and yearly and monthly sales trends.

The analysis showed that Technology and Office Supplies were more profitable than Furniture, while excessive discounts had a negative impact on profitability. The analysis also identified high-performing products, customers, regions, and seasonal sales periods, along with products and customers that generated lower or negative profit.

Overall, the project demonstrates how SQL can be used to explore sales data, identify business patterns, and evaluate both revenue and profitability to support data-driven decision-making.
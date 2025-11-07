# BikeStores Analytics Dashboard 🚴‍♂️📊

#[SQL Queries](https://github.com/Mohamed-Nofal-DataAnalysis/BikeStores-Analytics-Dashboard-SQL/blob/main/SQLQuery1.sql)

**The ultimate collection of 10 powerful SQL queries** for the famous **BikeStores** sample database. Perfect for interviews, learning, or building a real analytics dashboard!

## Queries Included

| # | Query Name | Purpose |
|---|------------|--------|
| 1 | Customer Orders Timeline | Get customers with order date & required date |
| 2 | Customer Purchase Behavior | Total quantity & discount per customer |
| 3 | Store #1 Staff | Employees assigned to store ID = 1 |
| 4 | 2016 Best Sellers | Products quantity sold in 2016 |
| 5 | Avg Order Value per Customer | Customer spending pattern |
| 6 | Total Sales per Store | Store performance ranking |
| 7 | Top Selling Products | By quantity + revenue |
| 8 | Products per Category | Category inventory analysis |
| 9 | Sales Champions | Staff with highest sales |
| 10 | Loyal Customers | Customers with most orders |

## Database Schema
Based on the classic **BikeStores** sample database:
sales.customers, sales.orders, sales.order_items,
sales.stores, sales.staffs,
production.products, production.categories


## Usage Examples

```sql
-- Example: Top 5 customers by number of orders
SELECT TOP 5
    CONCAT(C.first_name,' ',C.last_name) AS Customer_Name,
    COUNT(DISTINCT O.order_id) AS Total_Orders
FROM sales.customers C
LEFT JOIN sales.orders O ON C.customer_id = O.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
ORDER BY Total_Orders DESC;

How to Use

Download the BikeStores sample database
Run bikestores.sql to create the DB
Copy any query from this repo
Paste & execute in SSMS, MySQL Workbench, or Azure Data Studio

Performance Tips

All queries use proper JOINs and GROUP BY
Add indexes on:
CREATE INDEX idx_orders_customer_id ON sales.orders(customer_id);
CREATE INDEX idx_order_items_order_id ON sales.order_items(order_id);

Contributing
Pull requests are welcome! أضف استعلام جديد وهيتشهر في الـ README
License
MIT © 2025 BikeStores Analytics Team

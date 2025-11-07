# BikeStores Analytics Dashboard 🚴‍♂️📊

![SQL](https://img.shields.io/badge/SQL-Queries-10-blue.svg)
![Database](https://img.shields.io/badge/Database-BikeStores-orange.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Awesome](https://img.shields.io/badge/Awesome-Yes-brightgreen.svg)

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

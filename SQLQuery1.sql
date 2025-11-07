

--   1_get customers names and the order data and the required date

SELECT 
		CONCAT ( C.first_name,' ',C.last_name) AS customer_name,
		O.order_date,
		O.required_date
FROM sales.customers AS C
LEFT JOIN sales.orders AS O
	ON C.customer_id=O.customer_id


---------------------------------------------------------------------------------

--  2- display customers names, quantity and the discount

SELECT 
		CONCAT ( C.first_name,' ',C.last_name) AS customer_name,
		SUM (OI.quantity) AS Total_quantity,
		sum (OI.discount) AS Total_discount
FROM sales.customers AS C
LEFT JOIN sales.orders AS O
	ON C.customer_id=O.customer_id
LEFT JOIN sales.order_items AS OI
	ON O.order_id=OI.order_id
GROUP BY C.first_name,
		 C.last_name
ORDER BY Total_quantity DESC


-------------------------------------------------------------------------------------

--  3-Get the store name and the full name of the employee assigned to each store where store id = 1

SELECT
		ST.store_name ,
		CONCAT (SF.first_name,' ' ,SF.last_name) AS Employee_Name
FROM sales.stores AS ST
LEFT JOIN sales.staffs AS SF
	ON ST.store_id=SF.store_id AND ST.store_id='1'


---------------------------------------------------------------------------------------

--  4-What are the products and the quantity that our customers bought in 2016?

SELECT 
		OI.product_id,
		SUM (OI.quantity) AS Total_Quantity	
FROM sales.orders AS O
LEFT JOIN sales.order_items AS OI
	ON O.order_id=OI.order_id	
WHERE YEAR (O.order_date)=2016
GROUP BY OI.product_id
ORDER BY Total_Quantity DESC

-----------------------------------------------------------------------------------------

-- 5-Find out the average order value per customer

SELECT 
		C.customer_id,
		CONCAT (C.first_name,' ' ,C.last_name) AS Customer_Name,
		AVG (OI.list_price) AS AVG_Price
FROM sales.customers AS C
LEFT JOIN sales.orders AS O
	ON C.customer_id=O.customer_id
LEFT JOIN sales.order_items AS OI
	ON O.order_id=OI.order_id
GROUP BY C.customer_id,
		 C.first_name,
		 C.last_name
ORDER BY AVG_Price DESC

---------------------------------------------------------------------------------------------

--  6_Calculate the total sales amount per store

SELECT
		S.store_id,
		S.store_name,
		SUM(OI.list_price) AS Total_Sales 
FROM sales.stores AS S
LEFT JOIN sales.orders AS O
	ON S.store_id=O.store_id
LEFT JOIN sales.order_items AS OI
	ON O.order_id=OI.order_id
GROUP BY S.store_id,
		 S.store_name
ORDER BY Total_Sales DESC

----------------------------------------------------------------------------------------------

--  7-List top-selling products (by quantity) and their total sales amount

SELECT 
		P.product_id,
		P.product_name,
		SUM(OI.quantity) AS Total_Quantity,
		SUM(OI.list_price) AS Total_Sales
FROM production.products AS P
LEFT JOIN sales.order_items AS OI 
	ON P.product_id=OI.product_id
GROUP BY P.product_id,
		 P.product_name
ORDER BY Total_Quantity DESC

------------------------------------------------------------------------------------------------

--  8-count the number of products in each category

SELECT 
		C.category_id,
		C.category_id,
		COUNT (DISTINCT P.product_id) AS Count_Products
FROM production.categories AS C
LEFT JOIN production.products AS P
	ON C.category_id=P.category_id
GROUP BY C.category_id,
		 C.category_id
ORDER BY Count_Products DESC

------------------------------------------------------------------------------------------------

--  9-List staff members who generated the highest total sales amount

SELECT 
		ST.staff_id,
		CONCAT (ST.first_name,' ' ,ST.last_name) AS Staff_Name,
		SUM (OI.list_price) AS Total_Sales
FROM sales.staffs AS ST
LEFT JOIN sales.orders AS O
	ON ST.staff_id=O.staff_id
LEFT JOIN sales.order_items AS OI
	ON O.order_id=OI.order_id
GROUP BY ST.staff_id,
		 ST.first_name,
		 ST.last_name
ORDER BY Total_Sales DESC

-------------------------------------------------------------------------------------------------

--  10-Identify customers who made the highest number of orders

SELECT 
		C.customer_id,
		CONCAT (C.first_name,' ' , C.last_name) AS Customer_Name,
		COUNT (DISTINCT S.order_id) AS Total_Orders
FROM sales.customers AS C
LEFT JOIN sales.orders AS S
	ON C.customer_id=S.customer_id
GROUP BY C.customer_id,
		 C.first_name,
		 C.last_name
ORDER BY Total_Orders DESC

--------------------------------------------------------------------------------------------------
create database pizza_sales;
use pizza_sales;
select * from pizza_Sales;


-- KPIs
-- Total revenue
select sum(total_price) as Total_Revenue from pizza_sales;

-- Average Order value
select sum(total_price)/count(distinct order_id) as Average_order_Value from pizza_sales;

-- Total Pizza Sold
select sum(quantity) as Total_pizza_sold from pizza_sales;

-- Total Orders
select count(distinct order_id) as Total_Orders from pizza_sales;

-- Average Pizza per order
select cast((sum(quantity)/ count(distinct order_id)) as decimal (10,2)) as Avg_Pizzas_per_order from pizza_sales;

-- Daily Trend for Total Orders
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY order_day
ORDER BY DAYOFWEEK(MIN(order_date));

-- Monthly Trend for Total Orders
SELECT MONTHNAME(order_date) AS order_month, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_month;

-- Percentage Sales by Pizza Category
SELECT pizza_category AS pizza_Category, CAST(SUM(total_price) as decimal (10,2)) AS Total_Revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_Category;

-- Percentage Sales by Pizza Size
SELECT pizza_size AS pizza_size, CAST(SUM(total_price) as decimal (10,2)) AS Total_Revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;

-- Ttotal Pizza sold by Pizza Category
SELECT pizza_category AS pizza_category, SUM(quantity) as Total_Qty_Sold
FROM pizza_sales
GROUP BY pizza_CATEGORY
ORDER BY Total_Qty_Sold DESC;

-- Top 5 pizzas by revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Bottom 5 pizzas by revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue
LIMIT 5;

-- Top 5 pizzas by quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

-- Bottom 5 pizzas by quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold
LIMIT 5;

-- Top 5 pizzas by Total orders

SELECT pizza_name as pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5;

-- Botttom 5 pizzas by Total orders

SELECT pizza_name as pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders 
limit 5;


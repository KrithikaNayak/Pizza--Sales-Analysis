select * from pizza_sales;


select sum(TOTAL_PRICE)as Total_revenue from pizza_sales;
select sum(TOTAL_PRICE)/count (distinct order_id)  as avg_order from pizza_sales;
select sum(quantity) as total_pizza_sold from pizza_sales;
SELECT count(DISTINCT order_id) as Total_order from pizza_sales;
select sum(quantity)/count(distinct order_id) as avg_pizzas_per_order from pizza_sales;

select order_date, count(distinct order_id)as total_orders 
from pizza_sales 
group by order_date
order by order_date; --daily trend for total orders


select to_char(to_date(order_date,'dd-mm-yy'),'mon-yyyy')as month,
COUNT(distinct order_id)as total_orders
from pizza_sales 
group by order_date
order by order_date;--monthly trend for total orders

select to_char(order_date,'yyyy-mon')as order_month,count(distinct order_id) as total_orders
from pizza_sales
group by  to_char(order_date, 'yyyy-mon')
order by MIN(order_date);

-- percentage of sales by pizza category 
select pizza_category, sum(total_price)*100/(select sum(total_price)from pizza_sales) as percentage_of_totalsales
from pizza_sales
group by pizza_category;

select pizza_category,round (sum(total_price)*100/(select sum(total_price)from pizza_sales),2) as percentage_of_totalsales
from pizza_sales
group by pizza_category;
 
select pizza_category,round (sum(total_price)*100/(select sum(total_price)from pizza_sales),2) as percentage_of_totalsales
from pizza_sales
where extract (month from order_date)=1
group by pizza_category
order by percentage_of_totalsales DESC; -- percentage of sales by pizza category for january month

select pizza_size,round (sum(total_price)*100/(select sum(total_price)from pizza_sales),2) as percentage_of_totalsales
from pizza_sales
group by pizza_size;  -- percentage of sales by pizza size

select pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue DESC
fetch  first 5 rows only; -- top 5 best sellers by revenue 

select pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue ASC
fetch  first 5 rows only; -- top 5 least sellers by revenue 

select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity DESC
fetch  first 5 rows only; -- top 5 best sellers by quantity

select pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity ASC
fetch  first 5 rows only; -- top 5 least sellers by quantity

select pizza_name, count(order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders DESC
fetch  first 5 rows only; -- top 5 best sellers by order_id

select pizza_name, count(order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders ASC
fetch  first 5 rows only; -- top 5 least sellers by order_id












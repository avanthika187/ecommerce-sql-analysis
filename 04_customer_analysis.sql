/* Which customers generate the most revenue? */
SELECT 
	c.customer_name, 
	SUM(p.price * io.quantity) as revenue
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items io
	ON o.order_id = io.order_id 
JOIN products p 
	ON io.product_id = p.product_id
WHERE o.status != 'Cancelled'
GROUP BY c.customer_id, c.customer_name
ORDER BY revenue desc;
    

/*How many orders has each customer placed?*/
SELECT 
	c.customer_name, count(o.order_id) AS total_orders
FROM customers c 
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_name, c.customer_id
ORDER BY total_orders DESC;


/*Which customers generate the most revenue?*/
SELECT
    c.customer_id,
    c.customer_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status != 'Cancelled'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;


/*Which customers have placed more than one order?*/
SELECT 
	c.customer_name, count(o.order_id) as orders_placed
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING count(o.order_id) > 1;


/*Which cities have the largest customer base?*/
SELECT 
	c.city, 
	count(customer_id) as orders_placed
FROM customers c
GROUP BY c.city
ORDER BY orders_placed DESC;



/*Which cities generate the most revenue?*/
SELECT 
	c.city, sum(p.price * oi.quantity) as city_revenue
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
	ON oi.product_id = p.product_id
WHERE o.status = 'Cancelled'
GROUP BY c.city
ORDER BY city_revenue desc;

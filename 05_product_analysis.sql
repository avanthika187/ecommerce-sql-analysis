/*Which products generate the most revenue? */
SELECT 
	p.product_name, SUM(p.price * oi.quantity) AS Total_Revenue
FROM orders o
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status != 'Cancelled'    
GROUP BY Product_name 
ORDER BY Total_Revenue DESC 
LIMIT 5;  



/*Which product has sold the most units?*/
SELECT 
	p.product_id, p.product_name, sum(oi.quantity) as max_units
FROM orders o
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status != 'Cancelled' 
GROUP BY p.product_name, p.product_id
ORDER BY max_units desc
LIMIT 1;


/* Which product categories generate the most revenue? */
SELECT
    p.category,
    SUM(p.price * oi.quantity) AS category_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY p.category
ORDER BY category_revenue DESC;

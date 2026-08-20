DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM products;
DELETE FROM customers;


-- Customers data
INSERT INTO customers (customer_id, customer_name, city, email)
SELECT
    n,
    CASE ((n - 1) % 20)
        WHEN 0 THEN 'Arun Kumar'
        WHEN 1 THEN 'Priya Sharma'
        WHEN 2 THEN 'Rahul Mehta'
        WHEN 3 THEN 'Sneha Iyer'
        WHEN 4 THEN 'Karthik Rao'
        WHEN 5 THEN 'Ananya Das'
        WHEN 6 THEN 'Vikram Singh'
        WHEN 7 THEN 'Divya Nair'
        WHEN 8 THEN 'Rohit Verma'
        WHEN 9 THEN 'Meera Joshi'
        WHEN 10 THEN 'Aditya Patel'
        WHEN 11 THEN 'Nisha Reddy'
        WHEN 12 THEN 'Sanjay Gupta'
        WHEN 13 THEN 'Pooja Menon'
        WHEN 14 THEN 'Rakesh Shah'
        WHEN 15 THEN 'Kavya Rao'
        WHEN 16 THEN 'Manish Jain'
        WHEN 17 THEN 'Neha Kapoor'
        WHEN 18 THEN 'Suresh Nair'
        WHEN 19 THEN 'Aisha Khan'
    END || ' ' || n,
    CASE ((n - 1) % 10)
        WHEN 0 THEN 'Chennai'
        WHEN 1 THEN 'Bangalore'
        WHEN 2 THEN 'Mumbai'
        WHEN 3 THEN 'Hyderabad'
        WHEN 4 THEN 'Delhi'
        WHEN 5 THEN 'Pune'
        WHEN 6 THEN 'Kolkata'
        WHEN 7 THEN 'Kochi'
        WHEN 8 THEN 'Ahmedabad'
        WHEN 9 THEN 'Jaipur'
    END,
    'customer' || n || '@email.com'
FROM (
    WITH RECURSIVE nums(n) AS (
        SELECT 1
        UNION ALL
        SELECT n + 1 FROM nums WHERE n < 100
    )
    SELECT n FROM nums
);


--Products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Wireless Mouse', 'Accessories', 799),
(2, 'Mechanical Keyboard', 'Accessories', 2499),
(3, 'USB-C Charger', 'Electronics', 1299),
(4, 'Bluetooth Headphones', 'Audio', 3499),
(5, 'Smart Watch', 'Wearables', 5999),
(6, 'Laptop Stand', 'Accessories', 1899),
(7, 'Power Bank', 'Electronics', 2199),
(8, 'Wireless Earbuds', 'Audio', 2999),
(9, 'Webcam', 'Electronics', 2799),
(10, 'Fitness Band', 'Wearables', 2499),
(11, 'Portable SSD', 'Storage', 4499),
(12, 'USB Hub', 'Accessories', 1499),
(13, 'Gaming Mouse', 'Gaming', 1599),
(14, 'Gaming Keyboard', 'Gaming', 3299),
(15, 'Gaming Headset', 'Gaming', 3999),
(16, 'Bluetooth Speaker', 'Audio', 2599),
(17, 'Smartphone Stand', 'Accessories', 699),
(18, 'Fast Charging Cable', 'Electronics', 599),
(19, 'Laptop Backpack', 'Accessories', 2299),
(20, 'Monitor Light', 'Accessories', 1799),
(21, 'Smart Plug', 'Smart Home', 1299),
(22, 'Smart LED Bulb', 'Smart Home', 899),
(23, 'Fitness Tracker', 'Wearables', 2999),
(24, 'Smart Scale', 'Wearables', 3499),
(25, 'Wireless Controller', 'Gaming', 2999),
(26, 'External Hard Drive', 'Storage', 5299),
(27, 'Tablet Stand', 'Accessories', 1199),
(28, 'Noise Cancelling Headphones', 'Audio', 6499),
(29, '4K Webcam', 'Electronics', 4999),
(30, 'Smart Fitness Watch', 'Wearables', 7999);


--Orders data
INSERT INTO orders (order_id, customer_id, order_date, status)
SELECT
    1000 + n,
    ((n - 1) % 100) + 1,
    date('2025-01-01', '+' || ((n - 1) % 210) || ' days'),
    CASE
        WHEN n % 15 = 0 THEN 'Cancelled'
        WHEN n % 7 = 0 THEN 'Shipped'
        ELSE 'Delivered'
    END
FROM (
    WITH RECURSIVE nums(n) AS (
        SELECT 1
        UNION ALL
        SELECT n + 1 FROM nums WHERE n < 300
    )
    SELECT n FROM nums
);


--Order Items data
INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
SELECT
    ((o.order_id - 1001) * 3) + item_no,
    o.order_id,
    ((o.order_id - 1000 + item_no * 7) % 30) + 1,
    ((o.order_id + item_no) % 3) + 1
FROM orders o
CROSS JOIN (
    SELECT 1 AS item_no
    UNION ALL
    SELECT 2
    UNION ALL
    SELECT 3
) items;
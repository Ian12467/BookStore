-- This SQL script is designed to analyze data from a book store database.

-- Get all books along with their authors
SELECT b.title, a.first_name, a.last_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id;

-- List all customers and their current addresses
SELECT c.first_name, c.last_name, a.street, a.city, a.postal_code, co.country_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country co ON a.country_id = co.country_id
JOIN address_status ast ON ca.address_status_id = ast.status_id
WHERE ast.status_name = 'current';

-- Show all orders with customer names and shipping methods
SELECT o.order_id, c.first_name, c.last_name, o.order_date, sm.method_name
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN shipping_method sm ON o.shipping_method_id = sm.shipping_method_id;

-- View order line details with book titles
SELECT ol.order_id, b.title, ol.quantity, ol.price
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id;

-- Track order history for a specific order
SELECT oh.order_id, os.status_name, oh.change_date
FROM order_history oh
JOIN order_status os ON oh.status_id = os.status_id
WHERE oh.order_id = 1;

-- Total number of books sold by publisher
SELECT p.publisher_name, SUM(ol.quantity) AS total_books_sold
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY p.publisher_name;

-- Total revenue generated per customer
SELECT c.customer_id, c.first_name, c.last_name, SUM(ol.price) AS total_spent
FROM customer c
JOIN cust_order o ON c.customer_id = o.customer_id
JOIN order_line ol ON o.order_id = ol.order_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Most frequently ordered book
SELECT b.title, COUNT(*) AS times_ordered
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
GROUP BY b.title
ORDER BY times_ordered DESC
LIMIT 1;

-- Average order value by shipping method
SELECT sm.method_name, AVG(total_order_value) AS avg_order_value
FROM (
  SELECT o.shipping_method_id, SUM(ol.price) AS total_order_value
  FROM cust_order o
  JOIN order_line ol ON o.order_id = ol.order_id
  GROUP BY o.order_id
) sub
JOIN shipping_method sm ON sub.shipping_method_id = sm.shipping_method_id
GROUP BY sm.method_name;

-- Daily sales totals
SELECT o.order_date, SUM(ol.price) AS daily_total
FROM cust_order o
JOIN order_line ol ON o.order_id = ol.order_id
GROUP BY o.order_date
ORDER BY o.order_date;
-- Test Queries
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

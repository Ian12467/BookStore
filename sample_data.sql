-- INSERT statements to populate the bookstore database

-- book_language
INSERT INTO book_language (language_name) VALUES ('English'), ('French'), ('Spanish');

-- publisher
INSERT INTO publisher (publisher_name) VALUES ('Penguin Books'), ('HarperCollins'), ('Oxford University Press');

-- book
INSERT INTO book (title, isbn, publication_year, price, publisher_id, language_id)
VALUES
('The Great Gatsby', '9780743273565', 1925, 12.99, 1, 1),
('Le Petit Prince', '9780156013987', 1943, 9.99, 2, 2),
('Don Quixote', '9788491050295', 1605, 15.50, 3, 3);

-- author
INSERT INTO author (first_name, last_name)
VALUES
('F. Scott', 'Fitzgerald'),
('Antoine', 'de Saint-Exupéry'),
('Miguel', 'de Cervantes');

-- book_author
INSERT INTO book_author (book_id, author_id)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- country
INSERT INTO country (country_name)
VALUES ('USA'), ('France'), ('Spain');

-- address
INSERT INTO address (street, city, postal_code, country_id)
VALUES
('123 Main St', 'New York', '10001', 1),
('456 Rue de Paris', 'Paris', '75001', 2),
('789 Calle Mayor', 'Madrid', '28001', 3);

-- address_status
INSERT INTO address_status (status_name)
VALUES ('current'), ('old');

-- customer
INSERT INTO customer (first_name, last_name, email, phone_number)
VALUES
('John', 'Doe', 'john@example.com', '1234567890'),
('Jane', 'Smith', 'jane@example.com', '0987654321');

-- customer_address
INSERT INTO customer_address (customer_id, address_id, address_status_id)
VALUES
(1, 1, 1),
(2, 2, 1);

-- shipping_method
INSERT INTO shipping_method (method_name)
VALUES ('Standard'), ('Express');

-- order_status
INSERT INTO order_status (status_name)
VALUES ('pending'), ('shipped'), ('delivered');

-- cust_order
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, order_status_id)
VALUES
(1, '2025-04-01', 1, 1),
(2, '2025-04-02', 2, 2);

-- order_line
INSERT INTO order_line (order_id, book_id, quantity, price)
VALUES
(1, 1, 2, 25.98),
(2, 2, 1, 9.99);

-- order_history
INSERT INTO order_history (order_id, status_id, change_date)
VALUES
(1, 1, '2025-04-01 10:00:00'),
(2, 2, '2025-04-02 15:00:00');

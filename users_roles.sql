CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPass123';
GRANT ALL PRIVILEGES ON BookStoreDB.* TO 'admin_user'@'localhost';

CREATE USER 'sales_user'@'localhost' IDENTIFIED BY 'SalesPass123';
GRANT SELECT, INSERT, UPDATE ON BookStoreDB.cust_order TO 'sales_user'@'localhost';
GRANT SELECT ON BookStoreDB.book TO 'sales_user'@'localhost';
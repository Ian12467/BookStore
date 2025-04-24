CREATE TABLE `book_language` (
  `language_id` integer PRIMARY KEY,
  `language_name` varchar(255)
);

CREATE TABLE `publisher` (
  `publisher_id` integer PRIMARY KEY,
  `publisher_name` varchar(255)
);

CREATE TABLE `book` (
  `book_id` integer PRIMARY KEY,
  `title` varchar(255),
  `isbn` varchar(255),
  `publication_year` year,
  `price` decimal,
  `publisher_id` integer,
  `language_id` integer
);

CREATE TABLE `author` (
  `author_id` integer PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255)
);

CREATE TABLE `book_author` (
  `book_id` integer,
  `author_id` integer
);

CREATE TABLE `country` (
  `country_id` integer PRIMARY KEY,
  `country_name` varchar(255)
);

CREATE TABLE `address` (
  `address_id` integer PRIMARY KEY,
  `street` varchar(255),
  `city` varchar(255),
  `postal_code` varchar(255),
  `country_id` integer
);

CREATE TABLE `address_status` (
  `status_id` integer PRIMARY KEY,
  `status_name` varchar(255)
);

CREATE TABLE `customer` (
  `customer_id` integer PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `email` varchar(255),
  `phone_number` varchar(255)
);

CREATE TABLE `customer_address` (
  `customer_address_id` integer PRIMARY KEY,
  `customer_id` integer,
  `address_id` integer,
  `address_status_id` integer
);

CREATE TABLE `shipping_method` (
  `shipping_method_id` integer PRIMARY KEY,
  `method_name` varchar(255)
);

CREATE TABLE `order_status` (
  `status_id` integer PRIMARY KEY,
  `status_name` varchar(255)
);

CREATE TABLE `cust_order` (
  `order_id` integer PRIMARY KEY,
  `customer_id` integer,
  `order_date` date,
  `shipping_method_id` integer,
  `order_status_id` integer
);

CREATE TABLE `order_line` (
  `order_line_id` integer PRIMARY KEY,
  `order_id` integer,
  `book_id` integer,
  `quantity` integer,
  `price` decimal
);

CREATE TABLE `order_history` (
  `history_id` integer PRIMARY KEY,
  `order_id` integer,
  `status_id` integer,
  `change_date` timestamp
);

ALTER TABLE `book` ADD FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`);

ALTER TABLE `book` ADD FOREIGN KEY (`language_id`) REFERENCES `book_language` (`language_id`);

ALTER TABLE `book_author` ADD FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`);

ALTER TABLE `book_author` ADD FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

ALTER TABLE `address` ADD FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

ALTER TABLE `customer_address` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

ALTER TABLE `customer_address` ADD FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

ALTER TABLE `customer_address` ADD FOREIGN KEY (`address_status_id`) REFERENCES `address_status` (`status_id`);

ALTER TABLE `cust_order` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

ALTER TABLE `cust_order` ADD FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`shipping_method_id`);

ALTER TABLE `cust_order` ADD FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`status_id`);

ALTER TABLE `order_line` ADD FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`);

ALTER TABLE `order_line` ADD FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`);

ALTER TABLE `order_history` ADD FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`);

ALTER TABLE `order_history` ADD FOREIGN KEY (`status_id`) REFERENCES `order_status` (`status_id`);

/*
=====================================================
DATABASE SETUP FOR BIKE STORE - TABLE CREATION & DATA IMPORT
=====================================================
This script sets up the complete Bike Store database schema 
and imports data from CSV files.

WORKFLOW:
1. Creates all necessary tables with appropriate data types
2. Imports CSV data into each table
3. Displays sample data to verify successful import

TABLES CREATED (in order):
- stores        : Store locations and contact info
- stocks        : Inventory levels by store and product
- staffs        : Employees and their managers
- products      : Product catalog with prices
- orders        : Sales orders header information
- order_items   : Line items for each order
- customers     : Customer details
- categories    : Product categories
- brands        : Product brands

DATA SOURCE: CSV files located in 'C:\Projeto_SQL\Bike_Store\' (of course, you should've edit it for your local computer)
FILE FORMAT: CSV with headers, comma delimited, UTF-8 encoding

NOTE: Tables with foreign keys should be created in the correct order
to maintain referential integrity.

------------------------------------------------------------------------------------------------------------
*/


-----------------------
-- Stores Table Import
-----------------------

CREATE TABLE stores (
    store_id INTEGER PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(2),
    zip_code VARCHAR(10)
);


COPY stores FROM 'C:\Projeto_SQL\Bike_Store\stores.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8');

SELECT * FROM stores;

-----------------------
-- Stocks Table Import
-----------------------
CREATE TABLE stocks (
    store_id INTEGER,
    product_id INTEGER,
    quantity INTEGER
);


COPY stocks FROM 'C:\Projeto_SQL\Bike_Store\stocks.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8');

SELECT * FROM stocks;




-----------------------
-- Staffs Table Import
-----------------------
CREATE TABLE staffs (
    staff_id INTEGER PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
	phone VARCHAR(50),
    active INTEGER,
    store_id INTEGER,
    manager_id INTEGER
);


COPY staffs FROM 'C:\Projeto_SQL\Bike_Store\staffs.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8', NULL 'NULL');

SELECT * FROM staffs;




-----------------------
-- Products Table Import
-----------------------
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR NOT NULL,
	brand_id INTEGER,
    category_id INTEGER,
	model_year INTEGER,
    list_price FLOAT
);


COPY products FROM 'C:\Projeto_SQL\Bike_Store\products.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8', NULL 'NULL');

SELECT * FROM products;




-----------------------
-- Orders Table Import
-----------------------
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
	order_status INTEGER,
    order_date VARCHAR,
	required_date VARCHAR,
    shipped_date VARCHAR, 
	store_id INTEGER,
	staff_id INTEGER
);


COPY orders FROM 'C:\Projeto_SQL\Bike_Store\orders.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8', NULL 'NULL');

SELECT * FROM orders;





-----------------------
-- Order Items Table Import
-----------------------
CREATE TABLE order_items (
    order_id INTEGER,
    item_id INTEGER,
	product_id INTEGER,
    quantity INTEGER,
	list_price FLOAT,
    discount FLOAT
);


COPY order_items FROM 'C:\Projeto_SQL\Bike_Store\order_items.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8', NULL 'NULL');

SELECT * FROM order_items;




-----------------------
-- Custumers Table Import
-----------------------
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR,
	last_name VARCHAR,
    phone VARCHAR,
	email VARCHAR,
    street VARCHAR, 
	city VARCHAR,
	state VARCHAR,
	zip_code INTEGER
);


COPY customers FROM 'C:\Projeto_SQL\Bike_Store\customers.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8', NULL 'NULL');

SELECT * FROM customers;






-----------------------
-- Categories Table Import
-----------------------
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name VARCHAR
);


COPY categories FROM 'C:\Projeto_SQL\Bike_Store\categories.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8', NULL 'NULL');

SELECT * FROM categories;




-----------------------
-- Brands Table Import
-----------------------
CREATE TABLE brands (
    brand_id INTEGER PRIMARY KEY,
    brand_name VARCHAR
);


COPY brands FROM 'C:\Projeto_SQL\Bike_Store\brands.csv' 
WITH (FORMAT csv, DELIMITER ',', HEADER true, ENCODING 'UTF8', NULL 'NULL');

SELECT * FROM brands;

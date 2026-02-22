/*
=====================================================
DATA QUALITY CHECK FOR BIKE STORE DATABASE
=====================================================
This script performs an exploratory data quality analysis
to ensure data integrity before business analysis.

It checks for:
- NULL values in critical columns
- Invalid data (negative prices, quantities, out-of-range discounts)
- Date format inconsistencies
- Orphan records (orders without items)
- Unsold products (inventory analysis)

The results will help clean the data and identify
potential issues in the business processes.
--------------------------------------------------------------------------------------------------------------------------
*/



SELECT COUNT(*) AS null_prices
FROM products
WHERE list_price IS NULL;

SELECT COUNT(*) AS null_quantity
FROM order_items
WHERE quantity IS NULL;

SELECT COUNT(*) AS null_discount
FROM order_items
WHERE discount IS NULL;

SELECT COUNT(*) AS null_order_date
FROM orders
WHERE order_date IS NULL;



----



SELECT *
FROM products
WHERE list_price <= 0;


SELECT *
FROM order_items
WHERE quantity <= 0;


SELECT *
FROM order_items
WHERE discount < 0 OR discount > 1;



----


SELECT order_id, order_date
FROM orders
WHERE order_date !~ '^\d{4}-\d{2}-\d{2}$';


----


SELECT o.order_id
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;




-----

SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;



WITH unsold AS (
  SELECT p.product_id
  FROM products p
  LEFT JOIN order_items oi ON p.product_id = oi.product_id
  WHERE oi.product_id IS NULL
),
total AS (
  SELECT COUNT(*) AS total_products FROM products
)
SELECT
  (SELECT COUNT(*) FROM unsold) AS unsold_products,
  (SELECT total_products FROM total) AS total_products,
  ROUND(100.0 * (SELECT COUNT(*) FROM unsold) / (SELECT total_products FROM total), 2) AS pct_unsold;


SELECT
  c.category_name,
  b.brand_name,
  COUNT(*) AS unsold_count
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN categories c ON p.category_id = c.category_id
LEFT JOIN brands b ON p.brand_id = b.brand_id
WHERE oi.product_id IS NULL
GROUP BY c.category_name, b.brand_name
ORDER BY unsold_count DESC, c.category_name, b.brand_name;


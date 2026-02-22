/*
=====================================================
VIEW: vw_sales_base
=====================================================
Purpose: Create a consolidated sales view joining all key tables
         to serve as the primary data source for analysis

Source Tables:
- orders        : Order header (dates, customer info)
- order_items   : Line items (products, quantities, prices)
- products      : Product details
- brands        : Brand names (LEFT JOIN to include products without brands)
- categories    : Category names (LEFT JOIN to include products without categories)

Calculated Field:
- net_revenue   : quantity * list_price * (1 - discount)
                  (actual revenue after discounts)

Usage: This view simplifies complex queries by providing
       a single source for all sales analysis needs.
       Used by subsequent revenue and performance queries.

Note: LEFT JOIN for brands/categories ensures no products are excluded
      even if they're missing reference data.
---------------------------------------------
*/

CREATE OR REPLACE VIEW vw_sales_base AS
SELECT
    o.order_id,
    o.order_date,
    oi.product_id,
    p.product_name,
    p.brand_id,
    b.brand_name,
    p.category_id,
    c.category_name,
    oi.quantity,
    oi.list_price,
    oi.discount,
    oi.quantity * oi.list_price * (1 - oi.discount) AS net_revenue
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
LEFT JOIN brands b 
    ON p.brand_id = b.brand_id
LEFT JOIN categories c 
    ON p.category_id = c.category_id;


SELECT * FROM vw_sales_base;
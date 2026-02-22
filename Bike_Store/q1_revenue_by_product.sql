/*
=====================================================
TOP 20 BEST-SELLING PRODUCTS
=====================================================
Purpose: Identify the 20 products with highest revenue
Source: vw_sales_base view (consolidated sales data)

Fields:
- product_name   : Product name
- brand_name     : Associated brand
- category_name  : Product category
- total_revenue  : Sum of net revenue per product
- total_units    : Total quantity sold per product

Sorting: Ranked by highest revenue (descending)
Limit: Top 20 products only
---------------------------------------------
*/

SELECT
    product_name,
    brand_name,
    category_name,
    SUM(net_revenue) AS total_revenue,
    SUM(quantity) AS total_units
FROM vw_sales_base
GROUP BY product_name, brand_name, category_name
ORDER BY total_revenue DESC
LIMIT 20;

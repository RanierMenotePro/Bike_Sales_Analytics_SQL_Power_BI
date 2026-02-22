/*
=====================================================
CATEGORY PERFORMANCE ANALYSIS
=====================================================
Purpose: Calculate total revenue and units sold by product category
Source: vw_sales_base view (consolidated sales data)

Metrics:
- category_name  : Product category
- total_revenue  : Sum of net revenue per category
- total_units    : Total quantity sold per category

Sorting: Categories with highest revenue appear first
---------------------------------------------
*/

SELECT
    category_name,
    SUM(net_revenue) AS total_revenue,
    SUM(quantity) AS total_units
FROM vw_sales_base
GROUP BY category_name
ORDER BY total_revenue DESC;

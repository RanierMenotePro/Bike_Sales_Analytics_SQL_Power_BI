/*
=====================================================
BRAND PERFORMANCE ANALYSIS
=====================================================
Purpose: Calculate total revenue and units sold by brand
Source: vw_sales_base view (consolidated sales data)

Metrics:
- brand_name    : Product brand
- total_revenue : Sum of net revenue per brand
- total_units   : Total quantity sold per brand

Sorting: Brands with highest revenue appear first
----------------------------------------------------------------------------------------------------------
*/

SELECT
    brand_name,
    SUM(net_revenue) AS total_revenue,
    SUM(quantity) AS total_units
FROM vw_sales_base
GROUP BY brand_name
ORDER BY total_revenue DESC;

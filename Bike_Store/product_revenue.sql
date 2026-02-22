/*
=====================================================
PRODUCT REVENUE DISTRIBUTION ANALYSIS 
=====================================================
Purpose: Calculate revenue contribution and cumulative share per product
         to identify which products drive most of the business

Source: vw_sales_base view

CTE Workflow:
1. product_revenue : Aggregates revenue by product
2. ranked          : Adds ranking and total company revenue

Output Metrics:
- product_id        : Unique product identifier
- product_name      : Product description
- total_revenue     : Individual product revenue
- company_revenue   : Total revenue across all products
- revenue_share     : % of total revenue for each product
- cumulative_share  : Running total % 

Sorting: Descending by revenue to show top contributors first
---------------------------------------------
*/



WITH product_revenue AS (
    SELECT
        product_id,
        product_name,
        SUM(net_revenue) AS total_revenue
    FROM vw_sales_base
    GROUP BY product_id, product_name
),
ranked AS (
    SELECT *,
           RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank,
           SUM(total_revenue) OVER () AS company_revenue
    FROM product_revenue
)
SELECT
    product_id,
    product_name,
    total_revenue,
    company_revenue,
    total_revenue / company_revenue AS revenue_share,
    SUM(total_revenue) OVER (
        ORDER BY total_revenue DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) / company_revenue AS cumulative_share
FROM ranked
ORDER BY total_revenue DESC;

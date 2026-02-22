/*
=====================================================
VIEW: vw_product_revenue_share
=====================================================
Purpose: Calculate revenue contribution percentage for each product
         to support ABC/Pareto analysis (80/20 rule)

Source: order_items, products, categories, brands

CTE Workflow:
1. product_revenue : Aggregates total revenue by product with category/brand
2. ranked          : Adds company-wide total revenue

Output Fields:
- product_id       : Unique product identifier
- product_name     : Product description
- category_name    : Product category
- brand_name       : Product brand
- total_revenue    : Lifetime revenue for this product
- company_revenue  : Total revenue across all products
- revenue_share    : % of company revenue this product represents
                    (total_revenue / company_revenue)

Formula Note:
oi.quantity * oi.list_price * (1 - oi.discount) = net_revenue after discounts

Usage: This view enables quick identification of top-performing products
       and their relative importance to the business.
---------------------------------------------
*/

CREATE VIEW vw_product_revenue_share AS
WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        c.category_name,
        b.brand_name,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.product_id
    JOIN categories c
        ON p.category_id = c.category_id
    JOIN brands b
        ON p.brand_id = b.brand_id
    GROUP BY
        p.product_id,
        p.product_name,
        c.category_name,
        b.brand_name
),
ranked AS (
    SELECT
        *,
        SUM(total_revenue) OVER () AS company_revenue
    FROM product_revenue
)
SELECT
    *,
    total_revenue / company_revenue AS revenue_share
FROM ranked;

---oi.quantity * oi.list_price * (1 - oi.discount)
SELECT 
        p.product_id,
        p.product_name,
        p.category,
        p.unit_cost,
        SUM(ABS(oi.quantity)) AS units_sold,
        ROUND(SUM(ABS(oi.unit_price) * oi.quantity * (1 - oi.discount_pct / 100)), 2) AS revenue,
        SUM(p.unit_cost * oi.quantity) AS total_cost
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON o.order_id = oi.order_id
    WHERE p.product_status = 'Active'
      AND oi.quantity > 0
      AND oi.discount_pct BETWEEN 0 AND 100
      AND p.category IS NOT NULL
    GROUP BY
        p.product_id,
        p.product_name,
        p.category,
        p.unit_cost;
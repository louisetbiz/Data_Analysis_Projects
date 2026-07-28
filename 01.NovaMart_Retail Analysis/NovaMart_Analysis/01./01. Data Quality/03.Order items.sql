-- Order Items
-- 3 orders with negative quantities
-- 1 product, product_id 30, has negative price
-- discount_pct with 120%

SELECT * FROM order_items
WHERE quantity > 0
AND unit_price > 0
AND discount_pct BETWEEN 0 AND 100
;

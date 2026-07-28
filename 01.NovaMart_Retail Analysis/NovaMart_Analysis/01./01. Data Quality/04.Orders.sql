-- Orders
-- 144 orders with campaign_id NULL

SELECT * FROM orders
;

SELECT COUNT(*) FROM orders
WHERE campaign_id is NULL
;
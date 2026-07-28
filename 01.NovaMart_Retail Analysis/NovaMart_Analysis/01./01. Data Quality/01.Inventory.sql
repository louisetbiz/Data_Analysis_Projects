-- Inventory:
-- 3 products with negative stock

SELECT count(*) AS negative_items_stock FROM inventory
WHERE stock_on_hand < 0;
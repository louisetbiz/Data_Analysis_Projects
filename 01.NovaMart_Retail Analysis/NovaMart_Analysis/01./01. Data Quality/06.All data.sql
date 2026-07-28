
SELECT *

FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
	ON oi.product_id = p.product_id
JOIN stores s
	ON o.store_id = s.store_id
JOIN marketing_campaigns mc
	ON o.campaign_id = mc.campaign_id
JOIN inventory i
	ON i.store_id = s.store_id
	AND i.product_id = p.product_id

WHERE 
	 oi.discount_pct BETWEEN 0 AND 100
	AND o.order_status = 'Completed'
	AND c.age > 0
	AND i.stock_on_hand > 0
	AND DATEDIFF (mc.end_date,mc.start_date) > 0
    ;
    
   







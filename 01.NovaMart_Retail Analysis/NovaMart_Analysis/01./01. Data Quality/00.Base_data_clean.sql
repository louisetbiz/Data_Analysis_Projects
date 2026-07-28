
SELECT 
	c.customer_id,
    o.order_id,
    month(o.order_date) AS month_order,
    ABS(oi.unit_price) AS unit_price_clean,
    ABS(oi.quantity) AS quantity_clean,
    ROUND(ABS(oi.unit_price) * ABS(oi.quantity) * (1- (oi.discount_pct/100)),2) AS net_revenue,
    ROUND(((
			((ABS(oi.unit_price) * ABS(oi.quantity) * (1- (oi.discount_pct/100)))-(unit_cost*ABS(oi.quantity)))
            / (ABS(oi.unit_price) * ABS(oi.quantity) * (1- (oi.discount_pct/100)))
            )*100),2) AS margin,
    
    oi.discount_pct,
    oi.product_id,
    p.category,
    p.unit_cost, 
    o.store_id,
    s.store_name,
    s.region, 
    o.campaign_id,
    mc.campaign_name, 
    mc.budget,
    ABS(DATEDIFF (mc.end_date,mc.start_date)) AS duration_days,
    mc.start_date,
    mc.end_date,
    i.stock_on_hand

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
    AND p.category is not NULL
    ;
   







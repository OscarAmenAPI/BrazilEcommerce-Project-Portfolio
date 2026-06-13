SELECT 

o.order_id,
c.customer_id,
c.customer_unique_id,
p.payment_value,
r.review_score,
oi.order_id,
pr.product_category_name,
o.order_delivered_customer_date,
c.customer_state,
CAST(o.order_purchase_timestamp AS DATE) AS purchase_date,
CAST(o.order_delivered_customer_date AS DATE) AS delivery_date


FROM dbo.orders o
JOIN dbo.customers c
	ON c.customer_id = o.customer_id
JOIN dbo.order_payments p
	ON p.order_id = o.order_id
JOIN dbo.order_review r
	ON r.order_id = o.order_id
JOIN dbo.orders_items oi
	ON oi.order_id = o.order_id
JOIN  dbo.products pr
	ON pr.product_id = oi.product_id

WHERE pr.product_category_name IS NOT NULL AND o.order_delivered_customer_date IS NOT NULL

	
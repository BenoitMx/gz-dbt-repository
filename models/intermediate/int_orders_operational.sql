--Operational_margin = margin + shipping_fee - log_cost - ship_cost

SELECT
a.orders_id
,a.date_date
,ROUND(
    a.margin 
    + SAFE_CAST(b.shipping_fee as FLOAT64) 
    - SAFE_CAST(b.logcost as FLOAT64) 
    - SAFE_CAST(b.ship_cost as FLOAT64)
    , 2) AS operational_margin
FROM {{ref('int_orders_margin')}} as a
JOIN {{ref('stg_gz_raw_data__raw_gz_ship')}} as b
USING (orders_id)
ORDER BY orders_id DESC
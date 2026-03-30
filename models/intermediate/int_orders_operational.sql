-- Operational_margin = margin + shipping_fee - log_cost - ship_cost

SELECT
  a.orders_id,
  a.date_date,
  a.revenue,
  a.quantity,
  a.purchase_cost AS total_purchase_cost,
  SAFE_CAST(b.shipping_fee AS FLOAT64) AS total_ship_fee,
  SAFE_CAST(b.logcost AS FLOAT64) AS total_log_costs,
  ROUND(
    a.margin
    + SAFE_CAST(b.shipping_fee AS FLOAT64)
    - SAFE_CAST(b.logcost AS FLOAT64)
    - SAFE_CAST(b.ship_cost AS FLOAT64),
    2
  ) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS a
JOIN {{ ref('stg_gz_raw_data__raw_gz_ship') }} AS b
USING (orders_id)
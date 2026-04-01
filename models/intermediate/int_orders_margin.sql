WITH subquery1 AS (
SELECT
orders_id
,MAX(date_date) AS date_date
,ROUND(SUM(revenue),2) AS revenue
,SUM(quantity) AS quantity
,ROUND(SUM(quantity * purchase_price),2) AS purchase_cost
FROM {{ref('stg_gz_raw_data__raw_gz_product')}} AS p
JOIN {{ref('stg_gz_raw_data__raw_gz_sales')}} AS s
ON p.products_id = s.product_id
GROUP BY orders_id
)

--margin = revenue - purchase_cost
SELECT *
,ROUND (revenue - purchase_cost,2) AS margin
FROM subquery1
ORDER BY orders_id DESC

WITH subquery1 AS (
SELECT *
FROM {{ref('stg_gz_raw_data__raw_gz_product')}} AS p
JOIN {{ref('stg_gz_raw_data__raw_gz_sales')}} AS s
ON p.products_id = s.product_id
),

--purchase_cost = quantity * purchase_price
subquery2 AS (
SELECT
products_id
,date_date
,orders_id
,revenue
,quantity
,quantity * purchase_price AS purchase_cost
FROM subquery1
)

--margin = revenue - purchase_cost
SELECT *
,ROUND(revenue - purchase_cost),2 AS margin
FROM subquery2
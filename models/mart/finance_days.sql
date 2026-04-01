SELECT
date_date AS Date
,COUNT(DISTINCT orders_id) AS Total_number_of_transactions
,ROUND(SUM(revenue),2) AS Total_revenue
,ROUND(
    safe_divide(
        SUM(revenue), 
        COUNT(DISTINCT orders_id)
    ),2)
    AS Average_Basket
,ROUND(
    SUM(operational_margin)
    ,2) AS Operational_Margin
,ROUND(
    SUM(Total_purchase_cost)
    ,2) AS Total_purchase_cost
,ROUND(
    SUM(Total_ship_fee)
    ,2) AS Total_ship_fee
,ROUND(
    SUM(Total_log_costs)
    ,2) AS Total_log_costs
,round(
    SUM (quantity) 
    ,2) AS Total_quantity_of_products_sold
FROM {{ref('int_orders_operational')}}
--JOIN {{ref('stg_gz_raw_data__raw_gz_ship')}}
--USING (orders_id) 
GROUP BY date_date
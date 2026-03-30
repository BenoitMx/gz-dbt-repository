with source as (

    select *
    from {{ source('gz_raw_data', 'raw_gz_sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id as product_id,
        revenue,
        quantity,
        CONCAT(pdt_id,"_",orders_id) AS primary_key
    from source

)

select *
from renamed
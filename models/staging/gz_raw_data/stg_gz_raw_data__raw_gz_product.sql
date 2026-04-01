with 

source as (
    select * 
    from {{ source('gz_raw_data', 'raw_gz_product') }}
),

renamed as (

    select
        products_id,
        SAFE_CAST(purchse_price as FLOAT64) AS purchase_price 

    from source

)

select * from renamed
with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_ship') }}

),

renamed as (

    select
        orders_id,
        SAFE_CAST(shipping_fee as FLOAT64) AS shipping_fee,
        logcost,
        ship_cost

    from source

)

select * from renamed
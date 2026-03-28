with 

source as (

    select * from {{ source('gz_raw_data', 'raw_gz_ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost,
        CAST(ship_cost as FLOAT64) as ship_cost

    from source
    WHERE shipping_fee<>shipping_fee_1


)

select * from renamed
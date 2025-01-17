with
    dim_product as (
        select *        
        from {{ ref('stg_production__product')}}
    )

select *
from dim_product
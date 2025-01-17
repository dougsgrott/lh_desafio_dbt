with
    stg_customer as (
        select
            customerid as customer_id
            , personid as person_id
            , storeid as store_id
            , territoryid as territory_id
        from {{ source('sales', 'customer') }}
    )
select *
from stg_customer
with
    stg_salesorderheadersalesreason as (
        select
            salesorderid as sales_order_id
            , salesreasonid as sales_reason_id
        from {{ source('sales', 'salesorderheadersalesreason') }}
    )
select *
from stg_salesorderheadersalesreason
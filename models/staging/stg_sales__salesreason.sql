with
    stg_salesreason as (
        select
            salesreasonid as sales_reason_id
            , reasontype as reason_type
            , name as reason_name
        from {{ source('sales', 'salesreason') }}
    )
select *
from stg_salesreason
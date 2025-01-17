with
    stg_store as (
        select
            businessentityid as business_entity_id
            , name as store_name
            , salespersonid as sales_person_id
        from {{ source('sales', 'store') }}
    )
select *
from stg_store
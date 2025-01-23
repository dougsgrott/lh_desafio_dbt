with
    stg_address as (
        select
            addressid as address_id
            , stateprovinceid as stateprovince_id
            , coalesce(addressline1, '') || ', ' || coalesce(addressline1, '') AS addressline_full
            , city
            , postalcode
        from {{ source('person', 'address') }}
    )
select *
from stg_address
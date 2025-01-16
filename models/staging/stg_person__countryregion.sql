with
    stg_countryregion as (
        select
            countryregioncode as country_region_code
            , name as country_region_name
        from {{ source('person', 'countryregion') }}
    )
select *
from stg_countryregion
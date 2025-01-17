with
    stg_stateprovince as (
        select
            stateprovinceid as stateprovince_id
            , territoryid as territory_id
            , name as stateprovince_name
            , stateprovincecode as stateprovince_code
            , countryregioncode as countryregion_code
            , isonlystateprovinceflag as is_province_flag
        from {{ source('person', 'stateprovince') }}
    )
select *
from stg_stateprovince
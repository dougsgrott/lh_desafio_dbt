with
    stg_person as (
        select
            businessentityid as business_entity_id
            , firstname || ' ' || middlename || ' ' || lastname as full_name
            , namestyle as name_style
            , persontype as person_type
            -- , suffix as suffix
            -- , title as title
        from {{ source('person', 'person') }}
    )
select *
from stg_person
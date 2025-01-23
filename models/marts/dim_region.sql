with
    address as (
        select *
        from {{ ref('stg_person__address') }}
    )
    , stateprovince as (
        select *
        from {{ ref('stg_person__stateprovince') }}
    )
    , countryregion as (
        select *
        from {{ ref('stg_person__countryregion') }}
    )

    , dim_region as (
        select
            {{ dbt_utils.generate_surrogate_key(['address.address_id']) }} as sk_region
            , address.address_id
            , address.addressline_full
            , address.city as city
            , address.postalcode as postalcode
            , stateprovince.stateprovince_name
            , stateprovince.territory_id
            , stateprovince.is_province_flag
            , countryregion.country_region_code
            , countryregion.country_region_name
        from address
        left join stateprovince on address.stateprovince_id = stateprovince.stateprovince_id
        left join countryregion on stateprovince.countryregion_code = countryregion.country_region_code
)

select * from dim_region
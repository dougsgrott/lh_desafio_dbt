with
    customer as (
        select *
        from {{ ref('stg_sales__customer') }}
    )
    , person as (
        select *
        from {{ ref('stg_person__person') }}
    )
    , store as (
        select *
        from {{ ref('stg_sales__store') }}
    )

    , dim_customers as (
        select
            {{ dbt_utils.generate_surrogate_key(['customer.customer_id', 'customer.person_id']) }} as sk_customer
            , customer.customer_id
            , customer.person_id
            , customer.store_id
            , person.full_name
            , store.store_name
        from customer
        left join person on customer.customer_id = person.business_entity_id
        left join store on customer.customer_id = store.business_entity_id
)

select * from dim_customers
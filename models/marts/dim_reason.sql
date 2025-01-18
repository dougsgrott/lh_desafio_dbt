with
    salesorderheadersalesreason as (
        select
            sales_order_id
            , sales_reason_id
        from {{ ref('stg_sales__salesorderheadersalesreason') }}
    )
    , salesreason as (
        select
            sales_reason_id
            , reason_name
            , reason_type
        from {{ ref('stg_sales__salesreason') }}
    )

    , dim_reason as (
        select
            salesorderheadersalesreason.sales_order_id as sk_sales_order
            , salesorderheadersalesreason.sales_reason_id
            , salesreason.reason_name
            , salesreason.reason_type
        from salesorderheadersalesreason
        left join salesreason on salesorderheadersalesreason.sales_reason_id = salesreason.sales_reason_id
)

select * from dim_reason
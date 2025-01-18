with
    salesorderdetail as (
        select *
        from {{ ref('stg_sales__salesorderdetail') }}
    )
    , salesorderheader as (
        select *
        from {{ ref('stg_sales__salesorderheader') }}
    )

    , fct_salesorder as (
        select
            {{ dbt_utils.generate_surrogate_key(['salesorderdetail.sales_order_detail_id']) }} as sk_salesorder
            , salesorderdetail.sales_order_id
            , salesorderdetail.sales_order_detail_id
            , salesorderdetail.order_qty
            , salesorderdetail.product_id
            , salesorderdetail.unit_price
            , salesorderdetail.unit_price_discount 
            , salesorderheader.bill_to_address_id
            , salesorderheader.customer_id
            , salesorderheader.currency_rate_id
            , salesorderheader.due_date
            , salesorderheader.freight
            , salesorderheader.online_order_flag
            , salesorderheader.order_date
            , salesorderheader.sales_status
            , salesorderheader.sales_person_id
            , salesorderheader.ship_date
            , salesorderheader.ship_to_address_id
            , salesorderheader.subtotal
            , salesorderheader.taxamt
            , salesorderheader.territory_id
            , salesorderheader.total_due
        from salesorderdetail
        left join salesorderheader on salesorderdetail.sales_order_id = salesorderheader.sales_order_id
)

select * from fct_salesorder
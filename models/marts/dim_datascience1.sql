with
    store as (
        select *
        from {{ ref('stg_sales__store') }}
    )
    , customer as (
        select *
        from {{ ref('stg_sales__customer') }}
    )
    , salesorderheader as (
        select *
        from {{ ref('stg_sales__salesorderheader') }} soh
    )
    , salesorderdetail as (
        select *
        from {{ ref('stg_sales__salesorderdetail') }}
    )
    , product as (
        select *
        from {{ ref('stg_production__product') }}
    )
    , salesterritory as (
        select *
        from {{ ref('stg_sales__salesterritory') }}
    )


    , dim_datascience1 as (
        select
            -- {{ dbt_utils.generate_surrogate_key(['salesorderheader.sales_order_id']) }} as sk_datascience1

            salesorderheader.sales_order_id
            , salesorderheader.account_number
            , salesorderheader.bill_to_address_id
            , salesorderheader.creditcard_id
            , salesorderheader.customer_id 
            , salesorderheader.currency_rate_id
            , salesorderheader.due_date
            , salesorderheader.freight
            , salesorderheader.online_order_flag
            , salesorderheader.order_date
            , salesorderheader.sales_person_id
            , salesorderheader.ship_date
            , salesorderheader.ship_to_address_id
            , salesorderheader.ship_method_id
            , salesorderheader.sales_status
            , salesorderheader.subtotal
            , salesorderheader.territory_id
            , salesorderheader.taxamt
            , salesorderheader.total_due

            -- , salesorderdetail.sales_order_id
            , salesorderdetail.product_id
            , salesorderdetail.sales_order_detail_id
            , salesorderdetail.order_qty
            , salesorderdetail.special_offer_id
            , salesorderdetail.unit_price
            , salesorderdetail.unit_price_discount

            -- , product.product_id
            , product.product_class
            , product.product_color
            , product.day_to_manufacture
            , product.finished_goods_flag
            , product.list_price
            , product.product_name
            , product.product_line
            , product.product_model_id
            , product.product_number
            , product.product_subcategory_id
            , product.sell_end_date
            , product.sell_start_date
            , product.product_size
            , product.size_unit_measure_code
            , product.standard_cost
            , product.product_style
            , product.product_weight
            , product.weight_unit_measure_code

            -- , customer.customer_id
            , customer.person_id
            , customer.store_id
            -- , customer.territory_id

            , store.business_entity_id
            , store.store_name
            -- , store.sales_person_id

            -- , salesterritory.territory_id
            , salesterritory.territory_name
            , salesterritory.country_region_code
            , salesterritory.territory_group
            , salesterritory.sales_ytd
            , salesterritory.sales_last_year
            , salesterritory.cost_ytd
            , salesterritory.cost_last_year

        from salesorderdetail
        left join salesorderheader on salesorderdetail.sales_order_id = salesorderheader.sales_order_id
        left join product on product.product_id = salesorderdetail.product_id
        left join customer on salesorderheader.customer_id = customer.customer_id
        left join store on store.business_entity_id = customer.store_id
        left join salesterritory on salesorderheader.territory_id = salesterritory.territory_id
)

select * from dim_datascience1
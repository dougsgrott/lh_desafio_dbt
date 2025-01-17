with
    stg_salesorderheader as (
        select
            salesorderid as sales_order_id
            , billtoaddressid as bill_to_address_id
            , creditcardid as creditcard_id
            , customerid as customer_id 
            , freight
            , onlineorderflag as online_flag
            , to_date(orderdate) as order_date
            , salespersonid as sales_person_id
            , to_date(shipdate) as ship_date
            , shiptoaddressid as ship_to_address_id
            , subtotal
            , territoryid as territoryid
            , taxamt
            , totaldue as total_due
        from {{ source('sales', 'salesorderheader') }}
    )
select *
from stg_salesorderheader
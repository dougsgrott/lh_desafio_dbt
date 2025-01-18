with
    stg_salesorderheader as (
        select
            salesorderid as sales_order_id
            , accountnumber as account_number
            , billtoaddressid as bill_to_address_id
            , creditcardid as creditcard_id
            , customerid as customer_id 
            , currencyrateid as currency_rate_id
            , duedate as due_date
            , freight
            , onlineorderflag as online_order_flag
            , to_date(orderdate) as order_date
            , salespersonid as sales_person_id
            , to_date(shipdate) as ship_date
            , shiptoaddressid as ship_to_address_id
            , shipmethodid as ship_method_id
            , status as sales_status
            , subtotal
            , territoryid as territory_id
            , taxamt
            , totaldue as total_due
        from {{ source('sales', 'salesorderheader') }}
    )
select *
from stg_salesorderheader
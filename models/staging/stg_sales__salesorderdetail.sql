with
    stg_salesorderdetail as (
        select
            salesorderid as sales_order_id
            , salesorderdetailid as sales_order_detail_id
            , orderqty as order_qty
            , specialofferid as special_offer_id
            , unitprice as unit_price
            , unitpricediscount as unit_price_discount
        from {{ source('sales', 'salesorderdetail') }}
    )
select *
from stg_salesorderdetail
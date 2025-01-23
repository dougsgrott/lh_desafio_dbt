with
    stg_creditcard as (
        select
            creditcardid as credit_card_id
            , cardtype as card_type
            , cardnumber as card_number
            , expmonth as expiration_month
            , expyear as expiration_year
        from {{ source('sales', 'creditcard') }}
    )
select *
from stg_creditcard
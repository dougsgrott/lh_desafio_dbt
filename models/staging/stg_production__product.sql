with
    stg_product as (
        select
            productid as product_id
            , class as product_class
            , color as product_color
            , daystomanufacture as day_to_manufacture
            , finishedgoodsflag as finished_goods_flag
            , listprice as list_price
            , name as product_name
            , productline as product_line
            , productmodelid as product_model_id
            , productnumber as product_number
            , productsubcategoryid as product_subcategory_id
            , sellenddate as sell_end_date
            , sellstartdate as sell_start_date
            , size as product_size
            , sizeunitmeasurecode as size_unit_measure_code
            , standardcost as standard_cost
            , style as product_style
            , weight as product_weight
            , weightunitmeasurecode as weight_unit_measure_code
        from {{ source('production', 'product') }}
    )
select *
from stg_product
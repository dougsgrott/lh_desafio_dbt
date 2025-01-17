with
    stg_productcategory as (
        select
            productcategoryid as product_category_id
            , name as product_category_name
        from {{ source('production', 'productcategory') }}
    )
select *
from stg_productcategory
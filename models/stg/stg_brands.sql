with 

    raw_brands as (

        select * from {{ ref('base_brands') }}

    ),

-- The following barcodes are asigned to multiple brands
-- 511111504788 
-- 511111305125 
-- 511111605058 
-- 511111204923 
-- 511111004790 
-- 511111504139
-- 511111704140

    deduped_brands as (

        select
            id,
            barcode,
            category,
            category_code,
            cpg_id,
            cpg_ref,
            name,
            top_brand,
            row_number() over (partition by barcode order by id) as rn
        from raw_brands

    )

select distinct
    id            as brand_id,
    barcode       as barcode,
    category      as category,
    category_code as category_code,
    cpg_id        as cpg_id,
    cpg_ref       as cpg_ref,
    name          as brand_name,
    top_brand     as is_top_brand
from deduped_brands
where
    rn = 1
{{ config(materialized='table') }} -- materializing as table for high performance

-- import tables

with 

    receipts as (

        select * from {{ ref('stg_receipts') }}

    ),

    users as (

        select * from {{ ref('stg_users') }}

    ),

    brands as (

        select * from {{ ref('stg_brands') }}

    )

-- logical query

select
    r.receipt_id,
    r.bonus_points_earned,
    r.bonus_points_earned_reason,
    r.create_date,
    r.date_scanned,
    r.finished_date,
    r.modify_date,
    r.points_awarded_date,
    r.points_earned,
    r.purchase_date,
    r.purchased_item_count,
    r.rewards_receipt_item_list,
    r.rewards_receipt_status,
    r.total_spent,
    r.user_id,
    -- Join to dim_users for user details:
    u.state,
    u.created_date as user_created_date,
    u.last_login,
    u.user_role,
    u.sign_up_source,
    -- Join to dim_brands using the extracted barcode:
    b.brand_id,
    b.barcode as brand_barcode,
    b.category,
    b.category_code,
    b.cpg_id,
    b.cpg_ref,
    b.brand_name,
    b.is_top_brand
from receipts as r
left join users as u  on r.user_id = u.user_id
left join brands as b on r.barcode = b.barcode
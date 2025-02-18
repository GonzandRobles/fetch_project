with raw_receipts as (

    select * from {{ ref('base_receipts') }}

)

select
    id                                                           as receipt_id,
    bonus_points_earned                                          as bonus_points_earned,
    bonus_points_earned_reason                                   as bonus_points_earned_reason,
    create_date                                                  as create_date,
    date_scanned                                                 as date_scanned, 
    finished_date                                                as finished_date,
    modify_date                                                  as modify_date,
    points_awarded_date                                          as points_awarded_date,
    points_earned                                                as points_earned,
    purchase_date                                                as purchase_date,
    rewards_receipt_status                                       as rewards_receipt_status,
    user_id                                                      as user_id,
    purchased_item_count                                         as amount_units,
    total_spent                                                  as amount_dollars,
    -- Extract nested receipt item values from the first element of the rewards_receipt_item_list array
    rewards_receipt_item_list[0]:barcode::string                 as barcode,
    rewards_receipt_item_list[0]:description::string             as description,
    rewards_receipt_item_list[0]:finalPrice::string              as final_price,
    rewards_receipt_item_list[0]:itemPrice::string               as item_price,
    rewards_receipt_item_list[0]:needsFetchReview::boolean       as needs_fetch_review,
    rewards_receipt_item_list[0]:partnerItemId::string           as partner_item_id,
    rewards_receipt_item_list[0]:preventTargetGapPoints::boolean as prevent_target_gap_points,
    rewards_receipt_item_list[0]:quantityPurchased::int          as quantity_purchased,
    rewards_receipt_item_list[0]:userFlaggedBarcode::string      as user_flagged_barcode,
    rewards_receipt_item_list[0]:userFlaggedNewItem::boolean     as user_flagged_new_item,
    rewards_receipt_item_list[0]:userFlaggedPrice::string        as user_flagged_price,
    rewards_receipt_item_list[0]:userFlaggedQuantity::int        as user_flagged_quantity,
    rewards_receipt_item_list[0]:brandCode::string               as brand_code,
    rewards_receipt_item_list[0]:competitiveProduct::string      as competitive_product,
    rewards_receipt_item_list[0]:competitorRewardsGroup::string  as competitor_rewards_group,
    rewards_receipt_item_list[0]:deleted::boolean                as deleted,
    rewards_receipt_item_list[0]:discountedItemPrice::string     as discounted_item_price,
    rewards_receipt_item_list[0]:itemNumber::string              as item_number,
    rewards_receipt_item_list[0]:metabriteCampaignId::string     as metabrite_campaign_id,
    rewards_receipt_item_list[0]:needsFetchReviewReason::string  as needs_fetch_review_reason,
    rewards_receipt_item_list[0]:originalFinalPrice::string      as original_final_price,
    rewards_receipt_item_list[0]:originalMetaBriteBarcode::string as original_metabrite_barcode,
    rewards_receipt_item_list[0]:originalMetaBriteDescription::string as original_metabrite_description,
    rewards_receipt_item_list[0]:originalMetaBriteItemPrice::string as original_metabrite_item_price,
    rewards_receipt_item_list[0]:originalMetaBriteQuantityPurchased::int as original_metabrite_quantity_purchased,
    rewards_receipt_item_list[0]:originalReceiptItemText::string as original_receipt_item_text,
    rewards_receipt_item_list[0]:pointsEarned::string            as points_earned_item,
    rewards_receipt_item_list[0]:pointsNotAwardedReason::string  as points_not_awarded_reason,
    rewards_receipt_item_list[0]:pointsPayerId::string           as points_payer_id,
    rewards_receipt_item_list[0]:priceAfterCoupon::string        as price_after_coupon,
    rewards_receipt_item_list[0]:rewardsGroup::string            as rewards_group,
    rewards_receipt_item_list[0]:rewardsProductPartnerId::string as rewards_product_partner_id,
    rewards_receipt_item_list[0]:targetPrice::string             as target_price
from raw_receipts
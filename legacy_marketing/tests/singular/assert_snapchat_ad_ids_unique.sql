-- Test: Snapchat advertisement IDs must be unique.
-- Returns duplicate or null advertisement IDs.

WITH ad_id_counts AS (

    SELECT
        ad_id,
        COUNT(*) AS record_count

    FROM bronze_production.legacy_raw.snapchat_ads_ad_history_new_ad_names

    GROUP BY ad_id

)

SELECT
    ad_id,
    record_count

FROM ad_id_counts

WHERE record_count > 1
   OR ad_id IS NULL
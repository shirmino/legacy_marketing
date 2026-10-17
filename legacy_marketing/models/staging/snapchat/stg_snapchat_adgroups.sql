
WITH source AS (

    SELECT *
    FROM {{ source('snapchat', 'snapchat_ads_adgroup_history_new_ad_group_names') }}

),

ranked_adgroups AS (

    SELECT
        ad_group_id,
        campaign_id,
        ad_group_name,
        ad_group_updated_at,

        ROW_NUMBER() OVER (
            PARTITION BY ad_group_id
            ORDER BY
                ad_group_updated_at DESC NULLS LAST,
                _surrogate_key DESC
        ) AS row_num

    FROM source

)

SELECT
    ad_group_id,
    campaign_id,
    ad_group_name,
    ad_group_updated_at

FROM ranked_adgroups

WHERE row_num = 1

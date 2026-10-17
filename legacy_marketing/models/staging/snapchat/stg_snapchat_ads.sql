
WITH source AS (

    SELECT
        ad_id,
        ad_group_id,
        ad_name,
        ad_detail_updated_at

    FROM {{ source(
        'snapchat',
        'snapchat_ads_ad_history_new_ad_names'
    ) }}

),

renamed AS (

    SELECT
        ad_id,
        ad_group_id,
        ad_name,
        ad_detail_updated_at AS ad_updated_at

    FROM source

)

SELECT *
FROM renamed

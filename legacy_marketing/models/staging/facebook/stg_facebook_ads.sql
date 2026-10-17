
WITH source AS (

    SELECT
        ad_id,
        campaign_id,
        ad_group_id,
        account_id,
        ad_name,
        ad_status,
        ad_updated_at

    FROM {{ source(
        'facebook',
        'facebook_new_ads_de_randomized'
    ) }}

),

renamed AS (

    SELECT
        ad_id,
        campaign_id,
        ad_group_id,
        account_id,
        ad_name,
        ad_status,
        ad_updated_at

    FROM source

)

SELECT *
FROM renamed

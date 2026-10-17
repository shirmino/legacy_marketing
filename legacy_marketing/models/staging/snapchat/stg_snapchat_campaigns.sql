
WITH source AS (

    SELECT
        campaign_id,
        account_id,
        campaign_name

    FROM {{ source(
        'snapchat',
        'snapchat_ads_campaign_history_new_campaign_names'
    ) }}

),

renamed AS (

    SELECT
        campaign_id,
        account_id,
        campaign_name

    FROM source

)

SELECT *
FROM renamed


WITH source AS (

    SELECT
        campaign_id,
        campaign_name,
        campaign_updated_at

    FROM {{ source(
        'facebook',
        'facebook_new_campaign_de_randomized'
    ) }}

),

renamed AS (

    SELECT
        campaign_id,
        campaign_name,
        campaign_updated_at

    FROM source

)

SELECT *
FROM renamed

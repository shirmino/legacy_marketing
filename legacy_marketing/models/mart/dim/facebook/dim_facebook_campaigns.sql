
WITH campaigns AS (

    SELECT
        campaign_id,
        campaign_name,
        campaign_updated_at

    FROM {{ ref('stg_facebook_campaigns') }}

),

final AS (

    SELECT
        campaign_id,
        campaign_name,
        campaign_updated_at

    FROM campaigns

)

SELECT *
FROM final

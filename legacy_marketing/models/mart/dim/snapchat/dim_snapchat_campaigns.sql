
WITH campaigns AS (

    SELECT
        campaign_id,
        campaign_name,
        account_id

    FROM {{ ref('stg_snapchat_campaigns') }}

),

final AS (

    SELECT
        campaign_id,
        campaign_name,
        account_id

    FROM campaigns

)

SELECT *
FROM final

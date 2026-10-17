
WITH adgroups AS (

    SELECT
        ad_group_id,
        ad_group_name,
        ad_group_updated_at

    FROM {{ ref('stg_facebook_adgroups') }}

),

final AS (

    SELECT
        ad_group_id,
        ad_group_name,
        ad_group_updated_at

    FROM adgroups

)

SELECT *
FROM final

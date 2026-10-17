
WITH adgroups AS (

    SELECT
        ad_group_id,
        ad_group_name

    FROM {{ ref('stg_snapchat_adgroups') }}

),

final AS (

    SELECT
        ad_group_id,
        ad_group_name

    FROM adgroups

)

SELECT *
FROM final

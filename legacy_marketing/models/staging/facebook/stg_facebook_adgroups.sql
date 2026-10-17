
WITH source AS (

    SELECT
        ad_group_id,
        ad_group_name,
        ad_group_updated_at

    FROM {{ source(
        'facebook',
        'facebook_new_adgroup_de_randomized'
    ) }}

),

renamed AS (

    SELECT
        ad_group_id,
        ad_group_name,
        ad_group_updated_at

    FROM source

)

SELECT *
FROM renamed


WITH source AS (

    SELECT
        account_id,
        account_name,
        ad_currency_code,
        account_created_at,
        account_updated_at

    FROM {{ source(
        'facebook',
        'facebook_new_acccount_de_randomized'
    ) }}

),

renamed AS (

    SELECT
        account_id,
        account_name,
        ad_currency_code AS currency_code,
        account_created_at,
        account_updated_at

    FROM source

)

SELECT *
FROM renamed

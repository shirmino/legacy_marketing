
WITH accounts AS (

    SELECT
        account_id,
        account_name,
        currency_code,
        account_created_at,
        account_updated_at

    FROM {{ ref('stg_facebook_accounts') }}

),

final AS (

    SELECT
        account_id,
        account_name,
        currency_code,
        account_created_at,
        account_updated_at

    FROM accounts

)

SELECT *
FROM final

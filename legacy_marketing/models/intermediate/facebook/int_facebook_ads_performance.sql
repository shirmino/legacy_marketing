
WITH stats AS (

    SELECT *
    FROM {{ ref('stg_facebook_ads_stats') }}

),

ads AS (

    SELECT *
    FROM {{ ref('stg_facebook_ads') }}

),

campaigns AS (

    SELECT *
    FROM {{ ref('stg_facebook_campaigns') }}

),

adgroups AS (

    SELECT *
    FROM {{ ref('stg_facebook_adgroups') }}

),

accounts AS (

    SELECT *
    FROM {{ ref('stg_facebook_accounts') }}

),

joined AS (

    SELECT
        'facebook' AS platform,

        s.ad_id,
        a.ad_name,
        a.ad_status,

        s.account_id,
        acc.account_name,

        a.campaign_id,
        c.campaign_name,

        a.ad_group_id,
        g.ad_group_name,

        acc.currency_code,

        s.ad_date,
        s.spend,
        s.impressions,
        s.clicks

    FROM stats AS s

    LEFT JOIN ads AS a
        ON s.ad_id = a.ad_id

    LEFT JOIN campaigns AS c
        ON a.campaign_id = c.campaign_id

    LEFT JOIN adgroups AS g
        ON a.ad_group_id = g.ad_group_id

    LEFT JOIN accounts AS acc
        ON s.account_id = acc.account_id

)

SELECT *
FROM joined

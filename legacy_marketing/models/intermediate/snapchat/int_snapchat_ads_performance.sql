
WITH stats AS (

    SELECT *
    FROM {{ ref('stg_snapchat_ads_stats') }}

),

ads AS (

    SELECT *
    FROM {{ ref('stg_snapchat_ads') }}

),

adgroups AS (

    SELECT *
    FROM {{ ref('stg_snapchat_adgroups') }}

),

campaigns AS (

    SELECT *
    FROM {{ ref('stg_snapchat_campaigns') }}

),

joined AS (

    SELECT
        'snapchat' AS platform,

        s.ad_id,
        a.ad_name,

        a.ad_group_id,
        g.ad_group_name,

        g.campaign_id,
        c.campaign_name,

        s.currency_code,
        s.country,
        s.data_src,

        s.ad_date,
        s.spend,
        s.impressions,
        s.clicks

    FROM stats AS s

    LEFT JOIN ads AS a
        ON s.ad_id = a.ad_id

    LEFT JOIN adgroups AS g
        ON a.ad_group_id = g.ad_group_id

    LEFT JOIN campaigns AS c
        ON g.campaign_id = c.campaign_id

)

SELECT *
FROM joined

WITH pc AS (
SELECT
  *,
  quantity*purchase_price AS purchase_cost,
FROM
    {{ ref('stg_raw__sales') }} AS s
LEFT JOIN {{ ref('stg_raw__product') }} AS p
USING (products_id)
)

SELECT
    *,
    ROUND(revenue-purchase_cost,2) AS margin
FROM pc
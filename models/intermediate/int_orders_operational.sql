SELECT
    orders_id,
    date_date,
    ROUND((sm.margin+sh.shipping_fee-sh.logcost-sh.ship_cost),2) AS operational_margin
FROM {{ ref('int_sales_margin') }} AS sm
LEFT JOIN {{ ref('stg_raw__ship') }} AS sh
USING (orders_id)
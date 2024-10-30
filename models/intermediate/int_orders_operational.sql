SELECT
    orders_id,
    date_date,
    ROUND(SUM((sm.margin+sh.shipping_fee-sh.logcost-sh.ship_cost)),2) AS operational_margin,
    COUNT(DISTINCT(products_id)) AS nb_product,
    ROUND(SUM(revenue),2) AS revenue,
    SUM(quantity) AS quantity,
    ROUND(SUM(purchase_price),2) AS purchase,
    ROUND(SUM(purchase_cost),2) AS purchase_cost,
    ROUND(SUM(shipping_fee),2) AS shipping_fee,
    ROUND(SUM(logcost),2) AS logcost,
    SUM(ship_cost) AS ship_cost,
    ROUND(SUM(margin),2) AS margin
FROM {{ ref('int_sales_margin') }} AS sm
LEFT JOIN {{ ref('stg_raw__ship') }} AS sh
USING (orders_id)
GROUP BY orders_id, date_date
-- SELECT
--     date_date,
--     COUNT(DISTINCT(orders_id)) AS nb_transactions,
--     SUM(revenue) AS revenue,
--     SUM(quantity) AS quantity,
--     AVG(quantity) AS avg_quantity,
--     SUM(margin) AS margin,
--     SUM(operational_margin) AS operational_margin,
--     SUM(purchase_cost) AS purchase_cost,
--     SUM(shipping_fee) AS shipping_fee,
--     SUM(logcost) AS logcost,
-- FROM {{ ref('int_orders_operational') }}
-- GROUP BY date_date ORDER BY date_date DESC

{{ config(materialized=finance_days) }}
SELECT
     date_date
     ,COUNT(orders_id) AS nb_transactions
     ,ROUND(SUM(revenue),0) AS revenue
     ,ROUND(AVG(revenue),1) AS average_basket
     ,ROUND(SUM(revenue)/COUNT(orders_id),1) AS average_basket_bis
     ,ROUND(SUM(margin),0) AS margin
     ,ROUND(SUM(operational_margin),0) AS operational_margin
     ,ROUND(SUM(purchase_cost),0) AS purchase_cost
     ,ROUND(SUM(shipping_fee),0) AS shipping_fee
     ,ROUND(SUM(logcost),0) AS logcost
     ,ROUND(SUM(ship_cost),0) AS ship_cost
     ,SUM(quantity) AS quantity
 FROM {{ref("int_orders_operational")}}
 GROUP BY  date_date
 ORDER BY  date_date DESC
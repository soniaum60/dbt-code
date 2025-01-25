{{ config(
    materialized='view') 
    }}

WITH tb1  as(
 select
        id,
        order_date,
        user_id,
        status,
        DBT_VALID_TO
     from {{ref('snap_orders_checks')}})
     select * from tb1 where DBT_VALID_TO is NULL
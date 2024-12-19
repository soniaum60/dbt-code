{{ config(
    materialized='view') 
    }}

WITH tb1  as(
 select
        id,
        order_date,
        user_id,
        status  
     from {{source('datafeed_shared_schema','STG_ORDERS')}})
     select * from tb1


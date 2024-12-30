{{ config(materialized='table') }}

WITH tb1  as(
 select
        id ,
        first_name,
        last_name
     from {{source('datafeed_shared_schema','STG_CUSTOMERS')}})
     select * from tb1

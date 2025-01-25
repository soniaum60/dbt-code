{{config(materialized = 'table')}}

with tb1 as 
(
    select C_CUSTKEY as CUST_KEY,
    C_NAME AS CUST_NAME,
    C_NATIONKEY AS NATION_KEY
    FROM {{source('datafeed_shared_schema_dev','RAW_CUSTOMER')}} 
)
select * from tb1
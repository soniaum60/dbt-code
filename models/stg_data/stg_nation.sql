{{config (materialized = 'table')}}

with tb1 as 
(
    select N_NATIONKEY as NATIONKEY,
    N_NAME as CUSTOMER_NATION,  
    N_REGIONKEY as REGIONKEY
    from {{source('datafeed_shared_schema_dev','RAW_NATION')}}
)

select * from tb1
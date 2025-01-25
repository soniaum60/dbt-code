{{config(materialized ='table')}}

with 
tb1 as
(
    select 
    concat(L_ORDERKEY, '----', L_LINENUMBER) as line_key,
    L_ORDERKEY as ORDERKEY,
    L_QUANTITY as LINE_QUANTITY
    from {{source('datafeed_shared_schema_dev', 'RAW_LINEITEM')}}
)
select * from tb1
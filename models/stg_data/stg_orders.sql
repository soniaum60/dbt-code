{{config(materialized ='table')}}

with tb1 as
(
    select O_ORDERKEY as ORDERKEY,
    O_TOTALPRICE as ORDER_TOTALPRICE,
    cast(O_ORDERDATE as date) as ORDER_DATE,
    date_trunc('month',cast(O_ORDERDATE as date)) as ORDER_MONTH,
    case 
        when O_ORDERSTATUS = 'O' then 'OPEN'
        when O_ORDERSTATUS = 'F' then 'FILLED'
        when O_ORDERSTATUS = 'P' then 'PROCESSING'
        END AS ORDER_STATUS
    from {{source('datafeed_shared_schema_dev','RAW_ORDER')}}
)

SELECT * FROM tb1

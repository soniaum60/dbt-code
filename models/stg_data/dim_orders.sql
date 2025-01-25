{{config(materialized ='table')}}

with tb1 as
(
    select 
    O.ORDERKEY,
    O.ORDER_STATUS,
    O.ORDER_DATE,
    O.ORDER_MONTH,
    O.ORDER_TOTALPRICE,
    N.CUSTOMER_NATION,
    C.CUST_KEY,
    C.CUST_NAME,
    l.ORDER_UNIQUE_ITEM,
    l.ORDER_TOTAL_QUANTITY
    from {{ref('stg_orders')}} as O 
    inner join {{ref('order_lineitem')}} as l
    on l.ORDERKEY = O.ORDERKEY
    inner join {{ref('stg_customer')}} as C
    on C.CUST_KEY = O.ORDERKEY
    inner join {{ref('stg_nation')}} as N
    on N.NATIONKEY= C.NATION_KEY

)
select * from tb1
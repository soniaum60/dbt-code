{%snapshot snap_orderdetails%}

{{config
(
    strategy = 'check',
    unique_key = 'ORDERKEY',
    check_cols = ['ORDER_DATE','ORDER_STATUS','ORDER_TOTAL_QUANTITY','ORDER_TOTALPRICE','CUST_NAME','CUST_KEY','CUSTOMER_NATION'],

)}}

select * from {{ref('dim_orders')}}
{%endsnapshot%}

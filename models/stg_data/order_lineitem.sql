{{config(materialized = 'table')}}

    select O.ORDERKEY,
    COUNT(1) AS ORDER_UNIQUE_ITEM,
    {{calculate_sum('LINE_QUANTITY')}} as ORDER_TOTAL_QUANTITY
    FROM {{ref('stg_orders')}} as O 
    inner join {{ref("stg_lineitem")}} as l
    on o.ORDERKEY = l.ORDERKEY
    group by O.ORDERKEY

{{config(materialized = 'table')}}

with tb1 as
(
    select * from 
    {{ref('snap_orderdetails')}}
    where dbt_valid_to is null
)

select * from tb1
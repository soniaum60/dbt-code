{{ config(materialized='table') 
    }}

with
emp_data as (
    select id,
           name, 
           salary,
           tax_amount,
           ({{sub_amount('salary','tax_amount')}}) as sub_total_amount
     from 
    {{source('datafeed_shared_schema','emp')}}
)
select * from emp_data


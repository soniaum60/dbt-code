{{ config(materialized="table")}}
    
    WITH tb1 as (
        select * from {{source('datafeed_shared_schema','STG_SUPPLIES_DATA')}}
    )
    select * from tb1
    
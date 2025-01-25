{{ config(
    materialized="table",
    pre_hook="TRUNCATE TABLE {{ this }}",
    post_hook="TRUNCATE TABLE {{ref('supplies_data')}}"
    
    )}}
    
    WITH tb1 as (
        select * from {{ref("supplies_data")}}
    )
    select * from tb1
      
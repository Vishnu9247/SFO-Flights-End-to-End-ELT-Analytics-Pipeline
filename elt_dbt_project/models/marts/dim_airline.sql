{{ config(materialized='table') }}

select distinct
    airline_code          as airline_key,
    airline_code,
    airline_name,
    airline_dot
from {{ ref('stg_flights_sfo') }}
where airline_code is not null

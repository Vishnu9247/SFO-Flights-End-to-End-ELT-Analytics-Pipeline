{{ config(materialized='table') }}

select distinct
    origin_airport        as airport_key,
    origin_airport        as airport_code,
    origin_city           as city,
    origin_state          as state,
    'USA'                 as country
from {{ ref('stg_flights_sfo') }}

union

select distinct
    dest_airport,
    dest_airport,
    dest_city,
    dest_state,
    'USA'
from {{ ref('stg_flights_sfo') }}

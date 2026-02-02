{{ config(materialized='table') }}

select distinct
    flight_date                       as date_key,
    flight_date                       as date,
    day(flight_date)                  as day,
    month(flight_date)                as month,
    year(flight_date)                 as year,
    dayname(flight_date)              as day_of_week,
    weekofyear(flight_date)           as week_of_year,
    false                              as is_holiday
from {{ ref('stg_flights_sfo') }}

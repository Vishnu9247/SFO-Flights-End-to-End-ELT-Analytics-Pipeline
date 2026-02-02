{{ config(materialized='table') }}

select
    -- Surrogate Key
    sha1(
        concat(
            flight_date,
            airline_code,
            flight_number,
            origin_airport,
            dest_airport
        )
    )                                  as flight_key,

    -- Foreign Keys
    flight_date                        as date_key,
    airline_code                       as airline_key,
    origin_airport                     as origin_airport_key,
    dest_airport                       as dest_airport_key,

    -- Degenerate Dimension
    flight_number,

    -- Measures
    dep_delay,
    arr_delay,
    (dep_delay + arr_delay)            as total_delay,

    taxi_out,
    taxi_in,
    air_time,
    distance,

    cancelled,
    diverted,

    delay_due_carrier,
    delay_due_weather,
    delay_due_nas,
    delay_due_security,
    delay_due_late_aircraft

from {{ ref('stg_flights_sfo') }}

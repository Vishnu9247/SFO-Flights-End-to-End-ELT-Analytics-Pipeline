{{ config(materialized='view') }}

select
    recordid::int                                    as record_id,

    coalesce(
    try_to_date(fl_date, 'MM/DD/YYYY'),
    try_to_date(fl_date, 'YYYY-MM-DD')             ) as flight_date,


    airline::string                                  as airline_name,
    airline_dot::string                              as airline_dot,
    airline_code::string                             as airline_code,

    dot_code::int                                    as dot_code,
    fl_number::string                                as flight_number,

    origin::string                                   as origin_airport,
    split(origin_city, ',')[0]::string               as origin_city,
    split(origin_city, ',')[1]::string               as origin_state,

    dest::string                                     as dest_airport,
    split(dest_city, ',')[0]::string                 as dest_city,
    split(dest_city, ',')[1]::string                 as dest_state,

    crs_dep_time::string                             as crs_dep_time,
    dep_time::string                                 as dep_time,
    dep_delay::int                                   as dep_delay,

    taxi_out::int                                    as taxi_out,
    wheels_off::string                               as wheels_off,
    wheels_on::string                                as wheels_on,
    taxi_in::int                                     as taxi_in,

    crs_arr_time::string                             as crs_arr_time,
    arr_time::string                                 as arr_time,
    arr_delay::int                                   as arr_delay,

    cancelled::boolean                               as cancelled,
    nullif(cancellation_code, '')::string            as cancellation_code,
    diverted::boolean                                as diverted,

    crs_elapsed_time::int                            as crs_elapsed_time,
    elapsed_time::int                                as elapsed_time,
    air_time::int                                    as air_time,
    distance::float                                  as distance,

    coalesce(delay_due_carrier, 0)::int              as delay_due_carrier,
    coalesce(delay_due_weather, 0)::int              as delay_due_weather,
    coalesce(delay_due_nas, 0)::int                  as delay_due_nas,
    coalesce(delay_due_security, 0)::int             as delay_due_security,
    coalesce(delay_due_late_aircraft, 0)::int        as delay_due_late_aircraft

from AIRBYTE_DATABASE.AIRBYTE_SCHEMA.FLIGHTS_SFO

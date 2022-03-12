
{{ config(materialized='table') }}

Select
DISTINCT LOCATION_ISO_CODE as location_iso_code,
LOCATION_LEVEL as location_level,
LOCATION as location,
ISLAND as island,
AREA_KM_2_ as area_km_2_,
LATITUDE as latitude,
TOTAL_REGENCIES as total_regencies,
LONGITUDE as longitude,
TOTAL_CITIES as total_cities,
TOTAL_DISTRICTS as total_districts,
TOTAL_URBAN_VILLAGES as total_urban_villages,
SPECIAL_STATUS as special_status,
TOTAL_RURAL_VILLAGES as total_rural_villages,
COUNTRY as country,
CONTINENT as continent,
PROVINCE as province,
POPULATION_DENSITY as population_density,
POPULATION as population
From 
"FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_ASHISH_NAMDEO_3"
where location_level='Province'
{{ config(materialized='table') }}

Select
DISTINCT LOCATION_ISO_CODE as location_iso_code,
TOTAL_RECOVERED as total_recovered,
TOTAL_CASES_PER_MILLION as total_cases_per_million,
GROWTH_FACTOR_OF_NEW_DEATHS as growth_factor_of_new_deaths,
TOTAL_ACTIVE_CASES as total_active_cases,
NEW_CASES_PER_MILLION as new_cases_per_million,
NEW_DEATHS_PER_MILLION as new_deaths_per_million,
NEW_RECOVERED as new_recovered,
CASE_FATALITY_RATE as case_fatality_rate,
NEW_DEATHS as new_deaths,
NEW_CASES as new_cases,
TOTAL_DEATHS as total_deaths,
DATE as date,
CASE_RECOVERED_RATE as case_recovered_rate,
NEW_ACTIVE_CASES as new_active_cases,
TOTAL_CASES as total_cases,
TOTAL_DEATHS_PER_MILLION as total_deaths_per_million,
GROWTH_FACTOR_OF_NEW_CASES as growth_factor_of_new_cases
From 
"FIVETRAN_INTERVIEW_DB"."GOOGLE_SHEETS"."COVID_19_INDONESIA_ASHISH_NAMDEO_3"
where location_level='Province'
order by LOCATION_ISO_CODE, CAST(DATE as Date) desc
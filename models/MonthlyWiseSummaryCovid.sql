WITH latest_deaths_data AS
   ( SELECT LOCATION_ISO_CODE,
            TOTAL_DEATHS,
            TOTAL_RECOVERED,
            total_cases,
            CAST(DATE as Date) as date
     FROM {{ ref('STATISTICS') }})
SELECT  month(s.DATE) as Months,
       AVG((s.TOTAL_DEATHS / s.total_cases)) as Average_fatality_rate,
       AVG((s.TOTAL_RECOVERED / s.total_cases)) as Average_recovery_rate,
       AVG((s.TOTAL_DEATHS / d.population)) as Average_mortality_rate

FROM latest_deaths_data S JOIN {{ ref('DEMOGRAPHICS') }} D ON s.LOCATION_ISO_CODE=d.LOCATION_ISO_CODE
Group BY month(s.DATE)
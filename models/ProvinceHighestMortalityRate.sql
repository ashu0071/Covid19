WITH latest_deaths_data AS
   ( SELECT LOCATION_ISO_CODE,
            DATE,
            TOTAL_DEATHS,
            TOTAL_RECOVERED,
            total_cases,
            ROW_NUMBER() OVER (PARTITION BY LOCATION_ISO_CODE ORDER BY CAST(DATE as Date) DESC) as rn
     FROM {{ ref('STATISTICS') }})
SELECT s.LOCATION_ISO_CODE,
       d.LOCATION,
       s.DATE,
       s.TOTAL_DEATHS,
       d.population,
       d.population_density,
       d.AREA_KM_2_,
       (s.TOTAL_DEATHS / s.total_cases) as fatality_rate,
       (s.TOTAL_RECOVERED / s.total_cases) as recovery_rate,
       (s.TOTAL_DEATHS / d.population) as mortality_rate

FROM latest_deaths_data S JOIN {{ ref('DEMOGRAPHICS') }} D ON s.LOCATION_ISO_CODE=d.LOCATION_ISO_CODE
WHERE rn=1
ORDER BY mortality_rate DESC
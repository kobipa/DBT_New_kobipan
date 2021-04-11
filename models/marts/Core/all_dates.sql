with tmp as (
 {{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2020-01-01' as date)",
    end_date="dateadd(year,1,current_date)"
   )
}})

select to_varchar(DATE_DAY,'YYYYMMDD') as DATE_CODE, DATE_DAY,to_varchar(DATE_DAY,'YYYY') as YEAR_code,to_varchar(DATE_DAY,'MM') as MONTH_CODE,to_varchar(DATE_DAY,'DD') as DAY_CODE
, {{ dbt_utils.last_day('DATE_DAY', 'WEEK') }} last_day_of_week
 from tmp
 
 
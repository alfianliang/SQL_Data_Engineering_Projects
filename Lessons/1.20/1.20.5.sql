SELECT
    job_title_short,
    job_work_from_home,
    AVG(salary_year_avg)::INT AS annual_salary_avg,
    job_work_from_home::INT*AVG(260*salary_year_avg/2080)::INT AS annual_commmute_cost_savings,
    AVG(salary_year_avg)::INT+job_work_from_home::INT*AVG(260*salary_year_avg/2080)::INT AS adjusted_annual_salary_avg
FROM
    job_postings_fact
WHERE
    job_country = 'United States'
    AND job_title_short LIKE '%Data%'
GROUP BY    
    job_title_short,job_work_from_home
ORDER BY
    job_title_short DESC, job_work_from_home;
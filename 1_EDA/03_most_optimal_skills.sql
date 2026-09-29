/*
Question: What are the most optimal skills for data engineers--balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify most valuable skills.
- Focus only on Data Engineering positions in Indonesia with specified annual salaries.
- Why?
    - This approach highlights skills that balance market demand and financial reward.
      It weights core skills appropriately, rather than letting rare, outlier skills distort the results.
*/

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
    COUNT(jpf.*) AS demand_count,
    ROUND(LN(COUNT(jpf.*)),2) AS ln_demand_count,
    ROUND(MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*))/1_000_000,2) AS optimal_score
FROM 
    job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd
        ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd
        ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND job_country = 'Indonesia'
GROUP BY 
    sd.skills
HAVING
    COUNT(jpf.*) > 100
ORDER BY 
    optimal_score DESC
LIMIT 25;

/*
Key insights on most optimal skills based on median salary and job demand count:
- Programming languages like Python and SQL are the most optimal skills for Data Engineer jobs in Indonesia. Java also sits on the top 5 skills.
- Cloud computing platforms like aws, gcp, and azure are also among the most optimal skills for Data Engineering jobs in Indonesia.
- For Data Engineering jobs in Indonesia, the most optimal orchestration tool is airflow.
- The data shows including those job postings without median salary information, this is due to there are too many job postings in Indonesia that has no information of median salary.
- For the third project, I have used an updated full 2023-present job dataset (refreshed monthly), which is last updated on 2026-08-31.
┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │     double      │    double     │
├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ python     │      147500.0 │          914 │            6.82 │          1.01 │
│ sql        │      140871.0 │         1179 │            7.07 │           1.0 │
│ airflow    │      159000.0 │          304 │            5.72 │          0.91 │
│ aws        │      147500.0 │          436 │            6.08 │           0.9 │
│ java       │      147500.0 │          409 │            6.01 │          0.89 │
│ spark      │      132911.0 │          539 │            6.29 │          0.84 │
│ hadoop     │      132911.0 │          487 │            6.19 │          0.82 │
│ scala      │      147500.0 │          226 │            5.42 │           0.8 │
│ gcp        │      134241.0 │          320 │            5.77 │          0.77 │
│ nosql      │      131580.0 │          334 │            5.81 │          0.76 │
│ kubernetes │      159000.0 │          114 │            4.74 │          0.75 │
│ docker     │      159000.0 │          114 │            4.74 │          0.75 │
│ flow       │      146621.0 │          127 │            4.84 │          0.71 │
│ redshift   │      140871.0 │          143 │            4.96 │           0.7 │
│ linux      │      134241.0 │          118 │            4.77 │          0.64 │
│ bigquery   │      114512.0 │          239 │            5.48 │          0.63 │
│ mysql      │       97444.0 │          250 │            5.52 │          0.54 │
│ sql server │          NULL │          152 │            5.02 │          NULL │
│ postgresql │          NULL │          213 │            5.36 │          NULL │
│ azure      │          NULL │          317 │            5.76 │          NULL │
│ tableau    │          NULL │          177 │            5.18 │          NULL │
│ oracle     │          NULL │          133 │            4.89 │          NULL │
│ mongodb    │          NULL │          288 │            5.66 │          NULL │
│ power bi   │          NULL │          155 │            5.04 │          NULL │
│ kafka      │          NULL │          414 │            6.03 │          NULL │
└────────────┴───────────────┴──────────────┴─────────────────┴───────────────┘
*/
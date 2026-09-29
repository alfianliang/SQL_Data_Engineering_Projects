/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions.
- Focus on positions in Indonesia with specified salaries.
- Include skill frequency to identify both salary and demand.
- Why?
    - Helps identify which skills command the highest compensation while also showing how common those skills are, providing a more complete picture for skill development priorities.
    - The median is used instead of the average to reduce the impact of outlier salaries.
*/

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
    COUNT(jpf.*) AS demand_count
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
    median_salary DESC
LIMIT 25;

/*
Key insights:
- The highest paying skills are orchestration tools such as kubernetes and airflow.
- The second highest paying skill is orchestration platform such as docker.
- Programming languages is among the highest paying skill, where scala is in the 4th rank with 160000 median salary, with python, java, and sql are also in the top 25.
- Cloud computing softwares are also among the highest paying skills, where aws is on the top 5 with 147500 median salary, gcp, redshift, and azure are also in the list.
- Some skills do not have salary information.


┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ kubernetes │      159000.0 │          131 │
│ docker     │      159000.0 │          131 │
│ airflow    │      159000.0 │          300 │
│ scala      │      147500.0 │          224 │
│ aws        │      147500.0 │          430 │
│ python     │      147500.0 │          907 │
│ java       │      147500.0 │          406 │
│ flow       │      146621.0 │          143 │
│ redshift   │      140871.0 │          143 │
│ sql        │      140871.0 │         1187 │
│ git        │      134241.0 │          115 │
│ linux      │      134241.0 │          135 │
│ gcp        │      134241.0 │          313 │
│ hadoop     │      132911.0 │          485 │
│ spark      │      132911.0 │          536 │
│ nosql      │      131580.0 │          348 │
│ bigquery   │      114512.0 │          236 │
│ mysql      │       97444.0 │          248 │
│ mongodb    │          NULL │          284 │
│ oracle     │          NULL │          132 │
│ kafka      │          NULL │          429 │
│ tableau    │          NULL │          175 │
│ postgresql │          NULL │          211 │
│ azure      │          NULL │          311 │
│ power bi   │          NULL │          152 │
└────────────┴───────────────┴──────────────┘
*/
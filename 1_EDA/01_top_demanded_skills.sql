/*
Question: Wjat are the most in-demand skills for data engineers?
- Identify the top 10 in-demand skills for data engineers
- Focus on job postings in Indonesia
- Why? Retrieves the top 10 skills with the highest demand in Indonesian job market
    providing insights into the most valuable skills for data engineers seeking jobs in Indonesia
*/

SELECT 
    sd.skills,
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
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
Breakdown of the most demanded skills for data engineers in Indonesia:
The top demanded skills are programming languages like SQL and Python, which contributes to about 1000 job postings in Indonesia.
The next most demandedd skills are big data tools like spark and hadoop, which is around 500 job postings.
Cloud computing skill like AWS also shows on the top 5 job postings. GCP and Azure are also in the top 10.
The other skills filling in the top 10 job postings are programming languages like java and nosql.
Kafka is the only streaming platform that shows up in the top 10, which is on the 6th rank.

Key takeaways:
- SQL and Python plays an important role as a data engineering skill in Indonesia.
- Big data tools like spark and hadoop are high in demand in Indonesia.
- Companies in Indonesia use broad range of cloud computing platforms, such as aws, gcp, and azure.
- The most-demanded streaming platform in Indonesia is kafka.

┌─────────┬──────────────┐
│ skills  │ demand_count │
│ varchar │    int64     │
├─────────┼──────────────┤
│ sql     │         1187 │
│ python  │          907 │
│ spark   │          536 │
│ hadoop  │          485 │
│ aws     │          430 │
│ kafka   │          429 │
│ java    │          406 │
│ nosql   │          348 │
│ gcp     │          313 │
│ azure   │          311 │
└─────────┴──────────────┘
*/
SELECT * FROM skills_dim;

SELECT * FROM skills_job_dim;

SELECT
    jpf.job_id,
    jpf.job_title,
    sd.skills,
    jpf.job_country,
    job_health_insurance
FROM 
    job_postings_fact as jpf
LEFT JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    job_title_short = 'Data Engineer'
    AND job_country = 'United States'
    AND job_health_insurance = TRUE
ORDER BY job_id DESC
;
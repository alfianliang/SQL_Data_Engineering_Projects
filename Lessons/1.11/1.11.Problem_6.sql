SELECT 
    sd.skill_id,
    sd.skills,
    COUNT(jpf.job_id) AS job_count
FROM skills_dim AS sd
    RIGHT JOIN skills_job_dim AS sjd
        ON sd.skill_id = sjd.skill_id
    RIGHT JOIN job_postings_fact AS jpf
        ON sjd.job_id = jpf.job_id
WHERE
    job_title_short LIKE '%Data%'
GROUP BY
    sd.skill_id, sd.skills
ORDER BY
    COUNT(jpf.job_id) DESC
;
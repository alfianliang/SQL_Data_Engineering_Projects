SELECT
    jpf.job_id,
    jpf.job_title,
    cd.name AS company_name,
    jpf.job_location,
    jpf.job_posted_date
FROM 
    job_postings_fact AS jpf,
    company_dim AS cd
LEFT JOIN job_postings_fact.company_id 
    ON cd.company_id
LIMIT 10;

SELECT * FROM company_dim;

-- solution : obtained after checking 1.11_Joins.sql
SELECT
    jpf.job_id,
    jpf.job_title,
    cd.name AS company_name,
    jpf.job_location,
    jpf.job_posted_date
FROM 
    job_postings_fact AS jpf
INNER JOIN company_dim AS cd 
    ON jpf.company_id = cd.company_id
WHERE 
    job_title_short = 'Data Engineer'
ORDER BY
    job_posted_date DESC
;
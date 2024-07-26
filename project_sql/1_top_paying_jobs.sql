/*
QUERY - Top paying Remote Data Scientist jobs
*/

SELECT 
    job_id,
    company_dim.name AS company_name,
    job_title, 
    job_schedule_type, 
    salary_year_avg, 
    job_location,
    job_posted_date
FROM 
    job_postings_fact
LEFT JOIN
    company_dim
ON
    company_dim.company_id = job_postings_fact.company_id
WHERE 
    job_title_short = 'Data Scientist' AND 
    salary_year_avg IS NOT NULL AND 
    job_location = 'Anywhere'
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
/*
the most in-demand skills for data Scientists
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN 
    skills_job_dim 
ON 
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim 
ON 
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND 
    job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10;

/*
Here's the breakdown of the most demanded skills for Data Scientists in 2023

Python and SQL lead the demand, underscoring the necessity for strong programming and database management skills. 
Specialized Tools like R, SAS, and Spark highlight the importance of proficiency in statistical analysis and big data processing. 
Cloud Platforms and Visualization tools such as AWS, Azure, Tableau, and Pandas emphasize the growing need for expertise in cloud computing and effective data presentation.

[
  {
    "skills": "python",
    "demand_count": "10390"
  },
  {
    "skills": "sql",
    "demand_count": "7488"
  },
  {
    "skills": "r",
    "demand_count": "4674"
  },
  {
    "skills": "aws",
    "demand_count": "2593"
  },
  {
    "skills": "tableau",
    "demand_count": "2458"
  },
  {
    "skills": "sas",
    "demand_count": "2214"
  },
  {
    "skills": "spark",
    "demand_count": "2008"
  },
  {
    "skills": "azure",
    "demand_count": "1919"
  },
  {
    "skills": "pandas",
    "demand_count": "1836"
  },
  {
    "skills": "tensorflow",
    "demand_count": "1836"
  }
]
*/
/*
top Data Scientist (remote) skills based on salary?
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS skill_avg_salary
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
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    skill_avg_salary DESC
LIMIT 25;

/*
Here's a breakdown of the results for top paying skills for remote data scientist roles in 2023:

High Demand for Specialized Programming Languages and Tools: Top salaries are commanded by skills in GDPR ($217,738), Golang ($208,750), and Elixir ($161,250), indicating a premium on specialized programming languages and compliance knowledge that are critical for niche applications and regulatory requirements.
Expertise in Big Data and Cloud Technologies: Skills in DynamoDB ($169,670), Neo4j ($171,655), and Cassandra ($160,850) are highly valued, reflecting the industry's need for professionals who can manage and analyze large datasets efficiently in cloud environments.
Proficiency in Advanced Data and Development Tools: Tools such as MicroStrategy ($171,147), Airflow ($157,414), and DataRobot ($164,500) highlight the importance of advanced data analytics, workflow automation, and machine learning platforms, which are crucial for sophisticated data processing and decision-making processes.

[
  {
    "skills": "gdpr",
    "skill_avg_salary": "217738"
  },
  {
    "skills": "golang",
    "skill_avg_salary": "208750"
  },
  {
    "skills": "atlassian",
    "skill_avg_salary": "189700"
  },
  {
    "skills": "selenium",
    "skill_avg_salary": "180000"
  },
  {
    "skills": "opencv",
    "skill_avg_salary": "172500"
  },
  {
    "skills": "neo4j",
    "skill_avg_salary": "171655"
  },
  {
    "skills": "microstrategy",
    "skill_avg_salary": "171147"
  },
  {
    "skills": "dynamodb",
    "skill_avg_salary": "169670"
  },
  {
    "skills": "php",
    "skill_avg_salary": "168125"
  },
  {
    "skills": "tidyverse",
    "skill_avg_salary": "165513"
  },
  {
    "skills": "solidity",
    "skill_avg_salary": "165000"
  },
  {
    "skills": "c",
    "skill_avg_salary": "164865"
  },
  {
    "skills": "go",
    "skill_avg_salary": "164691"
  },
  {
    "skills": "datarobot",
    "skill_avg_salary": "164500"
  },
  {
    "skills": "qlik",
    "skill_avg_salary": "164485"
  },
  {
    "skills": "redis",
    "skill_avg_salary": "162500"
  },
  {
    "skills": "watson",
    "skill_avg_salary": "161710"
  },
  {
    "skills": "rust",
    "skill_avg_salary": "161250"
  },
  {
    "skills": "elixir",
    "skill_avg_salary": "161250"
  },
  {
    "skills": "cassandra",
    "skill_avg_salary": "160850"
  },
  {
    "skills": "looker",
    "skill_avg_salary": "158715"
  },
  {
    "skills": "slack",
    "skill_avg_salary": "158333"
  },
  {
    "skills": "terminal",
    "skill_avg_salary": "157500"
  },
  {
    "skills": "airflow",
    "skill_avg_salary": "157414"
  },
  {
    "skills": "julia",
    "skill_avg_salary": "157244"
  }
]
*/
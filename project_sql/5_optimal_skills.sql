/*
the most optimal skills to learn (aka it’s in high demand and a high-paying skill)
*/

WITH demanded_skills AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
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
        salary_year_avg IS NOT NULL AND
        job_work_from_home = True 
    GROUP BY
        skills_dim.skill_id
), 
top_paid_skills AS (
    SELECT 
        skills_job_dim.skill_id,
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
        skills_job_dim.skill_id
)

SELECT
    demanded_skills.skill_id,
    demanded_skills.skills,
    demand_count,
    skill_avg_salary
FROM demanded_skills
INNER JOIN top_paid_skills ON demanded_skills.skill_id = top_paid_skills.skill_id
ORDER BY
    demand_count DESC,
    skill_avg_salary DESC
LIMIT 25;

-- rewriting this same query more concisely AND
-- ordering it based on avg_salary first
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*
Here's a breakdown of the most optimal skills for remote data scientist roles in 2023:

High-Demand Programming Languages and Tools: Python (demand count: 763, avg salary: $143,828) and Spark (demand count: 149, avg salary: $150,188) are among the top skills, emphasizing the need for expertise in versatile programming and big data processing technologies. Despite high demand, their average salaries indicate a balance between necessity and availability.
Cloud and Big Data Technologies: Skills in AWS (demand count: 217, avg salary: $149,630), GCP (demand count: 59, avg salary: $155,811), and Snowflake (demand count: 72, avg salary: $152,687) are highly sought after, reflecting the growing importance of cloud platforms and efficient data management in modern data science roles.
Data Visualization and Business Intelligence: Tableau (demand count: 219, avg salary: $146,970) and Looker (demand count: 57, avg salary: $158,715) are critical for data visualization, underscoring the essential role of data storytelling and business intelligence in making data-driven decisions.
Specialized and Emerging Technologies: Skills like Airflow (demand count: 23, avg salary: $157,414), Qlik (demand count: 15, avg salary: $164,485), and Pytorch (demand count: 115, avg salary: $152,603) are valued for their specialized applications in workflow automation, data analytics, and machine learning, indicating a premium for expertise in cutting-edge tools.
Database Management and Processing: Proficiency in SQL-based and NoSQL databases such as Redshift (demand count: 36, avg salary: $151,708), Cassandra (demand count: 34, avg salary: $160,850), and DynamoDB (demand count: 169,670) highlights the enduring need for robust data storage and retrieval skills in handling large datasets efficiently.

[
  {
    "skill_id": 26,
    "skills": "c",
    "demand_count": "48",
    "avg_salary": "164865"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "57",
    "avg_salary": "164691"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "15",
    "avg_salary": "164485"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "57",
    "avg_salary": "158715"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "23",
    "avg_salary": "157414"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "36",
    "avg_salary": "157142"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "56",
    "avg_salary": "156702"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "59",
    "avg_salary": "155811"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "72",
    "avg_salary": "152687"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "115",
    "avg_salary": "152603"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "36",
    "avg_salary": "151708"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "126",
    "avg_salary": "151536"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "22",
    "avg_salary": "151165"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "149",
    "avg_salary": "150188"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "217",
    "avg_salary": "149630"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "73",
    "avg_salary": "149089"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "demand_count": "81",
    "avg_salary": "148964"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "34",
    "avg_salary": "147544"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "219",
    "avg_salary": "146970"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "31",
    "avg_salary": "146110"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "64",
    "avg_salary": "145706"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "23",
    "avg_salary": "145139"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "113",
    "avg_salary": "144816"
  },
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "25",
    "avg_salary": "144498"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "763",
    "avg_salary": "143828"
  }
]
*/
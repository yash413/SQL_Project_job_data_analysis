/*
QUERY - Skills required for the top paying Data Scientist jobs from the table generated from 1st Query
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        company_dim.name AS company_name,
        job_title, 
        salary_year_avg
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
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills_dim.skills
FROM 
    top_paying_jobs
INNER JOIN 
    skills_job_dim
ON 
    top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
ON 
    skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
Here's the breakdown of the top skills for top paying remote data Scientist jobs in 2023
    1. SQL and Python are the most sought-after skills, appearing in 4 job postings each.
    2. Java is also in demand, with 3 mentions.
    3. Spark, AWS, TensorFlow, and PyTorch have moderate demand, appearing in 2 job postings each.
    4. A variety of other skills are mentioned once, indicating their relevance in specific roles or contexts. These include tools and technologies such as DataRobot, Scala, NumPy, Pandas, GCP, C, Keras, Scikit-learn, Azure, Tableau, Hadoop, Cassandra, and Kubernetes.

[
  {
    "job_id": 40145,
    "company_name": "Selby Jennings",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "company_name": "Selby Jennings",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "company_name": "Selby Jennings",
    "job_title": "Staff Data Scientist - Business Analytics",
    "salary_year_avg": "525000.0",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "azure"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "aws"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "keras"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "datarobot"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "c"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 129924,
    "company_name": "Storm4",
    "job_title": "Director of Data Science",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 129924,
    "company_name": "Storm4",
    "job_title": "Director of Data Science",
    "salary_year_avg": "300000.0",
    "skills": "pandas"
  },
  {
    "job_id": 129924,
    "company_name": "Storm4",
    "job_title": "Director of Data Science",
    "salary_year_avg": "300000.0",
    "skills": "numpy"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "scala"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "spark"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "kubernetes"
  }
]

*/
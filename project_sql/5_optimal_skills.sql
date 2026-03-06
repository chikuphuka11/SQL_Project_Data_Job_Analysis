/*
Question: What are the most optimal skills to learnn(high demand & high paying) for a Data Analyst or Business Analyst?
- Identify skills in high demand and associated with high average salaries for Data Analysts and Business Analysts.
- Concentrate on remote positions with specified salaries to ensure relevance to the current job market.
- Why? Target skills that are both in high demand and associated with higher salaries can help job seekers prioritize their learning efforts and increase their chances of securing well-paying positions in the fields of Data Analysis and Business Analysis.
*/  

WITH skills_demand AS (
    SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.skill_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
    salary_year_avg IS NOT NULL AND job_work_from_home = 'True'
GROUP BY
    skills_dim.skill_id
), average_salary AS (
    SELECT
    skills_job_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = 'True'
GROUP BY
    skills_job_dim.skill_id, skills_dim.skills
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 25;

/*
Some quick insights from the results:
- Cloud & Big data platforms lead in salary, with skills like pyspark, bitbucket, and watson commanding high average salaries for Data Analysts and Business Analysts.
- Programming languages with a twist like swift and datarobot are also among the top-paying skills, indicating a demand for professionals who can leverage these technologies in data analysis and business analysis roles.
- Bi & visualisation tools are obiqoitious, tableau and power bi are associated with higher salaries, suggesting that expertise in data visualization is increasingly important for Data Analysts and Business Analysts.
- Devops & collaboration tools like gitlab and bitbucket are in high demand and can lead to higher-paying job opportunities, highlighting the importance of version control and collaboration skills in these roles.
- Database & Datawarehousing remain core, oracle, redshift, and couchbase are associated with higher salaries, emphasizing the importance of understanding data storage and retrieval systems for these roles.
- Specialised or niche skills, such as datarobot and watson, can also command higher salaries, indicating that expertise in specific areas of data management and analysis is highly valued in the job market for Data Analysts and Business Analysts.

Overall, the results suggest that professionals with a combination of technical skills, such as cloud platforms, programming languages, and data visualization tools, along with foundational knowledge of data systems and collaboration tools, are likely to have access to higher-paying job opportunities in the fields of Data Analysis and Business Analysis.

[
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "11",
    "average_salary": "139006"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "38",
    "average_salary": "112989"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "25",
    "average_salary": "111849"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "30",
    "average_salary": "111121"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "16",
    "average_salary": "110813"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "35",
    "average_salary": "110804"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "14",
    "average_salary": "108415"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "average_salary": "108317"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "average_salary": "106683"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "54",
    "average_salary": "106259"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "43",
    "average_salary": "103877"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "22",
    "average_salary": "103403"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "15",
    "average_salary": "102624"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "256",
    "average_salary": "102578"
  },
  {
    "skill_id": 184,
    "skills": "dax",
    "demand_count": "11",
    "average_salary": "102500"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "21",
    "average_salary": "102258"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "156",
    "average_salary": "101223"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "15",
    "average_salary": "101037"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "15",
    "average_salary": "99993"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "257",
    "average_salary": "99807"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "17",
    "average_salary": "99558"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "70",
    "average_salary": "98908"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "70",
    "average_salary": "98908"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "12",
    "average_salary": "97795"
  },
  {
    "skill_id": 204,
    "skills": "visio",
    "demand_count": "12",
    "average_salary": "97576"
  }
]
*/
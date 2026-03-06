/*
Question: Whar the top paying skills for Data Analysts and Business Analysts positions?
- Look at th average salary associated with each skill for Data Analysts and Business Analysts positions.
- Focus on roles with specified salaries, regardless of location.
- Why? To identify the skills that are associated with higher-paying job opportunities for Data Analysts and Business Analysts, which can guide job seekers in prioritizing skill development to enhance their earning potential in these fields.
*/  

SELECT
    skills,
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
    skills
ORDER BY
    average_salary DESC
LIMIT 25;

/*
Some quick insights from the results:
- Big data, data visualization, and machine learning are among the top-paying skills for Data Analysts and Business Analysts positions.
- DevOps & developing tooling are highly valuable skills for these roles, indicating a demand for professionals who can manage and optimize data infrastructure and workflows.
- Cloud computing skills are also associated with higher salaries, suggesting that expertise in cloud platforms is increasingly important for Data Analysts and Business Analysts.
- Data science & machine learning skills are in high demand and can lead to higher-paying job opportunities, highlighting the importance of advanced analytics and predictive modeling in these roles.
- Specialised or niche skills, such as data engineering and data architecture, can also command higher salaries, indicating that expertise in specific areas of data management and analysis is highly valued in the job market for Data Analysts and Business Analysts.
- Foundational systems knowledge matters, as skills related to databases and data warehousing are also associated with higher salaries, emphasizing the importance of understanding data storage and retrieval systems for these roles.

Overall, the results suggest that professionals with a combination of technical skills, such as big data, machine learning, and cloud computing, along with foundational knowledge of data systems, are likely to have access to higher-paying job opportunities in the fields of Data Analysis and Business Analysis.

[
  {
    "skills": "pyspark",
    "average_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189155"
  },
  {
    "skills": "watson",
    "average_salary": "160515"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500"
  },
  {
    "skills": "swift",
    "average_salary": "153750"
  },
  {
    "skills": "jupyter",
    "average_salary": "152777"
  },
  {
    "skills": "chef",
    "average_salary": "152500"
  },
  {
    "skills": "pandas",
    "average_salary": "151821"
  },
  {
    "skills": "golang",
    "average_salary": "145000"
  },
  {
    "skills": "numpy",
    "average_salary": "143513"
  },
  {
    "skills": "databricks",
    "average_salary": "139006"
  },
  {
    "skills": "atlassian",
    "average_salary": "131162"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "127500"
  },
  {
    "skills": "twilio",
    "average_salary": "127000"
  },
  {
    "skills": "airflow",
    "average_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436"
  },
  {
    "skills": "scala",
    "average_salary": "124903"
  },
  {
    "skills": "crystal",
    "average_salary": "120100"
  },
  {
    "skills": "linux",
    "average_salary": "119338"
  },
  {
    "skills": "gcp",
    "average_salary": "119167"
  },
  {
    "skills": "kubernetes",
    "average_salary": "116667"
  },
  {
    "skills": "db2",
    "average_salary": "114158"
  }
]
*/

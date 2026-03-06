/*
Question: What are the most in-demand skills for a Data Analyst or Business Analyst?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for Data Analysts and Business Analysts
- Focus on all job postings
- Why? To understand the key skills that employers are looking for in Data Analysts and Business Analysts, which can help job seekers tailor their resumes and skill development efforts to increase their chances of landing a job in these fields.
*/  

SELECT 
    skills,
    COUNT(skills_job_dim.skill_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;



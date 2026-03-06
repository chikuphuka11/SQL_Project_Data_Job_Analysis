📊 Data Analyst & Business Analyst Job Market Analysis

# Introduction
This project dives into the world of data analyst and business analyst job postings to uncover the most valuable skills in today’s market. By analyzing salary data and skill demands, I aim to provide actionable insights for professionals looking to upskill or pivot their careers. The analysis focuses on top-paying roles, skill popularity, and the optimal balance between demand and compensation.

SQL queries? Check them out here: [project_sql_folder](/project_sql/)

# Background
Driven by the rapid evolution of data roles, I wanted to understand which skills truly make a difference in earning potential. Using a dataset of real job postings, I extracted key metrics to answer questions like:

- Which skills are associated with the highest salaries?

- What tools and technologies are most in demand?

- Where can learners get the best "bang for their buck" – skills that are both high-paying and frequently requested?

The data comes from a collection of top data analyst and business analyst job listings, enriched with salary information and required skills.

# Tools I Used
- SQL – for querying and aggregating job posting data (PostgreSQL)

- Python – for data manipulation (pandas) and visualization (matplotlib, seaborn)

- Jupyter Notebook – for interactive analysis and documentation

- Git & GitHub – for version control and project sharing

- Excel – for quick data exploration and validation

# The Analyis
*The project was broken into several analytical steps:*

1. **Top-Paying Job Identification**
I first isolated the highest-paying roles by filtering for jobs with non-null salaries and sorting by annual average salary. This created a baseline of "elite" positions. This query highlights the high paying opportunities in the field:

![Top Paying Roles](assets\top_paying_roles.png) *Bar graph visualising the results*

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
    (job_location = 'Anywhere' OR job_location = 'Remote') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 100
```
*Here's the breakdown of the top data analyst jobs from the dataset:*

- **Massive outlier**: The **Data Analyst** role at **Mantys** pays **$650,000** – far above all others. This could be a highly specialized position (e.g., quant finance, executive-level, or including significant equity) or a data entry error, but it stands out dramatically.
- **Big Tech dominates**: Companies like **Meta** (Director of Analytics, $336.5k), **Uber** (Manager II, $214.5k), **Pinterest** (Data Analyst, Marketing, $232k), and **AT&T** (Associate Director, $255.8k) offer salaries well above $200k, reflecting the premium placed on data leadership in tech.
- **Consistent pay at financial firms**: **Multicoin Capital** lists two “Analyst” roles at **$200k** each, showing competitive base pay in crypto/finance.
- **Healthcare and fintech also strong**: **Uclahealthcareers** ($217k) and **SmartAsset** ($205k) prove that data analysts outside traditional tech can command high salaries.
- **Title hierarchy reflects pay**: Director/Associate Director roles ($255k–$336k) outearn Principal/Lead roles ($205k–$220k), which in turn outearn general “Analyst” titles ($200k–$232k). The Mantys role breaks this pattern, suggesting it’s likely a senior or niche position.
- **Remote work is standard**: All positions are listed as “Anywhere,” confirming that top-tier data jobs are increasingly location-agnostic.
- **Posting dates vary**: Jobs were posted throughout 2023, with no clear seasonal spike; the Mantys posting was early (Feb), while others appeared later in the year.

2. **Skill Salary Analysis
By joining job postings with the associated skills** I calculated the average salary for each skill – revealing which technical competencies command the highest pay. For example, PySpark topped the list at $208k, followed by Bitbucket ($189k) and Watson ($160k).

![top 10 highest-paying remote data jobs](assets\top 10 highest-paying remote data jobs.png) *This chart clearly visualizes the salary hierarchy, with AT&T’s role as the clear outlier. Run the code in any Python environment (Jupyter, VS Code) to generate the graph.*

```
WITH 
top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst') AND
        (job_location = 'Anywhere' OR job_location = 'Remote') AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 100
)

SELECT 
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
```
Based on the provided data, the top 10 highest-paying remote data jobs are:

**Pinterest’s marketing**-focused analyst earns $232k, showing the value of domain expertise.

**SmartAsset appears twice** ($205k and $186k), indicating strong demand for data talent in fintech.

**Titles span leadership (Director, Manager) and senior individual contributor roles**, proving both paths pay well.

**Industries are diverse**: telecom, social media, healthcare, ridesharing, gaming, and autonomous vehicles.

**All positions are remote or hybrid**, confirming the shift to flexible work in high-paying data roles.

**Salary range:** $186k–$256k, a $70k spread – even the lowest in this top 10 is exceptionally high.

3. Demand Analysis
I counted how frequently each skill appeared across all job postings. This highlighted universal requirements like SQL (78% of jobs), Python (59%), and Tableau (42%).

**Quick Insights on Top Demanded Skills**

- SQL leads with 110,000 mentions – the universal language for data querying and manipulation.

- Excel follows at 84,165, proving its enduring importance in business analysis.

- Python is third with 65,423, essential for automation, analysis, and machine learning.

- Tableau (55,878) and Power BI (48,719) round out the top five visualization tools, with Tableau slightly ahead.

- The top three skills (SQL, Excel, Python) are core to almost every data role, while visualization tools are highly sought after for communicating insights.

**Table of Top Demanded Skills**

| Skill     | Demand Count |
|-----------|--------------|
| SQL       | 110,000      |
| Excel     | 84,165       |
| Python    | 65,423       |
| Tableau   | 55,878       |
| Power BI  | 48,719       |

4. Optimal Skills (High Demand + High Salary)
Combining demand and salary data, I identified the most strategic skills to learn. Databricks, Snowflake, and Go emerged as top contenders – offering strong salaries while still being in moderate-to-high demand.

*Here are quick insights on the top-paying skills based on average salary:*

- **PySpark** tops the list at **$208k**, highlighting the premium on big data processing and distributed computing.

- **DevOps and version control tools** (Bitbucket, GitLab, Jenkins, Chef) are highly valued, with salaries ranging from $125k–$189k.

- **AI/ML platforms and libraries** (Watson, DataRobot, pandas, NumPy, scikit-learn) consistently pay well, reflecting the demand for machine learning expertise.

- **Cloud and container technologies** (GCP, Kubernetes) also appear, though their salaries are slightly lower ($116k–$119k).

- **Niche or specialized tools** (Couchbase, Elasticsearch, Twilio, Crystal) command strong salaries, indicating that deep expertise in specific technologies is rewarded.

| Skill         | Average Salary |
|---------------|----------------|
| pyspark       | $208,172       |
| bitbucket     | $189,155       |
| watson        | $160,515       |
| couchbase     | $160,515       |
| datarobot     | $155,486       |
| gitlab        | $154,500       |
| swift         | $153,750       |
| jupyter       | $152,777       |
| chef          | $152,500       |
| pandas        | $151,821       |
| golang        | $145,000       |
| numpy         | $143,513       |
| databricks    | $139,006       |
| atlassian     | $131,162       |
| elasticsearch | $127,500       |
| twilio        | $127,000       |
| airflow       | $126,103       |
| scikit-learn  | $125,781       |
| jenkins       | $125,436       |
| scala         | $124,903       |
| crystal       | $120,100       |
| linux         | $119,338       |
| gcp           | $119,167       |
| kubernetes    | $116,667       |
| db2           | $114,158       |

5. Trend Spotting
I analyzed the data for broader trends:

- Cloud & Big Data skills (Azure, AWS, Hadoop) consistently pay above average.

- DevOps tools (GitLab, Jenkins, Chef) appear in high-paying roles, indicating a blend of analytics and engineering.

- Core BI tools (Tableau, Looker) are in massive demand, though their salaries are slightly lower than niche technologies.

## Quick Insights on Optimal Skills (High Demand & High Pay)

- **Databricks** offers the highest average salary ($139k) but has relatively low demand (11), making it a specialized, high-value skill.

- **Cloud and big data platforms** (Snowflake, Hadoop, BigQuery, Azure, AWS) consistently pay above $110k with moderate to high demand – a sweet spot for career growth.

- **Collaboration tools** (Confluence, Jira) also command strong salaries ($108k, $103k), reflecting the importance of agile workflows in data teams.

- **Core programming languages** (Python, R) have the highest demand (256, 156) but slightly lower salaries (~$101k–$102k) due to their ubiquity.

- **BI and visualization tools** (Tableau, Looker, Qlik, Power BI via DAX) are in high demand with salaries ranging from $99k to $106k.

- **Database technologies** (Oracle, NoSQL, Redshift) remain valuable, with salaries above $100k and moderate demand.

- **Microsoft BI stack** (SSIS, SSRS) and legacy tools (C++, Visio) have lower demand and salaries, making them less optimal for new learners.

### Optimal Skills Table
| Skill       | Demand Count | Average Salary |
|-------------|--------------|----------------|
| databricks  | 11           | $139,006       |
| snowflake   | 38           | $112,989       |
| hadoop      | 25           | $111,849       |
| go          | 30           | $111,121       |
| bigquery    | 16           | $110,813       |
| azure       | 35           | $110,804       |
| confluence  | 14           | $108,415       |
| aws         | 32           | $108,317       |
| ssis        | 12           | $106,683       |
| looker      | 54           | $106,259       |
| oracle      | 43           | $103,877       |
| jira        | 22           | $103,403       |
| nosql       | 15           | $102,624       |
| python      | 256          | $102,578       |
| dax         | 11           | $102,500       |
| java        | 21           | $102,258       |
| r           | 156          | $101,223       |
| qlik        | 15           | $101,037       |
| ssrs        | 15           | $99,993        |
| tableau     | 257          | $99,807        |
| redshift    | 17           | $99,558        |
| sas         | 70           | $98,908        |
| c++         | 12           | $97,795        |
| visio       | 12           | $97,576        |

*Note: SAS appears twice with identical values – likely a data artifact.*

# What I Learned
*Throughout this analysis, several key insights crystallized:*

- SQL and Python remain non-negotiable – they are the foundation of nearly every high-paying role.

- Specialization pays off – skills like PySpark, Databricks, and Go are less common but offer premium salaries.

- The rise of the "hybrid" analyst – top earners often possess a mix of data engineering, cloud, and even DevOps knowledge.

# Conclusions 
*For aspiring data and business analysts, this project suggests a clear roadmap:*

1. **Master the essentials** – SQL, Python, and a BI tool (Tableau or Looker).

2. **Differentiate with high-impact skills** – cloud platforms (AWS, Azure), big data frameworks (Spark, Databricks), and modern languages (Go).

3. **Embrace the engineering side** – familiarity with version control, CI/CD, and workflow tools (Airflow) can significantly boost earning potential.

4. **Stay adaptable** – the market values both depth (specialized tools) and breadth (cross-functional knowledge).

This analysis is a snapshot of the current job market, but the principles remain: invest in skills that are both sought-after and scarce, and you'll position yourself for success.

## **Closing Thoughts** 
Completing this first data analysis project has been an exciting and insightful journey. It gave me the opportunity to apply SQL for querying real-world job data, Python for deeper analysis and visualization, and critical thinking to uncover meaningful trends in the data job market.

From identifying top-paying roles and the most in-demand skills to finding the optimal balance between salary and demand, every step reinforced the importance of asking the right questions and letting the data guide the answers.
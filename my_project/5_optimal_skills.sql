--High paying and high demanding skills
WITH high_demanded as (SELECT
sk.skills,
sk.skill_id,
count(j.job_id)as skill_demand_count

FROM
job_postings_fact AS j
INNER JOIN skills_job_dim as s ON j.job_id=s.job_id
INNER JOIN skills_dim as sk on s.skill_id=sk.skill_id
WHERE
job_title_short='Data Analyst' and salary_year_avg is not null

and job_work_from_home= TRUE
group BY
sk.skill_id,sk.skills)
,

 high_pay as(SELECT
 sk.skills,
 sk.skill_id,
avg(j.salary_year_avg)as skill_avg_salary


FROM
job_postings_fact AS j
INNER JOIN skills_job_dim as s ON j.job_id=s.job_id
INNER JOIN skills_dim as sk on s.skill_id=sk.skill_id

WHERE
job_title_short='Data Analyst' and salary_year_avg is not NULL

and job_work_from_home= TRUE
group BY
 sk.skill_id,
  sk.skills

)
select
hd.skill_id ,
hd.skills AS skill_name,
hp.skill_avg_salary,
hd.skill_demand_count
from
high_demanded as hd INNER JOIN high_pay as hp
on hp.skills=hd.skills
where 
hd.skill_demand_count>10
order BY
hp.skill_avg_salary desc,
hd.skill_demand_count DESC

limit 25

SELECT
    sk.skills,
    COUNT(j.job_id) AS skill_demand_count,
    ROUND(AVG(j.salary_year_avg), 2) AS skill_avg_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS s ON j.job_id = s.job_id
INNER JOIN skills_dim AS sk ON s.skill_id = sk.skill_id
WHERE
    j.job_title_short = 'Data Analyst'
    AND j.salary_year_avg IS NOT NULL
GROUP BY
    sk.skills
HAVING
    COUNT(j.job_id) > 10 -- Filters out niche skills with inflated salary averages
ORDER BY
    skill_demand_count DESC,
    skill_avg_salary DESC
LIMIT 25;
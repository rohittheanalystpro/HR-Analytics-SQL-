-- create database
create database hr_dataset;

-- Use database
Use hr_dataset;

-- Describe 
desc hr_analytics;

-- select all data from hr_analytics
select * from hr_analytics;

-- top 5 monthly salaries of employees department-wise
select monthlyincome, department 
from hr_analytics
order by monthlyincome desc
limit 5;

-- select average income of employees department-wise
select department, avg(monthlyincome) as avgsalary
from hr_analytics
group by department;

-- calculate gender percentage
select gender, count(*) as gender_count,
(count(*) * 100.0 / (select count(*) from hr_analytics)) as gender_percentage
from hr_analytics
group by gender;

-- select maximum & minimum salary of employees department-wise
select department,max(monthlyincome) as max_salary,
min(monthlyincome) as min_salary
from hr_analytics
group by department;

-- find total number of male and female employees whose marital status is single & have job satisfaction greater than 2
select gender, count(maritalstatus)from hr_analytics where maritalstatus = 'single'
and jobsatisfaction > 2
group by gender;

-- find details of employees aged between 25 and 35, gender-wise
select gender, count(age) as age_count from hr_analytics
where age between 25 and 35
group by gender;

-- job satisfaction >= 3, gender-wise
select gender, count(jobsatisfaction) from hr_analytics
where jobsatisfaction >= 3
group by gender;

-- top 10 daily rates job role-wise
select jobrole, count(dailyrate) from hr_analytics
group by jobrole;

-- marital status and relationship satisfaction
select maritalstatus, max(relationshipsatisfaction), min(relationshipsatisfaction)
from hr_analytics
group by maritalstatus;

-- which departments offer the highest percentage salary hikes?
select department, avg(percentsalaryhike) as avg_salary_hike from hr_analytics
group by department
order by avg_salary_hike desc;

-- does work-life balance impact job satisfaction?
select worklifebalance, avg(jobsatisfaction) as avg_job_satisfaction from hr_analytics
group by worklifebalance
order by avg_job_satisfaction desc;

-- distribution of business travel frequency by gender
select businesstravel, gender, count(*) as employee_count
from hr_analytics
group by businesstravel, gender
order by businesstravel, gender;

-- which education fields have the most employees with high job involvement?
select educationfield, avg(jobinvolvement) as avg_job_involvement
from hr_analytics
group by educationfield
order by avg_job_involvement desc;

-- filter employees gender-wise who are in the 'sales' department and have a monthly income greater than 6000
select gender, department, monthlyincome
from hr_analytics
where department = 'sales' and monthlyincome > 6000;

-- filter employees in the 'hr' or 'sales' departments
select gender, department, monthlyincome
from hr_analytics
where department in ('hr', 'sales');

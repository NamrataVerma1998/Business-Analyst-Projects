Create Database Banking_AND_Finance_Project1;

Rename table train to Banking_data;

-- Q1. What is the total number of customers and overall subscription rate (y = 'yes')?

select
count(job) as total_customer,
sum(case when y = 'yes' Then 1 Else 0 END) as total_subscription,
sum(case when y = 'yes' Then 1 Else 0 END)/ count(job) * 100 as Subscription_rate
from Banking_data;

-- Q2. What is the distribution of customers across different job categories?

Select 
Job,
count(Job)
from Banking_Data
group by Job;

-- Q3. What is the average age and average balance of customers?

Select
avg(age),
avg(balance)
from Banking_data;

-- Q4. What is the subscription rate by job category?

select
Job,
count(job) as total_customer,
sum(case when y = 'yes' Then 1 Else 0 END) as total_subscription,
sum(case when y = 'yes' Then 1 Else 0 END)/ count(job) * 100 as Subscription_rate
from Banking_data
Group by Job;

-- Q5. How does education level impact subscription rate?

select
Education,
count(job) as total_customer,
sum(case when y = 'yes' Then 1 Else 0 END) as total_subscription,
sum(case when y = 'yes' Then 1 Else 0 END)/ count(job) * 100 as Subscription_rate
from Banking_data
Group by Education;

-- Q6. What is the subscription rate for customers with and without housing loans?

select
Housing,
count(job) as total_customer,
sum(case when y = 'yes' Then 1 Else 0 END) as total_subscription,
sum(case when y = 'yes' Then 1 Else 0 END)/ count(job) * 100 as Subscription_rate
from Banking_data
Group by Housing;

-- Q7. Which month has the highest number of successful subscriptions?

select
Month,
sum(case when y = 'yes' Then 1 Else 0 END) as total_subscription
from Banking_data
group by Month
order by total_subscription desc
Limit 1;

-- Q8. How does duration impact subscription rate? 

Select
case 
when duration < 200 then 'Short'
when duration between 200 and 500 then 'Medium'
Else 'Long' END AS Duration_type,
count(*) As total_customers,
sum(case when y = 'yes' Then 1 Else 0 END) as total_subscription
 from Banking_data
 group by Duration_type 
 order by total_subscription Desc;
 
 -- Q9. Rank job categories based on subscription rate using window functions
 
 
select
Job,
count(job) as total_customer,
sum(case when y = 'yes' Then 1 Else 0 END) as total_subscription,
sum(case when y = 'yes' Then 1 Else 0 END)/ count(job) * 100 as Subscription_rate,
Rank() over ( order by (sum(case when y = 'yes' Then 1 Else 0 END)/ count(job) * 100) desc) as job_rank
from Banking_data
Group by Job;

-- Q10. Segment customers into age groups and identify which group has the highest conversion rate.

Select
case 
when Age < 30 then 'Young Age'
when Age between 30 and 50 then 'Medium Age'
Else 'Senior' END AS Age_group,
count(*) As total_customers,
sum(case when y = 'yes' Then 1 Else 0 END) as total_subscription
 from Banking_data
 group by Age_group
 order by total_subscription Desc;

 
 
 

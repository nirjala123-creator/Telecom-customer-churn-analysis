select * from churn

--Q1.Find the total number of customers, the number of churned customers,
--and the number of retained customers.
select count("customerID") as total_customers,--7032
sum(case when "Churn"='Yes' then 1 else 0 end)as churned_customers,--1869
sum(case when "Churn"='No' then 1 else 0 end)as retained_customers--5163
from churn

--Q2.Find the churn rate (percentage of customers who churned) rounded to 2 decimal places.
select round(100*sum(case when "Churn"='Yes'then 1 else 0 end)/count("customerID"),2) as churn_rate
from churn --26%

--Q3.Find the total number of customers, churned customers, and churn rate for each contract type, ordered by churn rate in descending order.
select count("customerID") as total_customers,
sum(case when "Churn"='Yes'then 1 else 0 end) as churned_customers,
round(100*sum(case when "Churn"='Yes'then 1 else 0 end)/count("customerID"),2) as churn_rate,
"Contract"
from churn
group by "Contract"
order by churn_rate desc;

--Q4.Find the total customers, churned customers, and churn rate for each Internet Service type, ordered by churn rate in descending order.
select count("customerID") as total_customers,
sum(case when "Churn"='Yes'then 1 else 0 end) as churned_customers,
round(100*sum(case when "Churn"='Yes'then 1 else 0 end)/count("customerID"),2) as churn_rate,
"InternetService"
from churn
group by "InternetService"
order by churn_rate desc;

--Q5.Find the total customers, churned customers, and churn rate for each payment method, ordered by churn rate in descending order.
select count("customerID") as total_customers,
sum(case when "Churn"='Yes'then 1 else 0 end) as churned_customers,
round(100*sum(case when "Churn"='Yes'then 1 else 0 end)/count("customerID"),2) as churn_rate,
"PaymentMethod"
from churn
group by "PaymentMethod"
order by churn_rate desc;

--Q6.Find the average monthly charges and average total charges for churned and retained customers separately.
SELECT
    "Churn",
    ROUND(AVG("MonthlyCharges")::numeric, 2) AS avg_monthly_charges,
    ROUND(AVG("TotalCharges")::numeric, 2) AS avg_total_charges
FROM churn
GROUP BY "Churn";

--Q7.Find the average tenure of churned and retained customers.
select "Churn",round(avg("tenure"),2) as avg_tenure
from churn
group by "Churn"

--Q8.Find the top 5 combinations of Contract and Internet Service having the highest churn rate.
SELECT
    "Contract",
    "InternetService",
    --COUNT("customerID") AS total_customers,
    --SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END)
        / COUNT("customerID"),
        2
    ) AS churn_rate
FROM churn
GROUP BY "Contract", "InternetService"
ORDER BY churn_rate DESC
LIMIT 5;

--Q9.Find the number of customers in each tenure group (0–12, 13–24, 25–36, 37–48, 49–60, Above 60 months).
SELECT
    CASE
        WHEN "tenure" BETWEEN 0 AND 12 THEN '0-12 Months'
        WHEN "tenure" BETWEEN 13 AND 24 THEN '13-24 Months'
        WHEN "tenure" BETWEEN 25 AND 36 THEN '25-36 Months'
        WHEN "tenure" BETWEEN 37 AND 48 THEN '37-48 Months'
        WHEN "tenure" BETWEEN 49 AND 60 THEN '49-60 Months'
        ELSE 'Above 60 Months'
    END AS tenure_group,
    COUNT("customerID") AS total_customers
FROM churn
GROUP BY
    CASE
        WHEN "tenure" BETWEEN 0 AND 12 THEN '0-12 Months'
        WHEN "tenure" BETWEEN 13 AND 24 THEN '13-24 Months'
        WHEN "tenure" BETWEEN 25 AND 36 THEN '25-36 Months'
        WHEN "tenure" BETWEEN 37 AND 48 THEN '37-48 Months'
        WHEN "tenure" BETWEEN 49 AND 60 THEN '49-60 Months'
        ELSE 'Above 60 Months'
    END
ORDER BY total_customers DESC;

--Q10.Find the churn rate for Senior Citizens and Non-Senior Citizens separately.
select round(100*sum(case when "Churn"='Yes' then 1 else 0 end)/count("customerID"),2) as churn_rate,
case when "SeniorCitizen"=1 then 'Senior Citizens' else 'non-Senior Citizens' end
from churn
group by "SeniorCitizen"
order by churn_rate desc

--Q11.Find the churn rate for customers with and without Tech Support.
select round(100*sum(case when "Churn"='Yes' then 1 else 0 end)/count("customerID"),2) as churn_rate,
case when "TechSupport"='Yes' then 'with Tech Support' else 'Without tech Support' end as TechSupport
from churn
group by TechSupport
order by churn_Rate desc

--Q12.Find the average monthly charges for each contract type.
select "Contract",avg("MonthlyCharges")
from churn
group by "Contract"
order by avg("MonthlyCharges") desc

--Q13.Find the top 5 payment methods with the highest average monthly charges.
select "PaymentMethod",avg("MonthlyCharges")
from churn 
group by "PaymentMethod"
order by avg("MonthlyCharges") desc
limit 5

--Q14.Find the number of customers using each Internet Service and their average monthly charges.
select count("customerID"),"InternetService",round(avg("MonthlyCharges"),2)
from churn
group by "InternetService"
order by count("customerID")

--Q15.Find which customer segment is most likely to churn by analyzing the combination of Partner and Dependents.
select "Partner","Dependents",round(100*sum(case when "Churn"='Yes'then 1 else 0 end)/count("customerID"),2) as churn_rate
from churn 
group by "Partner","Dependents"
order by churn_rate desc
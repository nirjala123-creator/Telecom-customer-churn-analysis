# Telecom Customer Churn Analysis

## Project Overview
This project focuses on analyzing customer retention and churn behavior in a telecom company. The objective is to identify key factors influencing customer churn, uncover customer retention patterns, and generate actionable business insights that can help reduce customer attrition.

The project combines data cleaning, SQL-based exploratory analysis, and an interactive Power BI dashboard to provide a comprehensive view of customer behavior.

## Business Problem
Customer churn is one of the most critical challenges for subscription-based businesses. Acquiring new customers is often more expensive than retaining existing ones. Therefore, understanding why customers leave and identifying high-risk customer segments is essential for improving retention strategies and maximizing revenue.

## Dataset Information
The dataset contains customer demographic information, subscription details, service usage patterns, billing information, and churn status.

### Key Attributes
* Customer Demographics
  * Gender
  * Senior Citizen
  * Partner
  * Dependents

* Service Information
  * Phone Service
  * Internet Service
  * Online Security
  * Online Backup
  * Device Protection
  * Tech Support
  * Streaming TV
  * Streaming Movies

* Subscription Information
  * Contract Type
  * Payment Method
  * Paperless Billing
  * Tenure

* Financial Information

  * Monthly Charges
  * Total Charges

* Target Variable
  * Churn (Yes / No)

## Tools & Technologies
* Python (Pandas, NumPy)
* PostgreSQL
* Power BI
* Git & GitHub

## Data Cleaning & Preparation
The following preprocessing steps were performed:

* Checked for missing values
* Removed leading/trailing spaces from categorical columns
* Verified data types
* Created tenure groups for customer segmentation
* Performed data validation and consistency checks

## SQL Analysis
Business-focused SQL queries were used to analyze:

* Overall churn rate
* Churn by contract type
* Churn by internet service
* Churn by payment method
* Churn by senior citizen status
* Churn by partner and dependent status
* Customer distribution across tenure groups
* Average monthly charges by customer segment

## Power BI Dashboard
The interactive dashboard provides:

* Total Customers
* Churned Customers
* Retained Customers
* Overall Churn Rate
* Churn Rate by Contract Type
* Churn Rate by Internet Service
* Churn Rate by Senior Citizen Status
* Customer Distribution by Tenure
* Customer Charges Analysis
* Customer Segmentation Analysis

Dashboard filters include:
* Gender
* Contract Type
* Payment Method
* Internet Service

## Key Business Insights
* Customers with Month-to-Month contracts exhibit the highest churn rate.
* Fiber Optic customers are more likely to churn compared to DSL users.
* Senior Citizens show a higher churn tendency than non-senior customers.
* Customers with shorter tenure are significantly more likely to leave the service.
* Customers without partners or dependents display relatively higher churn rates.
* The overall churn rate is approximately 26.58%, indicating that more than one-quarter of customers discontinued the service.

## Business Recommendations
* Encourage customers to migrate from Month-to-Month plans to long-term contracts through targeted incentives.
* Investigate customer satisfaction among Fiber Optic users and address potential service concerns.
* Develop retention campaigns specifically for new customers during their first year.
* Offer personalized retention strategies for high-risk customer segments.
* Improve customer engagement through loyalty and rewards programs.

## Project Outcome
This project demonstrates the end-to-end data analytics workflow:

Data Cleaning → SQL Analysis → Data Visualization → Business Insights → Recommendations

The final dashboard enables stakeholders to identify churn drivers, understand customer behavior, and make informed retention decisions.

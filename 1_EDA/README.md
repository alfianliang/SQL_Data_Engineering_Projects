# Exploratory Data Analysis with SQL: Job Market Analysis

![Project 1 Overview](../images/1_1_Project1_EDA.png) 

A sql project showcasing my ability to

## Executive Summary (For Hiring Managers)
- **Project Scope:** Built 3 analytical queries that answer key questions about the data engineer job market.
- **Data Modeling:** Used multi-table joins across fact and dimension tables to extract insights.
- **Analytics:** Applied aggregations, filtering, and sorting to find top skills by demand, salary, and overall value.
- **Outcomes:** Delivered actionable insights on SQL/Python dominance, cloud trends, and salary patterns

Review:
1. [`01_top_demanded_skills.sql`](./01_top_demanded_skills.sql) - demand analysis with multi-table joins.
2. [`02_highest_paying_skills.sql`](./02_highest_paying_skills.sql) - salary analysis with aggregations.
3. [`03_most_optimal_skills.sql`](./03_most_optimal_skills.sql) - combined demand and salary optimization query.

## Problem & Context
- **Most in-demand skills:** Which skills are most in-demand for data engineers?
- **Highest paid:** Which skills result in the highest salaries?
- **Best trade-off:** What is the optimal skill set when the balance of demand and compensation is taken into account?

This project analyzes a **data warehouse** built using a star schema design. The warehouse structure consists of:

![Data Warehouse](../images/1_2_Data_Warehouse.png)
- **Fact Table:** `job_postings_fact` - Central table containing job posting details (job titles, locations, salaries, dates, etc.).
- **Dimension Tables:**
    - `company_dim` - Company information linked to job postings.
    - `skills_dim`  - Skills catalog with skill names and types.
- **Bridge Table:** `skills_job_dim`  - Resolves the many-to-many relationship between job postings and skills.

From these interconnected tables, I queried across them and extracted insights about skill demand, salary patterns, and optimal skill combinations for data engineering roles.

## Tech Stack
- **Query Engine:** DuckDB for fast OLAP-style analytical queries. 
- **Language:** SQL (ANSI-style with analytical functions).
- **Data Model:** Star schema with fact + dimension + bridge tables.
- **Development:** VS Code for SQL editing + Terminal for DuckDB CLI. 
- **Version Control:** Git/GitHub for versioned SQL scripts.

## Analysis Overview

### Query Structure
1. **[Top Demanded Skills](./01_top_demanded_skills.sql)** - demand analysis with multi-table joins.
2. **[Top Paying Skills](./02_highest_paying_skills.sql)** - salary analysis with aggregations.
3. **[Most Optimal Skills](./03_most_optimal_skills.sql)** - combined demand and salary optimization query.

### Key Insights
- Core languages: SQL and Python appear in about 1000 job postings.
- Cloud platforms: aws, gcp, and azure are use widely across many data engineering jobs.
- Infra & tooling: Kubernetes and Docker are  associated with high salaries.
- Big data tools: Apache spark shows up in one of the most in-demand skills with fairly high salary.

## SQL Skills Demonstrated

### Query Design & Optimization

- **Complex Joins:** `INNER JOIN` operations across `job_postings_fact`, `skills_job_dim`, and `skills_dim`.
- **Aggregation:** `COUNT()`, `MEDIAN()`, `ROUND()` for statistical analysis.
- **Filtering:** Boolean logic with WHERE clauses and multiple conditions (`job_title_short`, `job_country`).
- **Sorting & Limiting:** `ORDER BY` with `DESC` and `LIMIT` for top-N analysis.

### Data Analysis Techniques
- **Grouping:** `GROUP BY` for categorical analysis by skill.
- **Mathematical Functions:** `LN()` for natural logarithm transformation to normalize demand metrics.
- **Calculated Metrics:** : Derived optimal score combining log-transformed demand with median salary.
- **Having Clause:** Filtering aggregated results (skills with >= 100 postings).
# SQL Queries

This folder contains the SQL queries used to build the key metrics and retention analyses.

## Files
- 01_data_exploration.sql
- 02_weekly_user_workouts.sql
- 03_habit_threshold.sql
- 04_retention_cohorts.sql

## 04_cohort_retention.sql

Builds weekly retention cohorts based on signup month.

### Key concepts
- **Cohort** = month of user signup
- **Week index** = number of weeks since signup
- **Retention** = active users / cohort size

### Used in
- Power BI retention heatmap
- Page: *Retention & First 14 Days*

This query highlights:
- Massive drop-off between W0 and W1
- Retention stabilization after W2
- Binary adoption pattern (users either adopt early or churn)

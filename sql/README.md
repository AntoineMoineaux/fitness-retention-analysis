# SQL Queries

This folder contains the SQL queries used to build the key metrics and retention analyses.

## Files
- 01_data_exploration.sql
- 02_weekly_user_workouts.sql
- 03_habit_threshold.sql
- 04_cohort_retention.sql

## Query map (how SQL connects to the dashboards)

| File | Purpose | Used in |
|------|---------|---------|
| 01_data_exploration.sql | Sanity checks: volumes, date coverage | Setup |
| 02_weekly_user_workouts.sql | User-week grain table: workouts/week | Dashboard 2, Dashboard 3 |
| 03_habit_threshold.sql | Bucket users by habit threshold (1 vs 2+) | Dashboard 2 |
| 04_cohort_retention.sql | Cohort retention by signup month and week index | Dashboard 3 |

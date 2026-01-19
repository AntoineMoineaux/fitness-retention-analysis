# Data Model

This project uses a simplified fitness app data model.

## Core tables

### users
- user_id (primary key)
- signup_date

### workouts
- workout_id
- user_id (foreign key → users.user_id)
- workout_date

## Derived tables / views

### weekly_user_workouts
- Grain: 1 row per user per calendar week
- Fields: user_id, year_week, workouts_per_week

### v_wau_weekly
- Grain: 1 row per week
- Metric: Weekly Active Users (>=1 workout)

### v_north_star_weekly
- Grain: 1 row per week
- Metric: users with >=2 workouts per week

### v_cohort_retention_weekly
- Grain: cohort_month × week_index
- Metric: retention percentage

## Design choices
- Weekly aggregation chosen to match habit formation patterns
- Workouts used as proxy for engagement

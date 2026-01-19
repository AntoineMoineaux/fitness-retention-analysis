-- 04_retention_cohorts.sql
-- Goal: cohort retention by signup month and week offset (W0, W1, W2...)

-- This is intentionally pseudo-code: adapt to your date fields.

-- Steps:
-- 1) Define cohort = signup month
-- 2) Define activity week = week(workout_date)
-- 3) Compute week_offset = activity_week - signup_week
-- 4) Retention = users active at week_offset / cohort_size

-- You can implement in SQLite using strftime('%Y-%W', date)
-- and a helper to convert year-week to an index if needed.

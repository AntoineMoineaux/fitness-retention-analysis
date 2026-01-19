-- 04_cohort_retention.sql
-- Purpose:
--   Build weekly retention cohorts based on user signup month.
--   Output is used to power a cohort retention heatmap in Power BI.
--
-- Definitions:
--   - Cohort: users grouped by signup month (YYYY-MM).
--   - Active user (for retention): user with >= 1 workout in a given week after signup.
--   - week_index: number of full weeks since signup (0 = week of signup).
--
-- Notes / Assumptions:
--   - Using workouts as the activity event (proxy for engagement).
--   - Only workouts on/after signup are considered (negative deltas filtered out).
--   - week_index is computed using an integer floor of days_since_signup / 7.
--     This means:
--       days 0-6   -> week 0
--       days 7-13  -> week 1
--       etc.

WITH activity AS (
  -- Grain: one row per (user, workout) with cohort label + week index
  SELECT
    u.user_id,
    strftime('%Y-%m', u.signup_date) AS cohort_month,

    -- Week index since signup (0-based)
    -- We cast to INTEGER to floor the division.
    CAST(
      (julianday(w.workout_date) - julianday(u.signup_date)) / 7
      AS INTEGER
    ) AS week_index

  FROM users u
  JOIN workouts w
    ON u.user_id = w.user_id

  -- Keep only workouts happening on/after signup date
  WHERE julianday(w.workout_date) >= julianday(u.signup_date)
),

cohort_size AS (
  -- Grain: one row per cohort_month with total users in that cohort
  SELECT
    strftime('%Y-%m', signup_date) AS cohort_month,
    COUNT(*) AS cohort_users
  FROM users
  GROUP BY cohort_month
),

active_users AS (
  -- Grain: one row per (cohort_month, week_index) with unique active users
  SELECT
    cohort_month,
    week_index,
    COUNT(DISTINCT user_id) AS active_users
  FROM activity
  GROUP BY cohort_month, week_index
)

SELECT
  au.cohort_month,
  au.week_index,
  cs.cohort_users,
  au.active_users,

  -- Retention % = active users in that week / cohort size
  ROUND(au.active_users * 100.0 / cs.cohort_users, 2) AS retention_pct

FROM active_users au
JOIN cohort_size cs
  ON au.cohort_month = cs.cohort_month

ORDER BY
  au.cohort_month,
  au.week_index;

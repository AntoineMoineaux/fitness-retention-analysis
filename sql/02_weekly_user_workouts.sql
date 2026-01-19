-- 02_weekly_user_workouts.sql
-- Purpose:
-- Compute workouts per user per week (user-week grain).
-- Used as the base table for habit threshold segmentation in Power BI.

-- Output:
-- user_id | year_week | workouts_per_week

-- Used in:
-- Dashboard 2 (Uses & Habits) – distribution of workouts/week
-- Dashboard 3 – early engagement intensity signals

-- Compute workouts per user per week
SELECT
  w.user_id,
  strftime('%Y-%W', w.workout_date) AS year_week,
  COUNT(*) AS workouts_per_week
FROM workouts w
GROUP BY w.user_id, year_week
ORDER BY year_week, w.user_id;

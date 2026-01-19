-- 03_habit_threshold.sql
-- Purpose:
-- Segment user-weeks into habit buckets (0, 1, 2+ workouts).
-- This supports identifying the critical threshold for retention.

-- Output:
-- year_week | habit_bucket | users_in_bucket

-- Used in:
-- Dashboard 2 (Uses & Habits) – users below vs reaching habit threshold

-- Bucket users by habit threshold
WITH weekly_user_workouts AS (
  SELECT
    w.user_id,
    strftime('%Y-%W', w.workout_date) AS year_week,
    COUNT(*) AS workouts_per_week
  FROM workouts w
  GROUP BY w.user_id, year_week
),

bucketed AS (
  SELECT
    year_week,
    CASE
      WHEN workouts_per_week = 1 THEN '1 workout'
      WHEN workouts_per_week >= 2 THEN '2+ workouts'
      ELSE '0 workouts'
    END AS habit_bucket,
    user_id
  FROM weekly_user_workouts
)

SELECT
  year_week,
  habit_bucket,
  COUNT(DISTINCT user_id) AS users_in_bucket
FROM bucketed
GROUP BY year_week, habit_bucket
ORDER BY year_week, habit_bucket;

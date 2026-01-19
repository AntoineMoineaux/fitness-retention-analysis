-- 06_north_star_weekly.sql
-- Purpose:
--   North Star weekly trend: users reaching the habit threshold (>= 2 workouts/week).
--
-- Definition:
--   "Habit threshold" = user completes at least 2 workouts in the same calendar week.
--   North Star (weekly) = count of distinct users with workouts_per_week >= 2.
--
-- Output (grain: 1 row per week):
--   - year_week (YYYY-WW)
--   - users_2plus_workouts (distinct users meeting threshold)
--
-- Used in:
--   Dashboard 1 (Executive Overview)
--
-- Notes:
--   - We compute workouts per (user, week), then count users who meet the threshold.
--   - Joining users is optional here (workouts already carries user_id), but can be kept
--     as a data integrity check (ensures user exists in users table).

WITH weekly_workouts AS (
  -- Grain: one row per (user, week)
  SELECT
    w.user_id,
    strftime('%Y-%W', w.workout_date) AS year_week,
    COUNT(*) AS workouts_per_week
  FROM workouts w
  JOIN users u
    ON u.user_id = w.user_id
  WHERE w.workout_date IS NOT NULL
    AND w.user_id IS NOT NULL
  GROUP BY w.user_id, year_week
)

SELECT
  year_week,
  COUNT(DISTINCT user_id) AS users_2plus_workouts
FROM weekly_workouts
WHERE workouts_per_week >= 2
GROUP BY year_week
ORDER BY year_week;

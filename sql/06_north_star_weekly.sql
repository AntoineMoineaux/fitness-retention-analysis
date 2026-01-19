-- 06_north_star_weekly.sql
-- Purpose: North Star weekly - users reaching the habit threshold (>=2 workouts/week).
-- Output: year_week, users_2plus_workouts
-- Used in: Dashboard 1 (Executive Overview)

WITH weekly_workouts AS (
  SELECT
    w.user_id,
    strftime('%Y-%W', w.workout_date) AS year_week,
    COUNT(*) AS nb_workouts
  FROM workouts w
  JOIN users u
    ON u.user_id = w.user_id
  GROUP BY w.user_id, year_week
)
SELECT
  year_week,
  COUNT(DISTINCT user_id) AS users_2plus_workouts
FROM weekly_workouts
WHERE nb_workouts >= 2
GROUP BY year_week

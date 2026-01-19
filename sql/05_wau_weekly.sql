-- 05_wau_weekly.sql
-- Purpose:
--   Weekly Active Users (WAU) trend.
--
-- Definition:
--   WAU = number of distinct users who completed at least 1 workout during a given week.
--
-- Output (grain: 1 row per week):
--   - year_week (YYYY-WW)
--   - wau (distinct active users)
--
-- Used in:
--   Dashboard 1 (Executive Overview)
--
-- Notes:
--   - We rely on the workouts table as the source of activity.
--   - strftime('%Y-%W') uses week-of-year with Monday as the first day of the week in SQLite.
--     (This is not strictly ISO week in every edge case, but it is consistent for trending.)

SELECT
  strftime('%Y-%W', w.workout_date) AS year_week,
  COUNT(DISTINCT w.user_id)         AS wau
FROM workouts w
WHERE w.workout_date IS NOT NULL
  AND w.user_id IS NOT NULL
GROUP BY year_week
ORDER BY year_week;

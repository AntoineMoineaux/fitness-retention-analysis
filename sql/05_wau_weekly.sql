-- 05_wau_weekly.sql
-- Purpose: Weekly Active Users (WAU) trend.
-- Definition: distinct users with >=1 workout in the week.
-- Output: year_week, wau
-- Used in: Dashboard 1 (Executive Overview)

SELECT
  strftime('%Y-%W', workout_date) AS year_week,
  COUNT(DISTINCT user_id) AS wau
FROM workouts
GROUP BY year_week;

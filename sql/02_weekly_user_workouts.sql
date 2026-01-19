-- 02_weekly_user_workouts.sql
-- Goal: build user-week aggregation (workouts per week)

-- Example logic (adapt to your schema):
-- 1) Create year_week from workout_date
-- 2) Count workouts per user per week

-- SELECT
--   user_id,
--   strftime('%Y-%W', workout_date) AS year_week,
--   COUNT(*) AS workouts_per_week
-- FROM workouts
-- GROUP BY user_id, year_week
-- ORDER BY year_week, user_id;

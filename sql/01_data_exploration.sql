-- 01_data_exploration.sql
-- Purpose:
-- Quick sanity checks on dataset size, coverage and key entities.

-- Used in:
-- Project setup & data validation (not a dashboard visual)

-- Table sizes
SELECT 'users' AS table_name, COUNT(*) AS rows FROM users
UNION ALL
SELECT 'workouts', COUNT(*) FROM workouts
UNION ALL
SELECT 'events', COUNT(*) FROM events
UNION ALL
SELECT 'subscriptions', COUNT(*) FROM subscriptions;

-- Date coverage (workouts)
SELECT
  MIN(workout_date) AS min_workout_date,
  MAX(workout_date) AS max_workout_date
FROM workouts;

-- Users with at least 1 workout
SELECT COUNT(DISTINCT user_id) AS users_with_workout
FROM workouts;

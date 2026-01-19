-- 01_data_exploration.sql
-- Goal: sanity checks + basic exploration of users/workouts

-- 1) Date ranges
-- SELECT MIN(signup_date), MAX(signup_date) FROM users;
-- SELECT MIN(workout_date), MAX(workout_date) FROM workouts;

-- 2) Basic volumes
-- SELECT COUNT(*) AS users FROM users;
-- SELECT COUNT(*) AS workouts FROM workouts;

-- 3) Workouts per user distribution (rough)
-- SELECT user_id, COUNT(*) AS workouts_cnt
-- FROM workouts
-- GROUP BY user_id
-- ORDER BY workouts_cnt DESC;

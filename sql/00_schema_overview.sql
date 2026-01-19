-- Database schema overview
-- Source: SQLite database (fittrack)
-- Purpose: document core tables used for analytics

-- USERS
-- user_id (PK)
-- signup_date
-- country

-- WORKOUTS
-- workout_id (PK)
-- user_id (FK -> users.user_id)
-- workout_date
-- workout_type

-- EVENTS
-- event_id
-- user_id
-- event_type
-- event_date

-- SUBSCRIPTIONS
-- user_id
-- start_date
-- end_date
-- plan_type

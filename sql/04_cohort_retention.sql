-- 04_cohort_retention.sql
-- Purpose:
-- Build weekly retention cohorts based on user signup date
-- Output used for retention heatmap in Power BI

-- Logic:
-- 1. Define cohort as signup month
-- 2. Compute week_index as number of weeks since signup
-- 3. Count active users per cohort / week
-- 4. Divide by cohort size to compute retention %

WITH activity AS (
    SELECT
        u.user_id,
        strftime('%Y-%m', u.signup_date) AS cohort_month,
        CAST(
            (julianday(w.workout_date) - julianday(u.signup_date)) / 7
            AS INTEGER
        ) AS week_index
    FROM users u
    JOIN workouts w
        ON u.user_id = w.user_id
    WHERE (julianday(w.workout_date) - julianday(u.signup_date)) >= 0
),

cohort_size AS (
    SELECT
        strftime('%Y-%m', signup_date) AS cohort_month,
        COUNT(*) AS cohort_users
    FROM users
    GROUP BY cohort_month
),

active_users AS (
    SELECT
        cohort_month,
        week_index,
        COUNT(DISTINCT user_id) AS active_users
    FROM activity
    GROUP BY cohort_month, week_index
)

SELECT
    au.cohort_month,
    au.week_index,
    cs.cohort_users,
    au.active_users,
    ROUND(au.active_users * 100.0 / cs.cohort_users, 2) AS retention_pct
FROM active_users au
JOIN cohort_size cs
    ON au.cohort_month = cs.cohort_month
ORDER BY au.cohort_month, au.week_index;

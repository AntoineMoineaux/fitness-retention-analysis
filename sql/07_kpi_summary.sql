-- 07_kpi_summary.sql
-- Purpose: Executive KPI snapshot (Activation, D7, D30).
-- Activation definition: first workout within 0-2 days after signup.
-- Retention D7 definition: at least one workout between day 7 and day 13 after signup.
-- Retention D30 definition: at least one workout between day 30 and day 36 after signup.
-- Output: activation_rate_pct, retention_j7_pct, retention_j30_pct
-- Used in: Dashboard 1 (Executive Overview)

WITH first_workout AS (
  SELECT
    user_id,
    MIN(workout_date) AS first_training
  FROM workouts
  GROUP BY user_id
),
activation AS (
  SELECT
    ROUND(
      AVG(
        CASE
          WHEN fw.first_training IS NOT NULL
           AND (julianday(fw.first_training) - julianday(u.signup_date)) BETWEEN 0 AND 2
          THEN 1.0 ELSE 0.0
        END
      ) * 100,
      2
    ) AS activation_rate_pct
  FROM users u
  LEFT JOIN first_workout fw
    ON u.user_id = fw.user_id
),
ret_j7 AS (
  SELECT
    ROUND(AVG(retained_j7) * 100, 2) AS retention_j7_pct
  FROM (
    SELECT
      u.user_id,
      MAX(
        CASE
          WHEN w.workout_date IS NOT NULL
           AND (julianday(w.workout_date) - julianday(u.signup_date)) BETWEEN 7 AND 13
          THEN 1 ELSE 0
        END
      ) AS retained_j7
    FROM users u
    LEFT JOIN workouts w
      ON u.user_id = w.user_id
    GROUP BY u.user_id
  )
),
ret_j30 AS (
  SELECT
    ROUND(AVG(retained_j30) * 100, 2) AS retention_j30_pct
  FROM (
    SELECT
      u.user_id,
      MAX(
        CASE
          WHEN w.workout_date IS NOT NULL
           AND (julianday(w.workout_date) - julianday(u.signup_date)) BETWEEN 30 AND 36
          THEN 1 ELSE 0
        END
      ) AS retained_j30
    FROM users u
    LEFT JOIN workouts w
      ON u.user_id = w.user_id
    GROUP BY u.user_id
  )
)
SELECT
  activation.activation_rate_pct,
  ret_j7.retention_j7_pct,
  ret_j30.retention_j30_pct
FROM activation, ret_j7, ret_j30

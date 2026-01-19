-- v_kpi_summary.sql
-- Purpose:
--   Executive KPI snapshot for the fitness app:
--   - Activation rate (first workout within 0–2 days after signup)
--   - D7 retention (>=1 workout between day 7 and day 13 after signup)
--   - D30 retention (>=1 workout between day 30 and day 36 after signup)
--
-- Notes:
--   - Windows are inclusive because SQLite BETWEEN is inclusive.
--   - Retention is measured via workout activity (proxy for engagement).

WITH base AS (
  -- One row per user + all workouts (if any)
  SELECT
    u.user_id,
    u.signup_date,
    w.workout_date
  FROM users u
  LEFT JOIN workouts w
    ON u.user_id = w.user_id
),
user_flags AS (
  -- Collapse to one row per user with activation + retention flags
  SELECT
    user_id,

    -- Activation: first workout within 0-2 days after signup (inclusive)
    CASE
      WHEN MIN(julianday(workout_date) - julianday(signup_date)) BETWEEN 0 AND 2
      THEN 1 ELSE 0
    END AS is_activated,

    -- D7 retention: at least one workout between day 7 and day 13 (inclusive)
    MAX(
      CASE
        WHEN (julianday(workout_date) - julianday(signup_date)) BETWEEN 7 AND 13
        THEN 1 ELSE 0
      END
    ) AS retained_d7,

    -- D30 retention: at least one workout between day 30 and day 36 (inclusive)
    MAX(
      CASE
        WHEN (julianday(workout_date) - julianday(signup_date)) BETWEEN 30 AND 36
        THEN 1 ELSE 0
      END
    ) AS retained_d30

  FROM base
  GROUP BY user_id
)

SELECT
  ROUND(AVG(is_activated) * 100.0, 2) AS activation_rate_pct,
  ROUND(AVG(retained_d7) * 100.0, 2)  AS retention_d7_pct,
  ROUND(AVG(retained_d30) * 100.0, 2) AS retention_d30_pct
FROM user_flags;

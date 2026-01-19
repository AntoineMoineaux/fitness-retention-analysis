# SQL Queries

This folder contains all the SQL queries used to build the core metrics, KPIs, and retention analyses for the project.

The SQL layer is structured to reflect a clear analytical flow:
1. Understand and validate the raw data
2. Build weekly user-level features
3. Segment users by habit intensity
4. Compute retention and executive KPIs

---

## Files

- `00_schema_overview.sql`  
  High-level documentation of the database schema and key tables.

- `01_data_exploration.sql`  
  Initial sanity checks: table sizes, date coverage, and basic data validation.

- `02_weekly_user_workouts.sql`  
  Base user-week table computing the number of workouts per user per week.

- `03_habit_threshold.sql`  
  Segments user-weeks into habit buckets (0, 1, 2+ workouts per week).

- `04_cohort_retention.sql`  
  Weekly cohort retention analysis based on signup month and weeks since signup.

- `05_wau_weekly.sql`  
  Weekly Active Users (WAU): number of distinct users with at least one workout per week.

- `06_north_star_weekly.sql`  
  North Star metric: number of users reaching the habit threshold (2+ workouts) per week.

- `07_kpi_summary.sql`  
  Executive KPI snapshot including activation rate, D7 retention, and D30 retention.

---

## Query map (how SQL connects to the dashboards)

| File | Purpose | Used in |
|------|--------|---------|
| `00_schema_overview.sql` | Document database structure and relationships | Documentation |
| `01_data_exploration.sql` | Sanity checks: volumes, date coverage | Setup |
| `02_weekly_user_workouts.sql` | User-week grain table: workouts per week | Dashboard 2, Dashboard 3 |
| `03_habit_threshold.sql` | Habit segmentation (0 / 1 / 2+ workouts) | Dashboard 2 |
| `04_cohort_retention.sql` | Cohort retention by signup month and week index | Dashboard 3 |
| `05_wau_weekly.sql` | Weekly Active Users (WAU) trend | Dashboard 1 |
| `06_north_star_weekly.sql` | North Star metric (users with 2+ workouts/week) | Dashboard 1 |
| `07_kpi_summary.sql` | Activation, D7 retention, D30 retention KPIs | Dashboard 1 |

---

## KPI definitions (SQL logic)

- **Activation rate**  
  Percentage of users who complete their first workout within **0–2 days after signup**.

- **Retention D7**  
  Percentage of users with **at least one workout between day 7 and day 13** after signup.

- **Retention D30**  
  Percentage of users with **at least one workout between day 30 and day 36** after signup.

- **Habit threshold**  
  A user is considered to have formed a habit when completing **2 or more workouts in a given week**.

---

## Notes

- Weekly aggregation is based on `strftime('%Y-%W', date)` (ISO-like week numbering).
- Retention is computed using workout activity as a proxy for user engagement.
- All queries are designed to be readable, modular, and directly reusable in Power BI.

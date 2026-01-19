# Power BI Model

## Data sources
- SQLite database (queries executed in SQLiteStudio)
- SQL outputs imported into Power BI

## Model structure
- Fact table: workouts / weekly_user_workouts
- Dimensions: users, calendar (implicit via year_week)

## Key visuals
- Line charts: WAU and North Star trends
- Bar charts: habit distribution
- Heatmap: cohort retention (cohort_month × week_index)

## Measures
- Activation rate
- Retention D7 / D30
- % users reaching habit threshold

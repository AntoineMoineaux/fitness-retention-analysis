![Status](https://img.shields.io/badge/status-completed-brightgreen)

# Fitness Habit Formation & Retention Analytics

**How early user behavior predicts long-term retention**

*Project completed as part of my transition to Product Data Analyst*

---

## 🎯 Context

**Realistic simulation:** A fitness application is experiencing growth in signups but struggles to convert new users into long-term active users.

**My mission:** Identify the primary retention lever and propose concrete product actions based on data.

**Result:** 3 Power BI dashboards presenting a complete analysis of the user journey, from activation to habit formation.

---

## 📊 Key Metrics That Guided the Analysis

| Metric | Value | Interpretation |
| --- | --- | --- |
| **Activation Rate** | 55.33% | More than half of signups complete their 1st workout |
| **Retention D7** | 50.02% | Half abandon within the first week |
| **Retention D30** | 43.42% | Stabilization after the first month |
| **Users ≥2 workouts/week** | 63.28% | Only 2 out of 3 users form a habit |
| **Habit formation (14 days)** | **3.80%** | ⚠️ **Critical point**: very few convert quickly |
| **Early drop-off (W0→W1)** | 49.92% | Half leave before forming a habit |

---

## 💡 Core Insight

> Retention is not won over months, but within the first 14 days.
> 

After analysis, it appears that:

1. **Users reaching ≥2 workouts/week show stable retention rates**
2. **Those stuck at 1 workout/week abandon massively**
3. **The major drop-off occurs between W0 and W1** (50% loss)
4. **Only 3.80% of users form the habit within the first 14 days**

→ Retention is not a long-term engagement problem, but **an early conversion problem**.

---

## 📈 The 3 Analysis Dashboards

### **Dashboard 1: Executive Overview**

*"Growth is driven by early habit formation"*

**What we see:**

- Evolution of users reaching the ≥2 workouts/week threshold (North Star)
- Direct correlation between this number and Weekly Active Users (WAU) growth
- Activation rate, D7 and D30 retention as main KPIs

**The insight:** WAU growth follows users who formed a habit. Increasing users reaching ≥2 workouts = sustainably increasing WAU.

---

### **Dashboard 2: Uses & Habits**

*"Reaching 2 workouts/week is the critical habit threshold"*

**What we see:**

- Distribution of users by weekly workout count
- 63.28% reach the ≥2 workouts/week threshold (distributed across 2, 3, 4, 5, 6 workouts)
- 36.72% remain stuck at 1 workout/week → risk zone

**The insight:** There's no "gray zone". Users either cross the 2-workout threshold and stay, or remain at 1 and leave. Retention is **binary**.

**The product decision:**

> Optimize the user journey to reach 2 workouts/week as quickly as possible.
> 

**Suggested actions:**

- Trigger reminders after the 1st workout
- Create onboarding that pushes toward the 2nd workout in week 1
- Reduce friction (quick workout templates, personalized recommendations)

**Estimated impact:** +5pp of users reaching ≥2 workouts/week = significant impact on long-term retention.

---

### **Dashboard 3: Retention & First 14 Days**

*"Retention is driven by habit formation in the first 14 days"*

**What we see:**

- Median time to 1st workout: **2 days** → The product succeeds in triggering the first action
- But only **3.80%** of users reach ≥2 workouts within the first 14 days
- Retention W1: **50.08%** → loss of half the users in the 1st week
- Retention heatmap by cohort (Jan-April) showing stabilization from W2

**The major insight:**

> Retention stabilizes not because users improve, but because non-adopters have already churned.
> 

**Product focus:**
Maximize the number of users reaching **≥2 workouts within the first 14 days**.

**How to measure success:**

- North Star: % of users with ≥2 workouts/week
- Retention W4 (proxy for long-term retention)
- Drop-off W0 → W1 (leading indicator)

---

## 🔍 My Analytical Approach

**1. North Star Metric Definition**

- Why "≥2 workouts/week"? → Correlated with retention, actionable by product, measurable quickly

**2. User Funnel Analysis**

- Activation → First use → Habit formation → Long-term retention
- Identification of friction point: transition from 1 to 2 workouts/week

**3. Cohort Analysis**

- Observation of Jan-April cohorts (sizes: 19K, 17K, 17K, 13K users)
- Identical retention pattern: massive W0→W1 drop, then stabilization

**4. Insights → Decisions → Actions**

- Each dashboard ends with a concrete product recommendation
- Estimated expected impact (e.g., +5pp on habit formation rate)

---

## 🛠️ Technical Stack

- **SQL**: Data extraction and preparation, cohort calculations, KPI definition
- **Power BI**: Data modeling, DAX measures, creation of 3 narrative dashboards
- **Product approach**: North Star metric definition, funnel analysis, action prioritization

---

## 💼 What This Project Demonstrates

**Technical skills:**

- Mastery of SQL for retention and cohort analysis
- Mastery of Power BI to create decision-oriented dashboards
- Ability to translate raw data into actionable KPIs

**Product approach:**

- Identifying the **right question** to ask the data (not "why do we lose users?" but "when and why?")
- Defining a relevant and justified North Star metric
- Translating insights into **concrete product decisions** with estimated impact

**Communication:**

- Structuring a narrative in 3 acts (diagnosis → insight → recommendation)
- Adapting the message to the audience (Executive summary vs Deep dive)
- Prioritizing information (what matters vs what's interesting)

---

## 🧠 Conclusion

This project shows that retention is not a loyalty problem, but a **timing** problem.

👉 The product wins or loses its users **before they even have time to engage**.

Forming a habit early is not a bonus. **It's the condition for growth.**

---

## 📬 Contact

**Antoine Moineaux**

Transitioning to Product-focused Data Analyst

Background: Project Manager → Product Data Analyst

*This project was designed to demonstrate my ability to transform data into actionable product decisions. Feel free to challenge me on it in an interview.*

---

## 🎨 Dashboard Preview

### Dashboard 1 — Executive Overview
![Dashboard 1](assets/projet_2_dashboard1.png)

### Dashboard 2 — Uses & Habits
![Dashboard 2](assets/projet_2_dashboard2.png)

### Dashboard 3 — Retention & First 14 Days
![Dashboard 3](assets/projet_2_dashboard3.png)

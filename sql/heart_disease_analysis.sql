-- Heart Disease Risk Analysis
-- Dataset: UCI Heart Disease
-- Table: heart_disease


-- 1. Overall dataset summary

SELECT
    COUNT(*) AS total_patients,
    SUM(heart_disease) AS patients_with_heart_disease,
    COUNT(*) - SUM(heart_disease) AS patients_without_heart_disease,
    ROUND(
        100.0 * SUM(heart_disease) / COUNT(*),
        1
    ) AS heart_disease_rate_pct
FROM heart_disease;


-- 2. Heart disease rate by sex

SELECT
    CASE
        WHEN sex = 0 THEN 'Female'
        WHEN sex = 1 THEN 'Male'
    END AS sex,
    COUNT(*) AS patients,
    SUM(heart_disease) AS patients_with_heart_disease,
    ROUND(
        100.0 * SUM(heart_disease) / COUNT(*),
        1
    ) AS heart_disease_rate_pct
FROM heart_disease
GROUP BY sex
ORDER BY heart_disease_rate_pct DESC;


-- 3. Heart disease rate by age group

WITH age_groups AS (
    SELECT
        CASE
            WHEN age < 45 THEN 'Under 45'
            WHEN age BETWEEN 45 AND 54 THEN '45–54'
            WHEN age BETWEEN 55 AND 64 THEN '55–64'
            ELSE '65 and older'
        END AS age_group,
        heart_disease
    FROM heart_disease
)

SELECT
    age_group,
    COUNT(*) AS patients,
    SUM(heart_disease) AS patients_with_heart_disease,
    ROUND(
        100.0 * SUM(heart_disease) / COUNT(*),
        1
    ) AS heart_disease_rate_pct
FROM age_groups
GROUP BY age_group
ORDER BY heart_disease_rate_pct DESC;


-- 4. Heart disease rate by chest pain type

SELECT
    chest_pain_type,
    COUNT(*) AS patients,
    SUM(heart_disease) AS patients_with_heart_disease,
    ROUND(
        100.0 * SUM(heart_disease) / COUNT(*),
        1
    ) AS heart_disease_rate_pct
FROM heart_disease
GROUP BY chest_pain_type
ORDER BY heart_disease_rate_pct DESC;


-- 5. Average clinical measurements by diagnosis

SELECT
    CASE
        WHEN heart_disease = 0 THEN 'No heart disease'
        ELSE 'Heart disease'
    END AS diagnosis,
    COUNT(*) AS patients,
    ROUND(AVG(age), 1) AS average_age,
    ROUND(AVG(resting_blood_pressure), 1)
        AS average_resting_blood_pressure,
    ROUND(AVG(cholesterol), 1)
        AS average_cholesterol,
    ROUND(AVG(max_heart_rate), 1)
        AS average_max_heart_rate,
    ROUND(AVG(st_depression), 2)
        AS average_st_depression
FROM heart_disease
GROUP BY heart_disease;


-- 6. Original disease severity distribution

SELECT
    disease_severity,
    COUNT(*) AS patients,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM heart_disease),
        1
    ) AS share_pct
FROM heart_disease
GROUP BY disease_severity
ORDER BY disease_severity;
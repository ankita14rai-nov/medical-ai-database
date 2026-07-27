-- ===========================================
-- BASIC SELECT QUERIES
-- ===========================================


SELECT * FROM users;

SELECT * FROM specialists;

SELECT * FROM consultations;

SELECT * FROM predictions;

SELECT * FROM ai_responses;

SELECT * FROM reports;



-- ===========================================
-- WHERE CLAUSE
-- ===========================================

SELECT *
FROM users
WHERE full_name='Rahul Sharma';


SELECT *
FROM consultations
WHERE emergency_flag=TRUE;


SELECT *
FROM users
WHERE gender='Female';


--Order by

--Newest consultations first.
SELECT *
FROM consultations
ORDER BY consultation_date DESC;



--Oldest first.
SELECT *
FROM consultations
ORDER BY consultation_date ASC;


-- ===========================================
-- UPDATE
-- ===========================================

UPDATE users
SET age=22
WHERE user_id=1;



-- ===========================================
-- DELETE
-- ===========================================

DELETE
FROM reports
WHERE report_id=3;




-- ===========================================
-- INNER JOIN
-- ===========================================

SELECT
u.user_id,
u.full_name,
c.consultation_id,
c.symptoms_text

FROM users u

INNER JOIN consultations c

ON u.user_id=c.user_id;



SELECT

c.consultation_id,

c.symptoms_text,

p.disease_name,

p.confidence

FROM consultations c

INNER JOIN predictions p

ON c.consultation_id=p.consultation_id;




-- ===========================================
-- COMPLETE CONSULTATION DETAILS
-- ===========================================


SELECT
    u.full_name,
    u.age,
    u.gender,

    c.consultation_id,
    c.symptoms_text,
    c.consultation_date,
    c.emergency_flag,

    p.disease_name,
    p.confidence,

    s.specialist_name,

    a.severity,
    a.care_tips,
    a.ai_summary

FROM users u

INNER JOIN consultations c
ON u.user_id = c.user_id

INNER JOIN predictions p
ON c.consultation_id = p.consultation_id

INNER JOIN ai_responses a
ON c.consultation_id = a.consultation_id

LEFT JOIN specialists s
ON a.specialist_id = s.specialist_id

ORDER BY
c.consultation_id,
p.confidence DESC; 



-- ===========================================
-- AGGREGATE FUNCTIONS
-- ===========================================

--Total users
SELECT COUNT(*) AS total_users
FROM users;



--Total Consultations
SELECT COUNT(*) AS total_consultations
FROM consultations;



-- Emergency Cases
SELECT COUNT(*) AS emergency_cases
FROM consultations
WHERE emergency_flag = TRUE;


--Average Confidence
SELECT AVG(confidence) AS average_confidence
FROM predictions;



-- Highest Confidence
SELECT MAX(confidence) AS highest_confidence
FROM predictions;


-- Lowest Confidence
SELECT MIN(confidence) AS lowest_confidence
FROM predictions;


-- Total Specialists
SELECT COUNT(*) AS total_specialists
FROM specialists;





-- ===========================================
-- GROUP BY
-- ===========================================

SELECT
disease_name,

COUNT(*) AS prediction_count

FROM predictions

GROUP BY disease_name;




SELECT

s.specialist_name,

COUNT(*) AS total_cases

FROM specialists s

INNER JOIN ai_responses a

ON s.specialist_id = a.specialist_id

GROUP BY s.specialist_name;



SELECT

disease_name,

COUNT(*) AS total_predictions

FROM predictions

GROUP BY disease_name

HAVING COUNT(*) >= 1;



-- ===========================================
-- BACKEND READY QUERIES
-- ===========================================

SELECT

u.full_name,

c.consultation_id,

c.symptoms_text,

c.consultation_date,

c.emergency_flag

FROM users u

INNER JOIN consultations c

ON u.user_id = c.user_id

WHERE u.user_id = 2;





SELECT

c.*

FROM consultations c

WHERE c.user_id = 2

ORDER BY consultation_date DESC

LIMIT 1;




SELECT

disease_name,

confidence

FROM predictions

WHERE consultation_id = 1

ORDER BY confidence DESC

LIMIT 3;




SELECT

u.full_name,

p.disease_name,

s.specialist_name

FROM users u

INNER JOIN consultations c

ON u.user_id = c.user_id

INNER JOIN predictions p

ON c.consultation_id = p.consultation_id

INNER JOIN ai_responses a

ON c.consultation_id = a.consultation_id

INNER JOIN specialists s

ON a.specialist_id = s.specialist_id

WHERE u.user_id = 2

ORDER BY p.confidence DESC

LIMIT 1;
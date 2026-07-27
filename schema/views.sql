-- ===========================================
-- CONSULTATION SUMMARY VIEW
-- ===========================================

CREATE VIEW consultation_summary AS

SELECT

u.user_id,

u.full_name,

u.email,

u.age,

u.gender,

c.consultation_id,

c.symptoms_text,

c.consultation_date,

c.emergency_flag,

p.disease_name,

p.confidence,

a.severity,

a.care_tips,

a.ai_summary,

s.specialist_name

FROM users u

INNER JOIN consultations c
ON u.user_id = c.user_id

INNER JOIN predictions p
ON c.consultation_id = p.consultation_id

INNER JOIN ai_responses a
ON c.consultation_id = a.consultation_id

LEFT JOIN specialists s
ON a.specialist_id = s.specialist_id;



-- ===========================================
-- GET DISEASE DESCRIPTION
-- ===========================================

SELECT

disease_name,

description

FROM disease_descriptions

WHERE disease_name = $1;




-- ===========================================
-- GET DISEASE PRECAUTIONS
-- ===========================================

SELECT

precaution_1,

precaution_2,

precaution_3,

precaution_4

FROM disease_precautions

WHERE disease_name = $1;




-- ===========================================
-- GET SYMPTOM WEIGHT
-- ===========================================

SELECT

weight

FROM symptom_severity

WHERE symptom = $1;
-- ===========================================
-- SAVE NEW CONSULTATION
-- ===========================================

INSERT INTO consultations
(
    user_id,
    symptoms_text,
    consultation_date,
    emergency_flag
)

VALUES
(
    $1,
    $2,
    CURRENT_TIMESTAMP,
    $3
)

RETURNING consultation_id;



-- ===========================================
-- SAVE ML PREDICTION
-- ===========================================

INSERT INTO predictions
(
    consultation_id,
    disease_name,
    confidence
)

VALUES
(
    $1,
    $2,
    $3
)

RETURNING prediction_id;


-- ===========================================
-- SAVE AI RESPONSE
-- ===========================================

INSERT INTO ai_responses
(
    consultation_id,
    ai_summary,
    severity,
    care_tips,
    specialist_id
)

VALUES
(
    $1,
    $2,
    $3,
    $4,
    $5
)

RETURNING response_id;



-- ===========================================
-- GET USER CONSULTATION HISTORY
-- ===========================================

SELECT

c.consultation_id,

c.consultation_date,

c.symptoms_text,

p.disease_name,

p.confidence,

a.severity,

s.specialist_name

FROM consultations c

INNER JOIN predictions p
ON c.consultation_id = p.consultation_id

INNER JOIN ai_responses a
ON c.consultation_id = a.consultation_id

LEFT JOIN specialists s
ON a.specialist_id = s.specialist_id

WHERE c.user_id = $1

ORDER BY c.consultation_date DESC;




-- ===========================================
-- GET COMPLETE CONSULTATION REPORT
-- ===========================================

SELECT

u.full_name,

u.email,

u.age,

u.gender,

c.consultation_date,

c.symptoms_text,

p.disease_name,

p.confidence,

a.severity,

a.ai_summary,

a.care_tips,

s.specialist_name,

d.description,

dp.precaution_1,

dp.precaution_2,

dp.precaution_3,

dp.precaution_4

FROM users u

INNER JOIN consultations c
ON u.user_id = c.user_id

INNER JOIN predictions p
ON c.consultation_id = p.consultation_id

INNER JOIN ai_responses a
ON c.consultation_id = a.consultation_id

LEFT JOIN specialists s
ON a.specialist_id = s.specialist_id

LEFT JOIN disease_descriptions d
ON p.disease_name = d.disease_name

LEFT JOIN disease_precautions dp
ON p.disease_name = dp.disease_name

WHERE c.consultation_id = $1;
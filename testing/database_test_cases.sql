-- ===========================================
-- TEST 1 : USERS TABLE
-- ===========================================

SELECT *
FROM users;


-- ===========================================
-- TEST CONSULTATIONS TABLE
-- ===========================================

SELECT * FROM consultations;


-- ===========================================
-- TEST PREDICTIONS TABLE
-- ===========================================

SELECT * FROM predictions;


-- ===========================================
-- TEST AI Responses TABLE
-- ===========================================

SELECT *
FROM ai_responses;

-- ===========================================
-- TEST Specialists TABLE
-- ===========================================

SELECT *
FROM specialists;

-- ===========================================
-- TEST Reports TABLE
-- ===========================================

SELECT *
FROM reports;

-- ===========================================
-- TEST Disease Descriptions 
-- ===========================================


SELECT COUNT(*)
FROM disease_descriptions;

-- ===========================================
-- TEST Disease Precautions 
-- ===========================================


SELECT COUNT(*)
FROM disease_precautions;

-- ===========================================
-- TEST Symptom Severity 
-- ===========================================

SELECT COUNT(*)
FROM symptom_severity;

-- ===========================================
-- TEST View TABLE
-- ===========================================

SELECT *
FROM consultation_summary;
-- ===========================================
-- MASTER TABLE : Disease Descriptions
-- ===========================================

CREATE TABLE disease_descriptions (

    disease_name VARCHAR(100) PRIMARY KEY,

    description TEXT NOT NULL

);



-- ===========================================
-- MASTER TABLE : Disease Precautions
-- ===========================================

CREATE TABLE disease_precautions (

    disease_name VARCHAR(100) PRIMARY KEY,

    precaution_1 TEXT,

    precaution_2 TEXT,

    precaution_3 TEXT,

    precaution_4 TEXT

);






-- ===========================================
-- MASTER TABLE : Symptom Severity
-- ===========================================

CREATE TABLE symptom_severity (

    symptom VARCHAR(100) PRIMARY KEY,

    weight INTEGER NOT NULL

);
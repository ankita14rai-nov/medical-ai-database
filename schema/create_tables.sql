CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    age INT CHECK (age > 0),
    gender VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




CREATE TABLE specialists (
    specialist_id SERIAL PRIMARY KEY,

    specialist_name VARCHAR(100) NOT NULL,

    department VARCHAR(100) NOT NULL
);




CREATE TABLE consultations (

    consultation_id SERIAL PRIMARY KEY,

    user_id INT NOT NULL,

    symptoms_text TEXT NOT NULL,

    consultation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    emergency_flag BOOLEAN DEFAULT FALSE,

    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE

);






CREATE TABLE predictions (

    prediction_id SERIAL PRIMARY KEY,

    consultation_id INT NOT NULL,

    disease_name VARCHAR(150) NOT NULL,

    confidence DECIMAL(5,2) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES consultations(consultation_id)
        ON DELETE CASCADE

);






CREATE TABLE ai_responses (

    response_id SERIAL PRIMARY KEY,

    consultation_id INT NOT NULL,

    specialist_id INT,

    severity VARCHAR(30),

    care_tips TEXT,

    ai_summary TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_ai_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES consultations(consultation_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_ai_specialist
        FOREIGN KEY (specialist_id)
        REFERENCES specialists(specialist_id)
);







CREATE TABLE reports (

    report_id SERIAL PRIMARY KEY,

    consultation_id INT NOT NULL,

    pdf_file_name VARCHAR(255) NOT NULL,

    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_report_consultation
        FOREIGN KEY (consultation_id)
        REFERENCES consultations(consultation_id)
        ON DELETE CASCADE
);
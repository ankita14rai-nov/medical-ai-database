CREATE INDEX idx_users_email
ON users(email);



CREATE INDEX idx_consultation_user
ON consultations(user_id);


CREATE INDEX idx_prediction_consultation
ON predictions(consultation_id);



CREATE INDEX idx_airesponse_consultation
ON ai_responses(consultation_id);
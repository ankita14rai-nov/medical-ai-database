INSERT INTO specialists (specialist_name, department)
VALUES
('Neurologist', 'Neurology'),
('Cardiologist', 'Cardiology'),
('Dermatologist', 'Dermatology'),
('General Physician', 'General Medicine'),
('Pulmonologist', 'Pulmonology'),
('Gastroenterologist', 'Gastroenterology');





INSERT INTO users
(full_name, email, password_hash, age, gender)
VALUES

('Ankita Kumari',
'ankita@gmail.com',
'hashed_password_123',
21,
'Female'),

('Rahul Sharma',
'rahul@gmail.com',
'hashed_password_456',
23,
'Male'),

('Priya Singh',
'priya@gmail.com',
'hashed_password_789',
20,
'Female');





INSERT INTO consultations
(user_id,
symptoms_text,
emergency_flag)

VALUES

(
1,
'I have severe headache and nausea.',
FALSE
),

(
2,
'I have chest pain and breathing difficulty.',
TRUE
),

(
3,
'My skin has red itchy rashes.',
FALSE
);





INSERT INTO predictions
(
consultation_id,
disease_name,
confidence
)

VALUES

(1,'Migraine',82.50),

(1,'Tension Headache',12.30),

(1,'Sinusitis',5.20),

(2,'Heart Attack',91.50),

(2,'Angina',6.20),

(2,'Acid Reflux',2.30),

(3,'Eczema',70.50),

(3,'Psoriasis',20.10),

(3,'Allergic Reaction',9.40);






INSERT INTO ai_responses
(
consultation_id,
specialist_id,
severity,
care_tips,
ai_summary
)

VALUES

(
1,
1,
'Moderate',
'Drink water, take proper rest, avoid bright light.',
'Based on your symptoms, Migraine is the most likely condition.'
),

(
2,
2,
'Critical',
'Seek emergency medical care immediately.',
'Chest pain with breathing difficulty requires urgent medical attention.'
),

(
3,
3,
'Low',
'Avoid allergens and keep the affected area clean.',
'The symptoms are most consistent with a skin allergy or eczema.'
);





INSERT INTO reports
(
consultation_id,
pdf_file_name
)

VALUES

(1,'consultation_1.pdf'),

(2,'consultation_2.pdf'),

(3,'consultation_3.pdf');




# Database Dictionary

This document explains all tables used in the AI Medical Diagnosis System.

---

# 1. users

Purpose:
Stores registered user information.

| Column | Data Type | Description |
|---------|-----------|-------------|
| user_id | SERIAL | Primary Key |
| full_name | VARCHAR | User's full name |
| email | VARCHAR | User email |
| password_hash | VARCHAR | Encrypted password |
| age | INTEGER | User age |
| gender | VARCHAR | Gender |
| created_at | TIMESTAMP | Registration date |
| last_activity | TIMESTAMP | Last consultation time |

---

# 2. consultations

Purpose:
Stores every consultation submitted by users.

| Column | Data Type | Description |
|---------|-----------|-------------|
| consultation_id | SERIAL | Primary Key |
| user_id | INTEGER | Foreign Key → users |
| symptoms_text | TEXT | Symptoms entered by user |
| consultation_date | TIMESTAMP | Consultation date |
| emergency_flag | BOOLEAN | Emergency case |

---

# 3. predictions

Purpose:
Stores ML prediction results.

| Column | Data Type | Description |
|---------|-----------|-------------|
| prediction_id | SERIAL | Primary Key |
| consultation_id | INTEGER | Foreign Key |
| disease_name | VARCHAR | Predicted disease |
| confidence | DECIMAL | Prediction confidence |

---

# 4. ai_responses

Purpose:
Stores AI-generated medical responses.

| Column | Data Type | Description |
|---------|-----------|-------------|
| response_id | SERIAL | Primary Key |
| consultation_id | INTEGER | Foreign Key |
| severity | VARCHAR | Disease severity |
| care_tips | TEXT | Suggested care |
| ai_summary | TEXT | AI explanation |
| specialist_id | INTEGER | Recommended specialist |

---

# 5. specialists

Purpose:
Stores specialist information.

| Column | Data Type | Description |
|---------|-----------|-------------|
| specialist_id | SERIAL | Primary Key |
| specialist_name | VARCHAR | Doctor/Specialist |
| specialization | VARCHAR | Medical specialization |

---

# 6. reports

Purpose:
Stores generated PDF report information.

| Column | Data Type | Description |
|---------|-----------|-------------|
| report_id | SERIAL | Primary Key |
| consultation_id | INTEGER | Foreign Key |
| pdf_file_name | VARCHAR | Generated PDF |
| generated_at | TIMESTAMP | Report creation time |

---

# 7. disease_descriptions

Purpose:
Master table containing disease descriptions.

| Column | Data Type | Description |
|---------|-----------|-------------|
| disease_name | VARCHAR | Primary Key |
| description | TEXT | Disease description |

---

# 8. disease_precautions

Purpose:
Master table containing disease precautions.

| Column | Data Type | Description |
|---------|-----------|-------------|
| disease_name | VARCHAR | Primary Key |
| precaution_1 | TEXT | First precaution |
| precaution_2 | TEXT | Second precaution |
| precaution_3 | TEXT | Third precaution |
| precaution_4 | TEXT | Fourth precaution |

---

# 9. symptom_severity

Purpose:
Stores symptom severity weights.

| Column | Data Type | Description |
|---------|-----------|-------------|
| symptom | VARCHAR | Primary Key |
| weight | INTEGER | Severity weight |
# Medical AI Project Architecture

## Team Modules

### Frontend
- User Registration
- Login
- Symptom Input
- Display AI Prediction
- Display Specialist Recommendation
- Download Report

---

### Backend
- Receives API requests
- Authenticates users
- Communicates with ML Model
- Stores data in PostgreSQL
- Returns responses to Frontend

---

### Machine Learning
- Receives symptoms
- Predicts disease
- Calculates confidence score
- Sends prediction to Backend

---

### Database (PostgreSQL)
Stores:

- Users
- Consultations
- Predictions
- AI Responses
- Specialists
- Reports
- Disease Master Data

---

## Overall Flow

Frontend

↓

Backend

↓

PostgreSQL (Save Consultation)

↓

Machine Learning Model

↓

Disease Prediction

↓

Backend

↓

PostgreSQL (Save Prediction)

↓

Generate AI Response

↓

Save AI Response

↓

Generate PDF Report

↓

Frontend
# Database Helper Functions

## 1. Save User

```javascript
saveUser(full_name, email, password_hash, age, gender)
```

Creates a new user and returns the inserted record.

---

## 2. Get User by Email

```javascript
getUserByEmail(email)
```

Returns the user details using email.

---

## 3. Save Consultation

```javascript
saveConsultation(user_id, symptoms_text, emergency_flag)
```

Creates a new consultation.

---

## 4. Save Prediction

```javascript
savePrediction(consultation_id, disease_name, confidence)
```

Stores the AI prediction.

---

## 5. Save AI Response

```javascript
saveAIResponse(
    consultation_id,
    specialist_id,
    severity,
    care_tips,
    ai_summary
)
```

Stores the AI-generated response.

---

## 6. Save Report

```javascript
saveReport(
    consultation_id,
    pdf_file_name
)
```

Stores the generated PDF report.

---

## 7. Get Disease Description

```javascript
getDiseaseDescription(disease_name)
```

Returns the disease description.

---

## 8. Get Disease Precautions

```javascript
getDiseasePrecautions(disease_name)
```

Returns the precautions.

---

## 9. Get Symptom Severity

```javascript
getSymptomSeverity(symptom)
```

Returns the symptom weight.
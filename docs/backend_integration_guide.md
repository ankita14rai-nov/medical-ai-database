# Backend Integration Guide

## 1. User Registration

Frontend sends:

- Full Name
- Email
- Password
- Age
- Gender

Backend receives this information.

Backend stores the data in the **users** table.

Table Used:

users


## 2. User Login

Frontend sends:

- Email
- Password

Backend checks the **users** table.

If credentials are correct,

the user is logged in.


## 3. Consultation

Frontend sends symptoms.

Backend stores them in the

consultations table.



## 4. Prediction

Backend sends symptoms to the ML model.

The ML model returns

- Disease

- Confidence

Backend stores the result in the

predictions table.



## 5. AI Response

Backend stores

- Severity

- Care Tips

- Summary

inside

ai_responses.
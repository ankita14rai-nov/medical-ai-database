const pool = require("../database/database");

// ===========================================
// SAVE USER
// ===========================================

const saveUser = async (
    full_name,
    email,
    password_hash,
    age,
    gender
) => {

    try {

        const query = `
            INSERT INTO users
            (
                full_name,
                email,
                password_hash,
                age,
                gender
            )

            VALUES
            (
                $1,
                $2,
                $3,
                $4,
                $5
            )

            RETURNING *;
        `;

        const values = [
            full_name,
            email,
            password_hash,
            age,
            gender
        ];

        const result = await pool.query(query, values);

        return result.rows[0];

    } catch (error) {

        console.error("Error Saving User:", error);

        throw error;

    }

};



// ===========================================
// GET USER BY EMAIL
// ===========================================

const getUserByEmail = async (email) => {

    try {

        const query = `
            SELECT *
            FROM users
            WHERE email = $1;
        `;

        const result = await pool.query(query, [email]);

        return result.rows[0];

    } catch (error) {

        console.error("Error Fetching User:", error);

        throw error;

    }

};

// ===========================================
// SAVE CONSULTATION
// ===========================================

const saveConsultation = async (
    user_id,
    symptoms_text,
    emergency_flag
) => {

    try {

        const query = `
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

            RETURNING *;
        `;

        const values = [
            user_id,
            symptoms_text,
            emergency_flag
        ];

        const result = await pool.query(query, values);

        return result.rows[0];

    } catch (error) {

        console.error("Error Saving Consultation:", error);

        throw error;

    }

};


// ===========================================
// SAVE AI PREDICTION
// ===========================================

const savePrediction = async (
    consultation_id,
    disease_name,
    confidence
) => {

    try {

        const query = `
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

            RETURNING *;
        `;

        const result = await pool.query(query, [
            consultation_id,
            disease_name,
            confidence
        ]);

        return result.rows[0];

    } catch (error) {

        console.error("Error Saving Prediction:", error);

        throw error;

    }

};

// ===========================================
// SAVE AI RESPONSE
// ===========================================

const saveAIResponse = async (
    consultation_id,
    specialist_id,
    severity,
    care_tips,
    ai_summary
) => {

    try {

        const query = `
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
                $1,
                $2,
                $3,
                $4,
                $5
            )

            RETURNING *;
        `;


        const result = await pool.query(query,[
            consultation_id,
            specialist_id,
            severity,
            care_tips,
            ai_summary
        ]);


        return result.rows[0];


    } catch(error){

        console.error(error);

        throw error;

    }

};

// ===========================================
// SAVE REPORT
// ===========================================

const saveReport = async (
    consultation_id,
    pdf_file_name
) => {

    try {

        const query = `
            INSERT INTO reports
            (
                consultation_id,
                pdf_file_name
            )

            VALUES
            (
                $1,
                $2
            )

            RETURNING *;
        `;

        const result = await pool.query(query, [
            consultation_id,
            pdf_file_name
        ]);

        return result.rows[0];

    } catch (error) {

        console.error(error);

        throw error;

    }

};


const getDiseaseDescription = async (disease_name) => {

    try {

        const query = `
            SELECT description
            FROM disease_descriptions
            WHERE disease_name = $1;
        `;

        const result = await pool.query(query, [disease_name]);

        return result.rows[0];

    } catch (error) {

        console.error(error);

        throw error;

    }

};

const getDiseasePrecautions = async (disease_name) => {

    try {

        const query = `
            SELECT
                precaution_1,
                precaution_2,
                precaution_3,
                precaution_4

            FROM disease_precautions

            WHERE disease_name = $1;
        `;

        const result = await pool.query(query, [disease_name]);

        return result.rows[0];

    } catch (error) {

        console.error(error);

        throw error;

    }

};


const getSymptomSeverity = async (symptom) => {

    try {

        const query = `
            SELECT weight
            FROM symptom_severity
            WHERE symptom = $1;
        `;

        const result = await pool.query(query, [symptom]);

        return result.rows[0];

    } catch (error) {

        console.error(error);

        throw error;

    }

};

module.exports = {

    saveUser,
    getUserByEmail,
    saveConsultation,
    savePrediction,
    saveAIResponse,
    saveReport,
    getDiseaseDescription,
    getDiseasePrecautions,
    getSymptomSeverity

};
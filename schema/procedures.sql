-- ===========================================
-- PROCEDURE : SAVE CONSULTATION
-- ===========================================

CREATE OR REPLACE PROCEDURE save_consultation(

    IN p_user_id INTEGER,

    IN p_symptoms TEXT,

    IN p_emergency BOOLEAN

)

LANGUAGE plpgsql

AS $$

BEGIN

    INSERT INTO consultations(

        user_id,

        symptoms_text,

        consultation_date,

        emergency_flag

    )

    VALUES(

        p_user_id,

        p_symptoms,

        CURRENT_TIMESTAMP,

        p_emergency

    );

END;

$$;
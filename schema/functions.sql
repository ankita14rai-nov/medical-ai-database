-- ===========================================
-- FUNCTION 1
-- Total Consultations of a User
-- ===========================================

CREATE OR REPLACE FUNCTION get_total_consultations(
    p_user_id INT
)

RETURNS INT

LANGUAGE plpgsql

AS $$

DECLARE

total INT;

BEGIN

SELECT COUNT(*)

INTO total

FROM consultations

WHERE user_id = p_user_id;

RETURN total;

END;

$$;
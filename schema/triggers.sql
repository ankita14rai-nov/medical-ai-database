-- ===========================================
-- TRIGGER FUNCTION
-- Update User Last Activity
-- ===========================================

CREATE OR REPLACE FUNCTION update_last_activity()

RETURNS TRIGGER

LANGUAGE plpgsql

AS $$

BEGIN

UPDATE users

SET last_activity = CURRENT_TIMESTAMP

WHERE user_id = NEW.user_id;

RETURN NEW;

END;

$$;





CREATE TRIGGER trg_update_last_activity

AFTER INSERT
ON consultations

FOR EACH ROW

EXECUTE FUNCTION update_last_activity();
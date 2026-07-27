-- ===========================================
-- SAVE GENERATED PDF REPORT
-- ===========================================

INSERT INTO reports
(
    consultation_id,
    pdf_file_name,
    generated_at
)

VALUES
(
    $1,
    $2,
    CURRENT_TIMESTAMP
)

RETURNING report_id;



-- ===========================================
-- GET REPORT DETAILS
-- ===========================================

SELECT

r.report_id,

r.pdf_file_name,

r.generated_at,

u.full_name,

p.disease_name,

a.severity

FROM reports r

INNER JOIN consultations c
ON r.consultation_id = c.consultation_id

INNER JOIN users u
ON c.user_id = u.user_id

INNER JOIN predictions p
ON c.consultation_id = p.consultation_id

INNER JOIN ai_responses a
ON c.consultation_id = a.consultation_id

WHERE r.report_id = $1;
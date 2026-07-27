ALTER TABLE users
ADD CONSTRAINT unique_email
UNIQUE(email);



ALTER TABLE predictions
ADD CONSTRAINT confidence_range
CHECK(confidence >= 0 AND confidence <= 100);

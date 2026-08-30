

UPDATE job_applied
SET status = 'Interview done'
WHERE job_id = 3;  

UPDATE job_applied
SET Contact = 'John Doe'
WHERE job_id = 1;

UPDATE job_applied
SET Contact = 'Jane Smith'
WHERE job_id = 2;

UPDATE job_applied
SET Contact = 'Alex Johnson'
WHERE job_id = 3;


UPDATE job_applied
SET Contact = 'Emily Davis'
WHERE job_id = 4;

ALTER TABLE job_applied
ADD Contact VARCHAR(50);

ALTER TABLE job_applied
RENAME COLUMN Contact TO contact_person;

ALTER  TABLE job_applied
ALTER COLUMN contact_person TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_person;


DROP TABLE job_applied;
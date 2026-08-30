CREATE TABLE job_applied(
    job_id INT,
    application_sent_data DATE,
    custom_name BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT * FROM job_applied;

INSERT INTO job_applied (job_id, application_sent_data, custom_name, resume_file_name, cover_letter_sent, cover_letter_file_name, status)
VALUES (1, '2024-06-01', TRUE, 'resume_john_doe.pdf', TRUE, 'cover_letter_john_doe.pdf', 'Pending'),
       (2, '2024-06-02', FALSE, 'resume_jane_smith.pdf', FALSE, NULL, 'Submitted'),
       (3, '2024-06-03', TRUE, 'resume_alex_johnson.pdf', TRUE, 'cover_letter_alex_johnson.pdf', 'Interview Scheduled'),
       (4, '2024-06-04', FALSE, 'resume_emily_davis.pdf', FALSE, NULL, 'Rejected');
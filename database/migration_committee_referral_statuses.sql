USE lcd_records;

ALTER TABLE records
MODIFY status ENUM(
    'Received',
    'For Review',
    'For Printing',
    'In Committee',
    'Pending to the Committee',
    'For Action',
    'Assigned to the Committee',
    'For Meeting',
    'For Inspection',
    'Referred to a New Committee',
    'Tabled',
    'Noted',
    'Forwarded for Review',
    'For Laws and Rules',
    'For Plenary Session',
    'Completed',
    'Archived'
) NOT NULL DEFAULT 'Received';

UPDATE records
SET status = 'Assigned to the Committee'
WHERE document_type = 'Committee Referrals'
AND status IN ('For Review', 'For Printing', 'In Committee', 'For Action');

ALTER TABLE records
MODIFY status ENUM(
    'Received',
    'Assigned to the Committee',
    'Pending to the Committee',
    'For Meeting',
    'For Inspection',
    'Referred to a New Committee',
    'Tabled',
    'Noted',
    'Forwarded for Review',
    'For Laws and Rules',
    'For Plenary Session',
    'Completed',
    'Archived'
) NOT NULL DEFAULT 'Received';

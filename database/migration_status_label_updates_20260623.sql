ALTER TABLE records
MODIFY status ENUM(
    'Received',
    'Assigned to the Committee',
    'Pending to the Committee',
    'For Meeting',
    'For Inspection',
    'Recommending Approval',
    'Deferred',
    'Tabled',
    'Noted',
    'Referred',
    'For Plenary Session',
    'Others',
    'Completed',
    'Archived',
    'Reviewed and Assigned to the Committee',
    'In the Committee',
    'Agenda for Regular Session',
    'Forwarded for Review',
    'Referred to a New Committee',
    'For Laws and Rules'
) NOT NULL DEFAULT 'Received';

UPDATE records
SET status = 'Assigned to the Committee'
WHERE status = 'Reviewed and Assigned to the Committee';

UPDATE records
SET status = 'Pending to the Committee'
WHERE status = 'In the Committee';

UPDATE records
SET status = 'For Plenary Session'
WHERE status = 'Agenda for Regular Session';

UPDATE records
SET status = 'Referred'
WHERE status IN ('Forwarded for Review', 'Referred to a New Committee');

UPDATE record_movements
SET from_status = CASE from_status
        WHEN 'Reviewed and Assigned to the Committee' THEN 'Assigned to the Committee'
        WHEN 'In the Committee' THEN 'Pending to the Committee'
        WHEN 'Agenda for Regular Session' THEN 'For Plenary Session'
        WHEN 'Forwarded for Review' THEN 'Referred'
        WHEN 'Referred to a New Committee' THEN 'Referred'
        ELSE from_status
    END,
    to_status = CASE to_status
        WHEN 'Reviewed and Assigned to the Committee' THEN 'Assigned to the Committee'
        WHEN 'In the Committee' THEN 'Pending to the Committee'
        WHEN 'Agenda for Regular Session' THEN 'For Plenary Session'
        WHEN 'Forwarded for Review' THEN 'Referred'
        WHEN 'Referred to a New Committee' THEN 'Referred'
        ELSE to_status
    END;

ALTER TABLE records
MODIFY status ENUM(
    'Received',
    'Assigned to the Committee',
    'Pending to the Committee',
    'For Meeting',
    'For Inspection',
    'Recommending Approval',
    'Deferred',
    'Tabled',
    'Noted',
    'Referred',
    'For Plenary Session',
    'Others',
    'Completed',
    'Archived'
) NOT NULL DEFAULT 'Received';

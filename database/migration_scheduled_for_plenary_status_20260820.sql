USE lcd_records;

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
    'Referred To',
    'Referred Back to Committee',
    'Perusal',
    'Endorsement',
    'For Plenary Session',
    'Scheduled for Plenary',
    'Disapproved',
    'Approved in the Plenary',
    'For Vice Mayor''s Signature',
    'Returned from The Vice Mayor',
    'Forwarded for Admin/Mayor Signature',
    'Returned from Admin/Mayor',
    'Veto',
    'Lapse into Ordinance',
    'Forwarded to the Messengerial Services',
    'For Transmittal',
    'Others',
    'Completed',
    'Archived'
) NOT NULL DEFAULT 'Received';

UPDATE records
SET status = 'Scheduled for Plenary'
WHERE status = 'For Plenary Session'
AND plenary_session_date IS NOT NULL;

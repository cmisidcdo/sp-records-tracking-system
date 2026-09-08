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
        'Referred To',
        'Referred Back to Committee',
        'Perusal',
        'Endorsement',
        'For Plenary Session',
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
SET status = 'Referred To'
WHERE status = 'Referred';

UPDATE record_movements
SET from_status = 'Referred To'
WHERE from_status = 'Referred';

UPDATE record_movements
SET to_status = 'Referred To'
WHERE to_status = 'Referred';

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

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
    'Endorsement',
    'For Plenary Session',
    'Others',
    'Completed',
    'Archived'
) NOT NULL DEFAULT 'Received';

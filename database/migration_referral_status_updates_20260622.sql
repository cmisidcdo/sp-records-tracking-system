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
    'Referred to a New Committee',
    'Forwarded for Review',
    'For Laws and Rules'
) NOT NULL DEFAULT 'Received';

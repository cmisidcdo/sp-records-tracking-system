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
    'Approved in the Plenary',
    'Others',
    'Completed',
    'Archived'
) NOT NULL DEFAULT 'Received';

ALTER TABLE records
ADD COLUMN approved_ordinance_number VARCHAR(80) NULL AFTER proposed_resolution_number,
ADD COLUMN approved_resolution_number VARCHAR(80) NULL AFTER approved_ordinance_number,
ADD COLUMN plenary_approved_date DATE NULL AFTER approved_resolution_number;

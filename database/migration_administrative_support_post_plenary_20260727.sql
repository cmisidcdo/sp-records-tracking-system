ALTER TABLE users
MODIFY role ENUM(
    'admin',
    'city_secretary',
    'division_chief',
    'receiving_clerk',
    'secretariat',
    'division_staff',
    'administrative_support',
    'records_officer',
    'staff'
) NOT NULL DEFAULT 'secretariat';

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
    'For Vice Mayor''s Signature',
    'Returned from The Vice Mayor',
    'Forwarded for Admin/Mayor Signature',
    'Returned from Admin/Mayor',
    'Veto',
    'Lapse into Ordinance',
    'Forwarded to the Messengerial Services',
    'Others',
    'Completed',
    'Archived'
) NOT NULL DEFAULT 'Received';

start transaction;

use `AcmeDistributor`;

revoke all privileges on `AcmeDistributor`.* from 'acme-user'@'%';
revoke all privileges on `AcmeDistributor`.* from 'acme-manager'@'%';

drop user 'acme-user'@'%';
drop user 'acme-manager'@'%';

drop database `AcmeDistributor`;

commit;
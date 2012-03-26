use strict;

use FindBin;
use lib "$FindBin::Bin/../lib";

use AIWeb::Schema;

my $schema = AIWeb::Schema->connect(
        'dbi:SQLite:db/aiweb.db',
        );

if (!$schema->get_db_version()) {
    # schema is unversioned
    $schema->deploy();
} else {
    $schema->upgrade();
}


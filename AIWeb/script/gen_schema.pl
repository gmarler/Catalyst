use strict;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Pod::Usage;
use Getopt::Long;
use AIWeb::Schema;

my ( $preversion, $help );
GetOptions(
        'p|preversion:s'  => \$preversion,
        ) or die pod2usage;

my $schema = AIWeb::Schema->connect(
        'dbi:SQLite:db/aiweb.db',
        );
my $version = $schema->schema_version();

if ($version && $preversion) {
    print "creating diff between version $version and $preversion\n";
} elsif ($version && !$preversion) {
    print "creating full dump for version $version\n";
} elsif (!$version) {
    print "creating unversioned full dump\n";
}

my $sql_dir = './sql';
$schema->create_ddl_dir( ['SQLite','MySQL'],
                         $version, $sql_dir, $preversion );


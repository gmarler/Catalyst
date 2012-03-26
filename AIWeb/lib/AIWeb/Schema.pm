package AIWeb::Schema;
use base qw/DBIx::Class::Schema/;

use strict;
use warnings;

our $VERSION = '0.0001';

__PACKAGE__->load_namespaces();

__PACKAGE__->load_components(qw/Schema::Versioned/);

__PACKAGE__->upgrade_directory('sql/');

1;


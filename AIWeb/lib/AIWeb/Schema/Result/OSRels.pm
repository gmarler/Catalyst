package AIWeb::Schema::Result::OSRels;

use Moose;
use namespace::clean -except => 'meta';

extends 'DBIx::Class';

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('osrels');

__PACKAGE__->add_columns(
  osrel_id => {
    data_type         => "INT",
    size              => 11,
    is_nullable       => 0,
    is_auto_increment => 1,
    extra             => { unsigned => 1},
  },
  # This is the version of the pkg named "entire", which is an alias
  # for the SRU/CPU release
  entire_version => {
    data_type         => "VARCHAR",
    size              => 255,
    is_nullable       => 0,
  },
  description => {
    data_type         => "VARCHAR",
    size              => 255,
    is_nullable       => 0,
  },
);

__PACKAGE__->set_primary_key('osrel_id');


__PACKAGE__->has_many(
  'host_osrel' => 'AIWeb::Schema::Result::Host_OSRel',
  'osrel_id'
);
__PACKAGE__->many_to_many(
  'hosts' => 'host_osrel', 'host_id'
);

1;


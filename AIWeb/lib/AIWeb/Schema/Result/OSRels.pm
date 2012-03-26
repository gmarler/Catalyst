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
  fk_host_id => {
    data_type         => "INT",
    size              => 11,
    is_nullable       => 0,
    extra             => { unsigned => 1},
  },
);

__PACKAGE__->set_primary_key('osrel_id');

__PACKAGE__->belongs_to(
  'hosts',
  'AIWeb::Schema::Result::Hosts',
  { 'foreign.host_id' => 'self.fk_host_id' },
);

1;


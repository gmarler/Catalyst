package AIWeb::Schema::Result::Hosts;

use Moose;
use namespace::clean -except => 'meta';

extends 'DBIx::Class';

__PACKAGE__->load_components(qw/InflateColumn::DateTime TimeStamp Core/);
__PACKAGE__->table('hosts');

__PACKAGE__->add_columns(
  host_id => {
    data_type         => "INT",
    size              => 11,
    is_nullable       => 0,
    is_auto_increment => 1,
    extra             => { unsigned => 1},
  },
  hostname => {
    data_type         => "VARCHAR",
    is_nullable       => 0,
    size              => 255,
  },
  last_modified => {
    data_type         => "DATETIME",
    is_nullable       => 0,
    set_on_create     => 1,
    set_on_update     => 1,
  },
);

__PACKAGE__->set_primary_key('host_id');

__PACKAGE__->has_one(
  'osrel',
  'AIWeb::Schema::Result::OSRels',
  { "foreign.fk_host_id" => "self.host_id" },
);

__PACKAGE__->has_one(
  'appgroup',
  'AIWeb::Schema::Result::AppGroups',
  { "foreign.fk_host_id" => "self.host_id" },
);

#__PACKAGE__->has_many(
#  'interfaces',
#  'AIWeb::Schema::Result::Interfaces',
#  { "foreign.fk_host_id" => "self.host_id" },
#);
#

1;


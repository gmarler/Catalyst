package AIWeb::Schema::Result::AppGroups;

use Moose;
use namespace::clean -except => 'meta';

extends 'DBIx::Class';

__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('appgroups');

__PACKAGE__->add_columns(
  appgroup_id => {
    data_type         => "INT",
    size              => 11,
    is_nullable       => 0,
    is_auto_increment => 1,
    extra             => { unsigned => 1},
  },
  name => {
    data_type         => "VARCHAR",
    size              => "255",
    is_nullable       => 0,
  },
);

__PACKAGE__->set_primary_key('appgroup_id');

__PACKAGE__->has_many(
  'host_appgroup' => 'AIWeb::Schema::Result::Host_AppGroup',
  'appgroup_id'
);

__PACKAGE__->many_to_many(
  'hosts' => 'host_appgroup', 'host_id'
);

1;

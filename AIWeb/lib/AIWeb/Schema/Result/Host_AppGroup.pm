package AIWeb::Schema::Result::Host_AppGroup;

use Moose;
use namespace::clean -except => 'meta';
 
extends 'DBIx::Class';
 
__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('host_appgroup');
 
__PACKAGE__->add_columns(
  appgroup_id => { 
    data_type         => "INT",
    size              => 11,
    is_nullable       => 0,
    is_foreign_key    => 1,
  },
  host_id  => { 
    data_type         => "INT",
    size              => 11,
    is_nullable       => 0,
    is_foreign_key    => 1,
  },
);
 
__PACKAGE__->set_primary_key(qw/appgroup_id host_id/);
__PACKAGE__->belongs_to('host_id'  => 'AIWeb::Schema::Result::Hosts');
__PACKAGE__->belongs_to('appgroup_id' => 'AIWeb::Schema::Result::AppGroups');
 
 
1;


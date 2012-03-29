package AIWeb::Schema::Result::Host_OSRel;

use Moose;
use namespace::clean -except => 'meta';
 
extends 'DBIx::Class';
 
__PACKAGE__->load_components(qw/Core/);
__PACKAGE__->table('host_osrel');
 
__PACKAGE__->add_columns(
  osrel_id => { 
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
 
__PACKAGE__->set_primary_key(qw/osrel_id host_id/);
__PACKAGE__->belongs_to('host_id'  => 'AIWeb::Schema::Result::Hosts');
__PACKAGE__->belongs_to('osrel_id' => 'AIWeb::Schema::Result::OSRels');
 
 
1;


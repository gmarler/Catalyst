package AIWeb::Schema::Result::Hosts;

use DateTime::Format::Strptime;
use DateTime::Format::SQLite;

use Moose;
use namespace::clean -except => 'meta';

extends 'DBIx::Class';

__PACKAGE__->load_components(qw/InflateColumn::DateTime TimeStamp Core/);
__PACKAGE__->table('hosts');

my $formatter = DateTime::Format::Strptime->new(
   pattern     => '%D %H:%M:%S',
   time_zone   => 'America/New_York',
   locale      => 'en_US',
);

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
    data_type         => "datetime",
    timezone          => "America/New_York",
    locale            => "en_US",
    is_nullable       => 0,
    set_on_create     => 1,
    set_on_update     => 1,
  },
);

__PACKAGE__->inflate_column( 'last_modified',
  {
    inflate => sub {
      my $dt = DateTime::Format::SQLite->parse_datetime( shift );
      $dt->set_formatter( $formatter );

      return $dt;
    },
    deflate => sub { return shift; },
  }
);

__PACKAGE__->set_primary_key('host_id');

__PACKAGE__->has_one(
  'host_osrel' => 'AIWeb::Schema::Result::Host_OSRel',
  'host_id'
);
__PACKAGE__->many_to_many(
  'osrel' => 'host_osrel', 'osrel_id'
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


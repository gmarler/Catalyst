package MyCalais::Processor;

use Moose;
use JSON::Any;
use Net::Calais;

has 'apikey'    => (is => 'ro', isa => 'Str',         required => 1   );
has 'json_data' => (is => 'rw', isa => 'Str',                         );
has 'api'       => (is => 'ro', isa => 'Net::Calais', lazy_build => 1 );
has 'storage'   => (is => 'rw', isa => 'HashRef',
                    default    => sub { {} }                          );

# provides the Net::Calais API object, and builds it only the first time it's
# called.
sub _build_api {
  my ($self) = @_;
  return Net::Calais->new(apikey => $self->apikey);
}

# provides the data returned from the semanticproxy web service in the
# requested format, defaulting to JSON.  Note we set the accessor
# $self->json_data as we get Moose's error trapping for free if we do it this
# way.

sub url_serialised {
  my ($self, $url, $format) = @_;
  $format ||= 'json';
  $self->json_data( $self->api->semanticproxy($url, output => $format) );
}

# provides the data from url_serialised in a perl data structure
sub url_as_data {
  my ($self, $url) = @_;
  my $format = 'json';
  my $j = JSON::Any->new;
  $self->url_serialised($url);
  return $j->jsonToObj( $self->json_data );
}

# send it some text and a content-type and return the requested format.
sub text_serialised {
  my ($self, $txt, $args) = @_;
  $args->{format} ||= 'application/json';
  $args->{content_type} ||= 'text/txt';
  return $self->api->enlighten($txt, %$args);
}

# as text_serialised but as a perl data structure
sub text_as_data {
  my ($self, $txt, $args) = @_;
  $args->{content_type} ||= 'text/txt';
  delete $args->{format} if $args->{format};
  my $json = $self->text_serialised($txt, %$args);
  my $j = JSON::Any->new;
  return $j->jsonToObj($json);
}

1;

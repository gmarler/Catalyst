package MyCalais::Model::Calais;

use strict;
use warnings;

use parent 'Catalyst::Model::Adaptor';

__PACKAGE__->config(
  class => 'MyCalais::Processor',
  args  => { apikey => '9uk4h86h54nqg5zhfqhghw2c' },
);

sub mangle_arguments {
  my ($self, $args) = @_;
  return %$args;
}

1;

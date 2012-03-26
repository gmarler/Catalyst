package MyCalais::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }
use YAML;

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

MyCalais::Controller::Root - Root Controller for MyCalais

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 default

Standard 404 error page

=cut

sub default :Path {
  my ( $self, $c ) = @_;
  my $url = $c->req->query_parameters->{url};
  eval {
    $c->stash(response => $c->model('Calais')->url_as_data( $url) );
  };
  if ($@) {
    $c->stash(
      response => {
        error => qq(The OpenCalais service is experiencing problems.
                    Please retry after a few seconds),
        error_text => "$@" }
    );
  }
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
  my ($self, $c) = @_;
  $c->res->body('<pre>' . Dump ($c->stash->{response}) . '</pre>');
}

=head1 AUTHOR

Gordon Marler

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

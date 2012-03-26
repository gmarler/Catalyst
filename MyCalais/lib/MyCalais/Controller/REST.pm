package MyCalais::Controller::REST;

use strict;
use warnings;
use base 'Catalyst::Controller::REST';

use Moose;

use namespace::autoclean;


=head1 NAME

MyCalais::Controller::REST - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index : Path Args(0) ActionClass('REST') {
    my ( $self, $c ) = @_;
}

sub index_PUT {
  my ($self,$c) = @_;
  my $url = $c->req->data->{url};
  my $model = $c->model('Calais');
  my $data;
  eval { $data = $model->url_as_data($url) };
  if ( ! $@ ) {
    $model->storage->{$url} = $data;
    $self->status_created($c,
      location => $c->req->uri->as_string,
      entity   => { $url => $data } );
  } else { # there was an error with the web service
    $c->res->status(502);
    $c->stash( rest => {
        error => 'Error with the upstream web service, please retry shortly'
      } );
  }
}

=head2 record

=cut

sub record : Path Args(1) ActionClass('REST') {
    my ( $self, $c ) = @_;
}


=head1 AUTHOR

Gordon Marler

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

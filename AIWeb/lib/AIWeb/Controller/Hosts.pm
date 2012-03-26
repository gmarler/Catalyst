package AIWeb::Controller::Hosts;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

AIWeb::Controller::Hosts - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

#sub index :Path :Args(0) {
#    my ( $self, $c ) = @_;
#
#    $c->response->body('Matched AIWeb::Controller::Hosts in Hosts.');
#}

=head2 base

Can place common logic to start chained dispatch here

=cut

sub base :Chained('/') :PathPart('hosts') :CaptureArgs(0) {
  my ($self, $c) = @_;

  # Store the ResultSet in stash so it's available for other methods
  $c->stash(resultset => $c->model('DB::Hosts'));

  # Print a message to the debug log
  $c->log->debug('*** INSIDE BASE METHOD ***');
}

=head2 form_create

Display form to collect information for host to create

=cut

sub form_create :Chained('base') :PathPart('form_create') :Args(0) {
  my ($self, $c) = @_;

  # Set the TT template to use
  $c->stash(template => 'hosts/form_create.tt2');
}

sub create :Chained('base') :PathPart('create') :Args(1) {
  # In addition to self & context, get the hostname
  # args from the URL.  Note that Catalyst automatically
  # puts the first 1 arguments worth of extra information after the 
  # "/<controller_name>/<action_name/" into @_ because we specified
  # "Args(1)".  The args are separated by the '/' char on the URL.
  my ($self, $c, $hostname) = @_;


}

=head1 AUTHOR

Gordon Marler

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

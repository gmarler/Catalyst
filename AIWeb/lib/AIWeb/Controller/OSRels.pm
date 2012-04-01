package AIWeb::Controller::OSRels;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

AIWeb::Controller::OSRels - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

#sub index :Path :Args(0) {
#    my ( $self, $c ) = @_;
#
#    $c->response->body('Matched AIWeb::Controller::OSRels in OSRels.');
#}

=head2 base

Can place common logic to start chained dispatch here

=cut

sub base :Chained('/') :PathPart('osrels') :CaptureArgs(0) {
  my ($self, $c) = @_;

  # Store the ResultSet in stash so it's available for other methods
  $c->stash(resultset => $c->model('DB::OSRels'));

  # Print a message to the debug log
  $c->log->debug('*** INSIDE BASE METHOD ***');
}

sub list :Chained('base') :PathPart('list') :Args(0) {
  my ($self, $c) = @_;

  $c->stash(osrels =>
    [ $c->model('DB::OSRels')->search(
        undef,  # We want everything
        { order_by => { -asc => [ qw/entire_version/ ] } }
      ) 
    ] );

  $c->stash(template => 'osrels/list.tt2' );
}

=head2 form_create

Display form to collect information for OS Release to create

=cut

sub form_create :Chained('base') :PathPart('form_create') :Args(0) {
  my ($self, $c) = @_;

  # Set the TT template to use
  $c->stash(template => 'osrels/form_create.tt2');
}

sub create :Chained('base') :PathPart('create') :Args(2) {
  # In addition to self & context, get the hostname
  # args from the URL.  Note that Catalyst automatically
  # puts the first 1 arguments worth of extra information after the 
  # "/<controller_name>/<action_name/" into @_ because we specified
  # "Args(1)".  The args are separated by the '/' char on the URL.
  my ($self, $c, $description, $entire_version) = @_;


}

=head2 form_create_do

Take information from form and add to database

=cut

sub form_create_do :Chained('base') :PathPart('form_create_do') :Args(0) {
  my ($self, $c) = @_;

  # Retrieve the values from the form
  my $desc       = $c->request->params->{description}     || 'N/A';
  my $entire_ver = $c->request->params->{entire_version}  || 'N/A';

  # Create the book
  my $osrel = $c->model('DB::OSRels')->create({
          description      => $desc,
          entire_version   => $entire_ver,
      });

  # Handle relationship with author
  #$book->add_to_book_authors({author_id => $author_id});
  # Note: Above is a shortcut for this:
  # $book->create_related('book_authors', {author_id => $author_id});

  # Store new model object in stash and set template
  $c->stash(osrel     => $osrel,
            template => 'osrels/create_done.tt2');
}

=head1 AUTHOR

Gordon Marler

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

package AIWeb::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    # Altered the default TT extension to .tt2
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,
);

=head1 NAME

AIWeb::View::HTML - TT View for AIWeb

=head1 DESCRIPTION

TT View for AIWeb.

=head1 SEE ALSO

L<AIWeb>

=head1 AUTHOR

Gordon Marler

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

package LolCatalyst::Lite::Auth::Schema::Result::UserRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("EncodedColumn");

=head1 NAME

LolCatalyst::Lite::Auth::Schema::Result::UserRole

=cut

__PACKAGE__->table("user_role");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 user

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 roleid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "user",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "roleid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 roleid

Type: belongs_to

Related object: L<LolCatalyst::Lite::Auth::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "roleid",
  "LolCatalyst::Lite::Auth::Schema::Result::Role",
  { id => "roleid" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 user

Type: belongs_to

Related object: L<LolCatalyst::Lite::Auth::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "LolCatalyst::Lite::Auth::Schema::Result::User",
  { id => "user" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2011-09-08 23:29:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RqSu2VuwqiKdwJtH55TsFg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;

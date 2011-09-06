use strict;
use warnings;

use LolCatalyst::Lite;

my $app = LolCatalyst::Lite->apply_default_middlewares(LolCatalyst::Lite->psgi_app);
$app;


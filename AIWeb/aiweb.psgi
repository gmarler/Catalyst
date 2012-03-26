use strict;
use warnings;

use AIWeb;

my $app = AIWeb->apply_default_middlewares(AIWeb->psgi_app);
$app;


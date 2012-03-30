use strict;
use warnings;
use Test::More;


use Catalyst::Test 'AIWeb';
use AIWeb::Controller::OSRels;

ok( request('/osrels')->is_success, 'Request should succeed' );
done_testing();

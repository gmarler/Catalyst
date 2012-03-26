use strict;
use warnings;
use Test::More;


use Catalyst::Test 'AIWeb';
use AIWeb::Controller::Hosts;

ok( request('/hosts')->is_success, 'Request should succeed' );
done_testing();

use strict;
use warnings;
use Test::More qw/no_plan/;


BEGIN { use_ok 'Catalyst::Test', 'MyCalais'  };
BEGIN { use_ok 'MyCalais::Controller::REST' };

use HTTP::Request::Common qw/GET POST PUT DELETE/;
use JSON::Any;

my $j = JSON::Any->new;

my $resp;
my $req_data;

diag 'Add a resource';
$req_data = { url => 'http://dev.catalystframework.org/snow_white'};
$resp = request( PUT '/rest', 'Content-Type' => 'application/json',
                 Content => $j->objToJson($req_data) );
diag $resp->status_line;
diag $resp->content;

$req_data = { url => 'http://dev.catalystframework.org' };

$resp = request( PUT '/rest', 'Content-Type' => 'application/json',
                 Content => $j->objToJson($req_data) );
diag $resp->status_line;
diag $resp->content;


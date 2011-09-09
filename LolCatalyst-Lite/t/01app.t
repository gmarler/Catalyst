#!/usr/bin/env perl
use strict;
use warnings;
use Test::More qw(no_plan);

BEGIN { use_ok 'Catalyst::Test', 'LolCatalyst::Lite' }
use HTTP::Headers;
use HTTP::Request::Common;

diag <<EOF

*********************************WARNING*****************************
The APP_TEST environment variable is not set. Please run this test
script with the APP_TEST variable set to one (e.g. APP_TEST=1 prove –l $0 ) to
ensure that the authentication component of the application is tested
properly.
EOF
if !$ENV{APP_TEST};


# GET request
my $request = GET('http://localhost');
$request->headers->authorization_basic('fred', 'wilma');
my $response;
ok( $response = request($request), 'Basic request to start page');
ok( $response->is_success, 'Start page request successful 2xx' );
is( $response->content_type, 'text/html', "HTML Content-Type" );
like( $response->content, qr/Translate/, "Contains the word Translate");

# test request to translate
$request = POST(
  'http://localhost/translate',
  'Content-Type' => 'form-data',
  'Content'      => [
    'lol' => 'Can I have a cheese burger?',
  ]
);
$request->headers->authorization_basic('fred', 'wilma');

$response = undef;
ok( $response = request($request), 'Request to return translation');
ok( $response->is_success, 'Translation request successful 2xx' );
is( $response->content_type, 'text/html', 'HTML content type' );
like( $response->content, qr/CHEEZ/, "Contains a correct translation snippet" );

# test request to translate_service
SKIP: {
  skip "Set APP_TEST for the tests to run fully",
    4 if !$ENV{APP_TEST};

  $request = POST(
    'http://localhost/translate_service',
    'Content-Type' => 'form-data',
    'Content'      => [
    'lol' => 'Can I have a cheese burger?',
    ]
  );
  $request->headers->authorization_basic('fred', 'wilma');

  $response = undef;
  ok($response = request($request), 'Request to return JSON');
  ok( $response->is_success, 'Translation request successful 2xx' );
  is( $response->content_type, 'application/json', 'JSON content type' );
  like( $response->content, qr/CHEEZ/, "contains translated string");
}

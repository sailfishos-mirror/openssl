#!/usr/bin/env perl
# Copyright 2025 The OpenSSL Project Authors. All Rights Reserved.
#
# Licensed under the Apache License 2.0 (the "License").  You may not use
# this file except in compliance with the License.  You can obtain a copy
# in the file LICENSE in the source distribution or at
# https://www.openssl.org/source/license.html

use strict;
use warnings;

use OpenSSL::Test qw/:DEFAULT srctop_file/;
use OpenSSL::Test::Utils;

my $fuzzer = "ml-kem";
setup("test_fuzz_${fuzzer}");

plan skip_all => "This test requires ml-kem support"
    if disabled("ml-kem");

plan tests => 2; # one more due to below require_ok(...)

require_ok(srctop_file('test','recipes','fuzz.pl'));

fuzz_ok($fuzzer);

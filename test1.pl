#!/usr/bin/env perl
use strict;
use Judy::1 qw( Set Get Unset Count MemUsed First );
my $judy;
print Set( $judy, 123456 )
    ? "ok - bit successfully set at 123456\n"
    : "not ok - bit already set at 123456\n";

print Get( $judy, 654321 )
    ? "not ok - set bit at 654321\n"
    : "ok - bit not set at 654321\n";

my ( $count ) = Count( $judy, 0, -1 );
print "$count bits set in Judy::1 array\n";

my ( $key ) = First( $judy, 0 );
if ( defined $key ) {
    print "ok - first bit set is at $key\n";
}
else {
    print "not ok - no bits set in array\n";
}

printf "$count Keys used %d bytes of memory\n", MemUsed( $judy );

print Unset( $judy, 123456 )
    ? "ok - bit successfully unset at 123456\n"
    : "not ok - bit was not unset at 123456\n";

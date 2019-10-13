#!/usr/bin/perl

$amap{ "a" } = "d1";
$amap{ "b" } = "d2";
$amap{ "c" } = "d3";

$bmap{ "aa" } = "dd1";
$bmap{ "bb" } = "dd2";
$bmap{ "cc" } = "dd3";

$bary[0] = "100";
$bary[1] = "200";
$bary[2] = "300";

sub map_pr
{
	local( $mapref ) = @_;

	for( sort keys $mapref ) {
		my $key = $_;
		printf( "map_pr: $key, $mapref->{$key}\n" );
	}
}

sub map_add
{
	local( $mapref, $key, $new ) = @_;
	$mapref->{$key} = $new;
}

sub map_get
{
	local( $mapref, $key ) = @_;
	if ( exists $mapref->{$key} ) {
		return $mapref->{$key};
	} else {
		return "";
	}
}

sub ary_pr
{
	local( $aryref ) = @_;

	foreach (sort keys $aryref ) {
		my $key = $_;
		printf( "ary_pr: $key, $aryref->[$key]\n" );
	}
}

sub ary_add
{
	local( $aryref, $new ) = @_;
	my @ary = @$aryref;
	$aryref->[ $#ary + 1 ] = $new;
}

map_pr( \%amap );
map_add( \%amap, "zz", "dataZZ" );
map_pr( \%amap );
printf( "map_get : a -> %s\n", map_get( \%amap, "a" ) );
printf( "map_get : c -> %s\n", map_get( \%amap, "c" ) );
printf( "map_get : NULL -> %s\n", map_get( \%amap, "NULL" ) );

map_pr( \%bmap );

ary_pr( \@bary );
ary_add( \@bary, "900" );
ary_pr( \@bary );

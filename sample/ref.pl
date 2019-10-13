#!/usr/bin/perl


$hash2{ "a" } = "d21";
$hash2{ "b" } = "d22";
$hash2{ "c" } = "d23";


$hash3{ "a" } = \%hash2;
$hash3{ "b" } = \%hash2;
$hash3{ "c" } = \%hash2;

my $ref1 = \%hash;
my $ref2 = \@array;

printf( "1:%s\n", ref( $ref1 ) );
printf( "2:%s\n", ref( $ref2 ) );

printf( "hash3[c]_ref:%s\n", ref( $hash3{ "c" } ) );
printf( "hash3[c][0]:%s\n", $hash3{"c"}{"c"} );

$array[0] = "100";
$array[1] = "200";
$array[2] = "300";

$hash{ "a" } = \%hash2;
$hash{ "b" } = "abc";
$hash{ "c" } = \@array;

printf( "hash[a]_ref:%s\n", ref( $hash{ "a" } ) );
printf( "hash[a]{c}:%s\n", $hash{"a"}{"c"} );

printf( "hash[b]_ref:%s\n", ref( $hash{ "b" } ) );
printf( "hash[b]:%s\n", $hash{"b"} );

printf( "hash[c]_ref:%s\n", ref( $hash{ "c" } ) );
printf( "hash[c][2]:%s\n", $hash{"c"}[2] );

for( sort keys %hash ) {
	my $ref = ref( $hash{ $_ } );
	if( $ref eq "HASH" ) {
		printf( "HASH:$_:%s\n", $hash{$_}{"c"} );
	} elsif( $ref eq "ARRAY" ) {
		printf( "ARRYA:$_:%s\n", $hash{$_}[2] );
	} elsif( $ref eq "" ) {
		printf( "NULL:$_:%s\n", $hash{$_} );
	} else {
		printf( "OTHER:%s\n", $ref );
	}
}
my $infos2 = {
  '01:01' => {count => 3, ave_time => 2.1, max_time => 4.6},
  '01:02' => {count => 5, ave_time => 4.1, max_time => 7.4},
  '01:03' => {count => 6, ave_time => 3.5, max_time => 5.7}
};

my $it3 = { count => 6, ave_time => 3.5, max_time => 5.7};

my $infos3 = {
  '01:01' => {count => 3, ave_time => 2.1, max_time => 4.6},
  '01:02' => {count => 5, ave_time => 4.1, max_time => 7.4},
  '01:03' => $it3
};

my %info;

$info{ '01:01' } = {count => 3, ave_time => 2.1, max_time => 4.6};
$info{ '01:02' } = {count => 5, ave_time => 4.1, max_time => 7.4};
$info{ '01:03' } = $it3;

my $infos = \%info;

for my $time (sort keys %$infos) {
  print "TIME: $time\n";
  
  # (2) 内側のループ
  for my $name (sort keys %{$infos->{$time}} ) {
  	my $value = $infos->{$time}{$name};
  	print "  $name:$value\n";
  }
}

printf( "ref:%s\n", $info{ '01:03' } );
printf( "ref:%s\n", ref( $info{ '01:03' } ) );

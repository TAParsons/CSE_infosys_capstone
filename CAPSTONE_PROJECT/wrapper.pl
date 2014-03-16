#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
#Employment data project

###Data Munging###

#load from "raw"

open FILE, "raw" or die $!;
my @lines = <FILE>;
close(FILE);
my @words;
foreach my $line (@lines){
	$line=~s/\"//g;
	my @split = split(/,/,$line);
	my %data=(
		firstname=>$split[0],
		middlename=>$split[1],
		lastname=>$split[2],
		suffix=>$split[3],
		address=>$split[4],
		city=>$split[5],
		state=>$split[6],
		zip=>$split[7],
		birthdate=>$split[8],
		fn=>$split[9],
	);
	push(@words,\%data);
}

print Dumper @words;

foreach my $person (@words){
	my $fname = $person->{firstname};
	my $lname = $person->{lastname};
	system($^X, "fbscraper.pl", $fname,$lname);
}




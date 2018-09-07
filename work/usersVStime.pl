#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper qw(Dumper);

my ($file1) = $ARGV[0];
my ($file2) = $ARGV[1];

my $x;
my $y;
my $cont;

if (not defined $file2) {
	die "usage: $0 filename1 filename2\n";
}

process($file1,1);
process($file2,2);

sub process {

	$x = "";
	$y = "";
	$cont = 0;

	open(my $fd, $_[0])
		or die "Could not open file '$_[0]': $!";

	while (my $row = <$fd>){
		
		$cont++;
		if ($cont <= 2) {
			next;
		}

		chomp $row;
		my ($time, $cpu, $mem, $users, $netInMB, $netOutMB, $netInKB, $netOutKB) = split /:/, $row;
		my @tmp = split /users/, $users;
		$x .= "$time, ";
		$y .= "$tmp[0], ";

				

		#print "$time CPU: $cpu\n";
		#print "$row\n";
		#my @str;
		#@str = split / /, $row;
		#print Dumper \@str;
	}

	$x = substr $x, 0, -2;
	$y = substr $y, 0, -2;

	print "VAR$_[1]='%$_[0]';\n";
	print "X$_[1] = [ $x ];\n\n";
	print "Y$_[1] = [ $y ];\n\n";

}

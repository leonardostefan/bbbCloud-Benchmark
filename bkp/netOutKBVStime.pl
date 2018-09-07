#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper qw(Dumper);

my ($file) = @ARGV;

my $x;
my $y;
my $cont = 0;

if (not defined $file) {
	die "usage: $0 filename\n";
}


open(my $fd, $file)
	or die "Could not open file '$file': $!";

while (my $row = <$fd>){
	
	$cont++;
	if ($cont <= 2) {
		next;
	}

	chomp $row;
	my ($time, $cpu, $mem, $users, $netInMB, $netOutMB, $netInKB, $netOutKB) = split /:/, $row;
        my @tmp = split /KBps/, $netOutKB;
        $y .= "$tmp[0], ";
        $x .= "$time, ";


	#print "$time CPU: $cpu\n";
	#print "$row\n";
	#my @str;
	#@str = split / /, $row;
	#print Dumper \@str;
}

$x = substr $x, 0, -2;
$y = substr $y, 0, -2;

print "X1 = [ $x ];\n\n";
print "Y1 = [ $y ];\n\n";

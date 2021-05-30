use strict;
use warnings;

print "Enter Filename : \n";
my $filename = <STDIN>;
chomp $filename;
open(SEQ, "<", $filename) or die $!;
my $seq = ""; my $acidic = 0; my $basic = 0;
while(<SEQ>)
{
	chomp $_;
	if ($_ =~ m/^>/) {next;}
	$seq .= uc($_);
}

my $len = length($seq);
$acidic = $seq =~ tr/DE//;
$basic = $seq =~ tr/RHK//;

print "ACIDIC RESIDUES\t\t\t:\t\t".$acidic."\n";
print "BASIC RESIDUES\t\t\t:\t\t".$basic."\n";
print "SEQUENCE LENGTH\t\t\t:\t\t".$len."\n";
print "ACIDIC COMPPOSITION\t\t:\t\t".($acidic * 100 / $len)."\n";
print "BASIC COMPOSITION\t\t:\t\t".($basic * 100 / $len)."\n";


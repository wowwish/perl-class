use strict;
use warnings;

print "Enter Filename : \n";
my $filename = <STDIN>;
chomp $filename;
open(SEQ, "<", $filename) or die $!;
my $seq = ""; my $gravy = 0;
while(<SEQ>)
{
	chomp $_;
	if ($_ =~ m/^>/) {next;}
	$seq .= uc($_);
}

my @seqarray = split(//, $seq);
my %hydropathy = ('A' => 1.800, 'R' => -4.500, 'N' => -3.500, 'D' => -3.500, 'C' => 2.500, 'Q' => -3.500, 'E' => -3.500, 'G' => -0.400,
				  'H' => -3.200, 'I' => 4.500, 'L' => 3.800, 'K' => -3.900, 'M' => 1.900, 'F' => 2.800, 'P' => -1.600, 'S' => -0.800,
				  'T' => -0.700, 'W' => -0.900, 'Y' => -1.300, 'V' => 4.200);
				  
for (my $i = 0; $i <= $#seqarray; $i++)
{
	$gravy += $hydropathy{$seqarray[$i]};
}

$gravy /= ($#seqarray + 1);
print "GRAVY : ".$gravy."\n";


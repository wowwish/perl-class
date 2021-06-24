# Motif = KXR

use strict;
use warnings;

sub count_motif
{
	my $prot = uc($_[0]);
	my $motif = uc($_[1]);
	chomp $motif;
	chomp $prot;
	my $c = 0;
	for (my $i = 0; $i < length($prot) - 3; $i++)
	{
		my $triplet = substr($prot, $i, 3);
		if($triplet =~ m/$motif/) { $c++; }
	}
	return $c;
}	

print "Enter the FASTA sequence file : \n";
my $filename = <STDIN>;
chomp $filename;
open(FH, "<$filename");
my $seq = "";
while(<FH>)
{
	chomp $_;
	if($_ =~ m/^>/) { next; }
	else { $seq .= uc($_); }
}
close(FH);

my $count = count_motif($seq, "K.R");
print("The Motif K-X-R occurs ".$count." times.");
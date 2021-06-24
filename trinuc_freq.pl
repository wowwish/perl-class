use strict;
use warnings;

print "Enter the nucleotide FASTA file : \n";
my $filename = <STDIN>;
chomp $filename;
my $seq = "";
open(SEQ, "<$filename") or die $!;
while(<SEQ>)
{
	if ($_ =~ m/^>/) { next; }
	else { chomp $_; $seq .= uc($_); }
}
close(SEQ);
my $codon; my %freq = ();
for (my $i = 0; $i < length($seq) - 3; $i++)
{
	$codon = substr($seq, $i, 3);
	if (exists($freq{$codon})) { $freq{$codon} += 1; }
	else { $freq{$codon} = 1; }
}
my @keys = sort { $freq{$b} <=> $freq{$a} } keys %freq;
print "\nCodon Frequencies : \n";
foreach my $key(@keys)
{
	print $key." : ".$freq{$key}." (".(($freq{$key} / (length($seq) - 3)) * 100)."%)\n";
}
	
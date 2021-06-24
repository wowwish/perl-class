use strict;
use warnings;

print "Enter FASTA sequence file:\n";
my $filename = <STDIN>;
chomp $filename;

my $count = 0;
my $seq = "";
open (FH, "<$filename") or die $!;
while(<FH>)
{
	chomp $_;
	if ($_ =~ m/^>/) { next; }
	$seq .= uc($_);
}
my $rna = $seq;
$rna =~ tr/T/U/;
my $revcomp = reverse($seq);
$revcomp =~ tr/ATGC/TACG/;
print "RNA Sequence : \n".$rna."\n\n";
print "Reverse Complement : \n".$revcomp."\n\n";
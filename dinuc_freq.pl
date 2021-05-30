use strict;
use warnings;
use LWP::Simple;

my $dna = "";
open(IN, "<", "GU190379.1.fasta");
while(<IN>)
{
	chomp $_;
	if ($_ =~ m/^>/) {next;}
	$dna .= $_;
}
die "couldn't read the fasta file!" unless defined $dna;
my @seqarray = split(//, $dna);
my $aa = 0; my $at = 0; my $ag = 0; my $ac = 0; 
for (my $i = 0; $i < $#seqarray; $i++)
{
	my $dinucleotide = $seqarray[$i].$seqarray[$i + 1];
	if ($dinucleotide eq 'AA') {$aa+=1;}
	elsif ($dinucleotide eq 'AT') {$at+=1;}
	elsif ($dinucleotide eq 'AG') {$ag+=1;}
	elsif ($dinucleotide eq 'AC') {$ac+=1;}
}

print "\nDinucleotide Frequencies : \n";
print "AA : ".$aa."\n";
print "AT : ".$at."\n";
print "AG : ".$ag."\n";
print "AC : ".$ac."\n";

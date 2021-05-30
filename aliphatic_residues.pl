use strict;
use warnings;
use LWP::Simple;

print "Enter Uniprot ID:\n";
my $accession_id = uc(<STDIN>);
chomp $accession_id;
my $protein = get("https://www.uniprot.org/uniprot/".$accession_id.".fasta");
die "couldn't get the fasta for accession ID. Check your Input!" unless defined $protein;
my @fasta = split('\n', $protein);
$protein = join('', @fasta[1..scalar(@fasta) - 1]);
my $aliphatic_count = $protein =~ tr/AVLIM//;
print("Number of Aliphatic Residues : ", $aliphatic_count."\n");
print("Aliphatic Amino Acid Content : ", $aliphatic_count * 100 / length($protein));
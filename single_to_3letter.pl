use strict;
use warnings;
use LWP::Simple;


my %amino_acid_letters = ("A" => "Ala", "R" => "Arg", "N" => "Asn", "D" => "Asp", "C" => "Cys", "Q" => "Gln", "E" => "Glu", "G" => "Gly",
						"H" => "His", "I" => "Ile", "L" => "Leu", "K" => "Lys", "M" => "Met", "F" => "Phe", "P" => "Pro", "S" => "Ser",
						"T" => "Thr", "W" => "Trp", "Y" => "Tyr", "V" => "Val");

sub convert {
	my $seq = $_[0];
	my $aacode = "";
	chomp $seq;
	foreach my $residue(split(//, $seq))
{
	$aacode .= $amino_acid_letters{$residue}." ";
}
	return $aacode;
}


print "Enter Uniprot ID:\n";
my $accession_id = uc(<STDIN>);
chomp $accession_id;
my $protein = get("https://www.uniprot.org/uniprot/".$accession_id."\.fasta");
die "couldn't get the fasta for accession ID. Check your Input!" unless(defined($protein));
my @fasta = split('\n', $protein);
$protein = uc(join('', @fasta[1..scalar(@fasta) - 1]));

$protein = convert($protein);
print "The 3-letter Sequence : ".$protein;



use strict;
use warnings;
use LWP::Simple;

print "Enter Uniprot ID:\n";
my $accession_id = uc(<STDIN>);
chomp $accession_id;
my $protein = get("https://www.uniprot.org/uniprot/".$accession_id.'.fasta');
if (!defined($protein)) { die "couldn't get the fasta for accession ID. Check your Input!"; }
open(OUT, ">", $accession_id.".fasta") or die $!;
print OUT $protein;
close(OUT);
print("FASTA Sequence saved in File : ".$accession_id.".fasta\n");
my @fasta = split('\n', $protein);
$protein = uc(join('', @fasta[1..scalar(@fasta) - 1]));

my %mw = ('A' => 89, 'R' => 174, 'N' => 132, 'D' => 133, 'C' => 121, 'Q' => 146, 'E' => 147, 'G' => 75, 'H' => 155, 'I' => 131,
		'L' => 131, 'K' => 146, 'M' => 149, 'F' => 165, 'P' => 115, 'S' => 105, 'T' => 119, 'W' => 204, 'Y' => 181, 'V' => 117);

my $sum_mw = 0;
foreach my $residue(split(//, $protein))
{
	$sum_mw += $mw{$residue};
}

print("Molecular Weight : ", $sum_mw, " Da");
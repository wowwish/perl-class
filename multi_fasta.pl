use strict;
use warnings;

print "Enter Multi-Fasta Filename :\n";
my $filename = <STDIN>;
chomp $filename;
open(FASTA, "<", $filename) if (-e $filename) or die $!;
my %results = ();
my %lengths = ();

sub polar {
	my $count = uc($_[0]) =~ tr/RKDENQHSTY//;
	return ($count / $_[1]) * 100;
}

my @name = split('\|', <FASTA>);
my $header = $name[1];
my $seq;
while(<FASTA>)
{
	chomp $_;
	if($_ =~ m/^>/) {
		@name = split('\|', $_);
		$header = $name[1];
		$results{$header} = polar($seq, length($seq));
		$lengths{$header} = length($seq);
		$seq = "";
	}
	else {$seq .= $_; }
}

close(FASTA);
open(RES, ">", "results.txt");
my @keys = sort { $results{$b} <=> $results{$a} } keys %results;
print "RESULTS : \n";
print RES "RESULTS : \n";
foreach my $key(@keys) {
	print $key." : "."Length = ".$lengths{$key}.", Polar AA Freq = ".$results{$key}."\n";
	print RES $key." : "."Length = ".$lengths{$key}.", Polar AA Freq = ".$results{$key}."\n";
}
close(RES);
print "Results written to file : results.txt\n";
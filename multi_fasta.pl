use strict;
use warnings;

print "Enter Multi-Fasta Filename :\n";
my $filename = <STDIN>;
chomp $filename;
open(FASTA, "<", $filename) if (-e $filename) or die $!;
my %results = ();

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
	print $key." : ".$results{$key}."\n";
	print RES $key." : ".$results{$key}."\n";
}
close(RES);
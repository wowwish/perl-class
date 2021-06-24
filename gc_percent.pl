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
foreach my $base(split(//, $seq)) { if ($base =~ m/G|C/) { $count++; } }
print "GC PERCENT : " . (($count/length($seq)) * 100);
close(FH);

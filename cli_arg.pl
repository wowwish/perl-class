use strict;
use warnings;

if ($#ARGV != 1 ) {die "Usage : perl cli_arg.pl <Sequence file> <Nucleotide base>\n";} 
my $filename = $ARGV[0];
my $base = uc($ARGV[1]);
my $count = 0;
chomp $base;
if (!-e $filename) {die "The sequence file does not exist.\n";}
elsif (!$base =~m/[ATGC]/) {die "The allowed bases are A, T, G, C.";}
chomp $filename;
open(SEQ, "<", $filename);
while(<SEQ>)
{	chomp $_;
	$_ = uc($_);
	if ($_ =~ m/^>/) {next;}
	$count += () = $_ =~ m/$base/g;
}
close(SEQ);
print "Count of ".uc($base)." in ".$filename." = ".$count;

use strict;
use warnings;

my $gb = ""; my $seq;
open(GENBANK, "<", "GU190379.1.gb") or die $!;
while(<GENBANK>) {$gb .= $_;}
close(GENBANK);

if($gb =~ /.*ORIGIN(.*)\/\//s) {
	$seq = $1;
	$seq =~ s/\d//g;
	$seq =~ s/\s//g;
	print "SEQUENCE : \n".uc($seq);
}
else {print "Error! No Sequence found. Check the GenBank file.";}
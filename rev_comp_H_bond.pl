print "Enter the DNA Sequence:\n";
$seq = <STDIN>;
chomp $seq;
my $non_base = 0;
$non_base = ($seq =~ s/[^atgcATGC-]//g);
if ($non_base > 0)
{
	print "Your Sequence contains invalid Characters.\n";
	#print "Invalid Characters : ", $non_base, "\n";
	exit;
}
else
{
	$rev_comp = reverse($seq);
	$rev_comp = uc($rev_comp);
	$rev_comp =~ tr/atgcATGC/tacgTACG/;
	$h_bonds = (($seq =~ tr/atAT//) * 2) + (($seq =~ tr/gcGC//) * 3);
	print "Reverse Complement:\n";
	print $rev_comp,"\n";
	print "H-Bonds:\n";
	print $h_bonds,"\n";
}
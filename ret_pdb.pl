use strict;
use warnings;

print "Enter the PDB filename: \n";
my $filename = <STDIN>;
chomp $filename;
open(PDB, "<", $filename) if (-e $filename) or die $!;
while(<PDB>)
{
	print $_ if($_ =~ m/^ATOM|^HETATM|^HELIX|^SHEET/);
}

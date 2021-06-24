use strict;
use warnings;

print "Enter the PDB filename: \n";
my $filename = <STDIN>;
chomp $filename;
open(PDB, "<", $filename) if (-e $filename) or die $!;
my $atom = ""; my $hetatom = ""; my $helix = ""; my $sheet = "";
while(<PDB>)
{
	if($_ =~ m/^ATOM/) { chomp $_; $atom .= $_."\n"; }
	elsif ($_ =~ m/^HETATM/) { chomp $_; $hetatom .= $_. "\n"; }
	elsif ($_ =~ m/^HELIX/) { chomp $_; $helix .= $_. "\n"; }
	elsif ($_ =~ m/^SHEET/) { chomp $_; $sheet .= $_. "\n"; }
}
print "The ATOM Part is : \n".$atom."\n\n"."The HETATM Part is : \n".$hetatom."\n\n"."The HELIX Part is : \n".$helix."\n\n"."The SHEET Part is : \n".$sheet;

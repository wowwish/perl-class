#!"E:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI qw(:standard);

print "Content-type: text/html\r\n\r\n";

my $id = param("id");
my $pname = param("pname");
my $pfunc = param("pfunc");
my $org = param("org");
my $seq = uc(param("seq"));
my $seq2 = $seq;
$seq2 =~ s/\n//gs;
$seq2 =~ s/\s//gs;

print "Accession ID:			".$id."</br>";
print "Protein Name:			".$pname."</br>";
print "Protein Function:		".$pfunc."</br>";
print "Protein Length:			".length($seq2)."</br>";
print "Organism:				".$org."</br>";
print "Sequence:</br>			".$seq."</br>";


#!"E:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI qw(:standard);

print "Content-type: text/html\r\n\r\n";
my $seq = uc(param("seq"));
print "Given Sequence : "."</br>".$seq."</br>";
if ($seq =~ m/[^ATGC\s]/) { print "Invalid Character in Sequence. Please paste only the sequence without any Headers"; }
else 
{
	$seq =~ s/T/U/g;
	my $seq2 = $seq;
	$seq2 =~ s/\s//gs;
	$seq2 =~ s/\n//gs;
	print "</br></br>"."Length : ".length($seq2)."</br>";
	print "RNA Sequence : "."</br>".$seq."</br>";
}









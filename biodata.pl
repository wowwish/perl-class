#!"E:\xampp\perl\bin\perl.exe"
use strict;
use warnings;
use CGI qw(:standard);

print "Content-type: text/html\r\n\r\n";

my $fn = param("fname");
my $ln = param("lname");
my $age = param("age");
my $phone = param("phone");
my $city = param("city");
my $state = param("state");
my @res_int = param("sub");
my $qual = param("qual");

print "First Name:			".$fn."</br>";
print "Last Name:			".$ln."</br>";
print "Age:					".$age."</br>";
print "Phone No:			".$phone."</br>";
print "City:				".$city."</br>";
print "State:				".$state."</br>";
print "Qualification:		".$qual."</br>";
print "Research Interests:	";
foreach (@res_int) { print $_." "; }
print "</br>";

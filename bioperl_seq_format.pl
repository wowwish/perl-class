use strict;
use warnings;
use Bio::SeqIO;

if ($#ARGV < 3 or $#ARGV > 3) { die "Usage : perl fasta2genbank.pl <infile> <infile_format> <outfile> <outfile_format>"; }
my $infile = shift;
my $in_format = shift;
my $outfile = shift;
my $out_format = shift;
my ($seqin, $seqout);

if (!($infile =~ m/.fasta$|.fa$|.aa$|.nt$|.fast$|.fsa$|.seq$/)) { die "Wrong file extension. File should end wiith \.fasta or \.fa! "; }

eval
{
$seqin = Bio::SeqIO->new( -format => $in_format, -file => "$infile" );
$seqout = Bio::SeqIO->new( -format => $out_format, -file => ">$outfile");
};

if ($@) { print "Error Occured in opening files!\n"; print "Error : $@"; exit(-1); }

while(my $inseq = $seqin->next_seq()) { $seqout->write_seq($inseq); }
print "Coversion Successful!";

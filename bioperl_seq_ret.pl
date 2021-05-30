use strict;
use warnings;
use Bio::DB::GenBank;
use Bio::DB::SwissProt;
use Bio::DB::GenPept;
use Bio::DB::EMBL;
use Bio::DB::EntrezGene;
use Bio::DB::RefSeq;
use Switch;

if (scalar(@ARGV) < 2 or scalar(@ARGV) > 2) { die "Usage : perl bioperl_seq_ret.pl <database : genbank | swissprot | genpept | embl | entrez | refseq> <accession_id>"; }

my $db = $ARGV[0];
my $accession = $ARGV[1];
my $db_obj;
switch($db)
{
	case 'genbank' { $db_obj = Bio::DB::GenBank->new(); }
	case 'swissprot' { $db_obj = Bio::DB::SwissProt->new(); }
	case 'genpept' { $db_obj = Bio::DB::GenPept->new(); }
	case 'embl' { $db_obj = Bio::DB::EMBL->new(); }
	case 'entrez' { $db_obj = Bio::DB::EntrezGene->new(); }
	case 'refseq' { $db_obj = Bio::DB::RefSeq->new(); }
	else { die "Wrong database choice!\nUsage : perl bioperl_seq_ret.pl <database : genbank | swissprot | genpept | embl | entrez | refseq> <accession_id>"; }
}

my $seq_obj = $db_obj->get_Seq_by_acc($accession);
if (!$seq_obj) { die "Your Accession ID and Database donot match!"; }
print "SEQUENCE : \n".uc($seq_obj->seq);
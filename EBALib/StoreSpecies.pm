# $Id$ Store Species
# Perl module for EBA EBALib::StoreSpecies;
# Author: Jitendra Narayan <jnlab.igib@gmail.com>, Denis Larkin <dmlarkin@gmail.com>
# Maintainer: Pranjal Pruthi <mail@pranjal.work>
# Copyright (c) 2015 by Jitendra. All rights reserved.
# You may distribute this module under the same terms as Perl itself

##-------------------------------------------------------------------------##
## POD documentation - main docs before the code
##-------------------------------------------------------------------------##

=head1 NAME

EBALib::StoreSpecies  - DESCRIPTION of Object

=head1 SYNOPSIS

Give standard usage here

=head1 DESCRIPTION

Describe the object here

=cut

=head1 CONTACT

Jitendra Narayan <jnlab.igib@gmail.com>
Denis Larkin <dmlarkin@gmail.com>
Pranjal Pruthi <mail@pranjal.work>

=head1 APPENDIX

The rest of the documentation details each of the object methods.

=cut

##-------------------------------------------------------------------------##
## Let the code begin...
##-------------------------------------------------------------------------##

package EBALib::StoreSpecies;

use strict;
use warnings;
#use Term::ANSIColor;
use Exporter;



sub storeSpecies {
my ($path,$fileName)=@_;

	my $sps_path = EBALib::CommonSubs::outpath("species.sps");
	if (-e $sps_path) { #print "\nFile species.sps exists.\n";  
		unlink ($sps_path); 
		#print "\t-- -  File species.sps deleted.\n";
	} 

	my @new_file=split(/_/, $fileName);  ## File is expected to be sepeared by underscore !!
	if ($new_file[0] ne "")  {
		my $InFileName="$path/$fileName";
		my $OutFileName=EBALib::CommonSubs::outpath("species.sps");
        	storeInfo ( $path, $InFileName,$OutFileName, $new_file[0]); 
	}	
}

sub storeInfo {

my ($path, $InFile, $OutFile, $name)=@_;
my (@array, @information, %scaffData, @name);

open INFILE,  $InFile or die EBALib::Messages::failOp($InFile);
open OUTFILE, ">>" , $OutFile or die EBALib::Messages::failOp($OutFile);

$|++;
$/ = "\n";

while (<INFILE>) {
	my $line=lc($_); chomp $line;
	if ($line =~ /^\s*#/) { next; }
	$line=EBALib::CommonSubs::trim($line);
	my @tmpLine=split /\t/, $line;
	push (@information, $tmpLine[9]);  ## the scaffolds information or genome information
	push (@name, $tmpLine[8]); 
	
}
close INFILE or die EBALib::Messages::failCl("$InFile");

my @info=EBALib::CommonSubs::uniq(@information);
@name=EBALib::CommonSubs::uniq(@name); 
s{^\s+|\s+$}{}g foreach @info;
s{^\s+|\s+$}{}g foreach @name;

if($#info >= 1) { EBALib::Messages::multiHitprint($InFile); }
else { print OUTFILE "$name[0]\t$info[0]\n"; }

undef @information; undef @name;
close OUTFILE or die EBALib::Messages::failCl("$OutFile");
}  # subrutine ends here 



1;

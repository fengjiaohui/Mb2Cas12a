#!/usr/bin/env perl

use strict;
use warnings;

open VCF,"$ARGV[0]" or die " can not open the file!\n";
while(<VCF>){
    chomp;
    if ( /^#/ ){
        print "$_\n";
    }else{
        my @arr = split /\t/;
        my $size = @arr;
        my @WT = split /:/,$arr[9];
        my @M237 = split /:/,$arr[10];
        my @PC = split /:/,$arr[11];
        my @NC = split /:/,$arr[12];
        next if ( $WT[0] eq $M237[0] || $NC[0] eq $M237[0] || $PC[0] eq $M237[0]);
        next if ( $M237[0] eq "0/0" );
        next if ( $M237[0] eq "0|0" );
        print "$_\n";
    }
}

close VCF;


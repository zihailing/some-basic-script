#!/usr/bin/perl
use strict; use warnings; 
use FileHandle;

my ($sta_file) = @ARGV;
die "Please input <sta_file>!" if(@ARGV != 1);

my $in = FileHandle->new("< $sta_file");

my(@array);

while(<$in>){
	chomp;
	if($_ =~ /\w/){
		push @array, $_;
	}
}

for(my $i = 0; $i < @array; $i = $i + 8){
	print "$array[$i]\t$array[$i+2]\t$array[$i+4]\t$array[$i+6]\n$array[$i+1]\t$array[$i+3]\t$array[$i+5]\t$array[$i+7]\n";
}

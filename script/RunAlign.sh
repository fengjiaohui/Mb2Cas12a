#!/bin/bash


index_dir=/public/home/fjhui/data/Resequence/00_ref
fq_dir=/public/home/fjhui/data/Resequence/01_clean

for i in Jin668 M237 Nc PC;

do

bwa mem $index_dir/Jin668 -t 36 -M -R "@RG\tID:${i}\tPL:MGI\tPU:lane\tLB:lib\tSM:${i}"  $fq_dir/$i.1.fq.gz $fq_dir/$i.2.fq.gz | samtools view -@ 10 -bS > $i.bam
samtools stats -@ 36 $i.bam > $i.stats
samtools view -@ 36 -q 30 -F 4 -h -bS $i.bam > $i.high.bam
samtools sort -@ 36 $i.high.bam -o $i.sorted.bam
samtools depth $i.sorted.bam > $i.depth

rm -fr $i.bam $i.high.bam

done



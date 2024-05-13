#!/bin/bash

ref=/public/home/fjhui/data/Resequence/00_ref/Jin668.fasta
bam_dir=/public/home/fjhui/data/Resequence/02_Bam

input=$1


gatk MarkDuplicates -I $bam_dir/$input.sorted.bam -M $input.metrics.txt -O $input.markdup.bam
samtools index $input.markdup.bam
gatk HaplotypeCaller  --emit-ref-confidence GVCF --base-quality-score-threshold 20 --pcr-indel-model NONE -I $input.markdup.bam -R $ref -O $input.gatk.vcf



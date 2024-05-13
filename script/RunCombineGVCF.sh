#!/bin/bash

ref=/public/home/fjhui/data/Resequence/00_ref/Jin668.fasta
gvcf_dir=/public/home/fjhui/data/Resequence/03_GVCF



gatk CombineGVCFs -R  $ref -O Combine.gatk.vcf.gz -V $gvcf_dir/Jin668.gatk.vcf -V $gvcf_dir/PC.gatk.vcf -V $gvcf_dir/Nc.gatk.vcf -V $gvcf_dir/M237.gatk.vcf

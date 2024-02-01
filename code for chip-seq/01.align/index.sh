#!/bin/bash
for i in *.sort.rmdup.bam
do
echo $i
samtools index -@ 1 $i
done 

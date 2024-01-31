# for i in `ls *sort.rmdup.bam`
# do
# 	bamCoverage -b $i -o ${i/sort.rmdup.bam/bw} --normalizeUsingRPKM &
# done


#!/bin/bash

for i in `ls *sort.rmdup.bam`
do
echo $i
bamCoverage -e 170 -bs 10 -p 50 --normalizeUsing RPKM -b $i -o ${i%%.*}.bw 
done 


# for i in `ls *_split/shifted.bam`
# do
# 	bamCoverage -b $i -o ${i/bam/bw} --normalizeUsingRPKM --binSize 1 --numberOfProcessors 5 &
# done


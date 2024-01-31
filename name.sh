#!/bin/bash

F=$1

G=$2

bedtools slop -i ${F} -g ${G} -b 0 | bedClip stdin ${G} ${F}.clip

LC_COLLATE=C sort -k1,1 -k2,2n ${F}.clip > ${F}.sort.clip

bedGraphToBigWig ${F}.sort.clip ${G} ${F/bdg/bw}

#bedGraphToBigWig KAP1_pair_logLR_filt0.bdg.sort.clip /mnt/14Tdisk/Projects/weikun/hic/ref/mm10.chrom.sizes KAP1_pair_logLR_filt0.bw
rm -f ${F}.clip ${F}.sort.clip

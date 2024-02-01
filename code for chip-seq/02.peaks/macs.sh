macs2 callpeak -t ../align/F1.sort.rmdup.bam -c ../align/F7.sort.rmdup.bam -n WT-smc1_rep1_p0.04  -f BAM -B --nomodel --keep-dup all -p 0.04  -g mm >&peak.log &
macs2 callpeak -t ../align/F2.sort.rmdup.bam -c ../align/F7.sort.rmdup.bam -n WT-smc1_rep2_p0.04  -f BAM -B --nomodel --keep-dup all -p 0.04  -g mm >&peak.log &
macs2 callpeak -t ../align/F3.sort.rmdup.bam -c ../align/F8.sort.rmdup.bam -n KO-smc1_rep1_p0.04 -f BAM -B --nomodel --keep-dup all -p 0.04  -g mm >&peak.log &
macs2 callpeak -t ../align/F4.sort.rmdup.bam -c ../align/F8.sort.rmdup.bam -n KO-smc1_rep2_p0.04 -f BAM -B --nomodel --keep-dup all -p 0.04  -g mm >&peak.log &
# macs2 callpeak -t ../align/F5.sort.rmdup.bam -c ../align/F7.sort.rmdup.bam -n WT-H3K36ME3_p0.05  -f BAM -B --nomodel --keep-dup all -p 0.03  -g mm >&peak.log &
# macs2 callpeak -t ../align/F6.sort.rmdup.bam -c ../align/F8.sort.rmdup.bam -n KO-H3K36ME3_p0.05 -f BAM -B --nomodel --keep-dup all -p 0.03  -g mm >&peak.log &

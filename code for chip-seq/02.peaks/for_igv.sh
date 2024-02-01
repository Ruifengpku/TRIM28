#macs2 bdgcmp -t KAP1_pair_treat_pileup.bdg -c KAP1_pair_control_lambda.bdg -o KAP1_pair_FE.bdg -m FE

# macs2 bdgcmp -t  WT-smc1_rep1_p0.05_treat_pileup.bdg -c WT-smc1_rep1_p0.05_control_lambda.bdg -o WT-smc1_rep1_logLR.bdg -m logLR -p 0.00001 &
# macs2 bdgcmp -t  WT-smc1_rep2_p0.05_treat_pileup.bdg -c WT-smc1_rep2_p0.05_control_lambda.bdg -o WT-smc2_rep1_logLR.bdg -m logLR -p 0.00001 &
# macs2 bdgcmp -t  KO-smc1_rep1_p0.05_treat_pileup.bdg -c KO-smc1_rep1_p0.05_control_lambda.bdg -o KO-smc1_rep1_logLR.bdg -m logLR -p 0.00001 &
# macs2 bdgcmp -t  KO-smc1_rep2_p0.05_treat_pileup.bdg -c KO-smc1_rep2_p0.05_control_lambda.bdg -o KO-smc1_rep2_logLR.bdg -m logLR -p 0.00001 &
# macs2 bdgcmp -t  WT-H3K36ME3_p0.05_treat_pileup.bdg -c WT-H3K36ME3_p0.05_control_lambda.bdg -o WT-H3K36ME3_logLR.bdg -m logLR -p 0.00001 &
# macs2 bdgcmp -t  KO-H3K36ME3_p0.05_treat_pileup.bdg -c KO-H3K36ME3_p0.05_control_lambda.bdg -o KO-H3K36ME3_logLR.bdg -m logLR -p 0.00001 &


./name.sh WT-smc1_rep1_logLR.bdg  /mnt/14Tdisk/Projects/weikun/hic/ref/mm10.chrom.sizes &
./name.sh WT-smc2_rep1_logLR.bdg  /mnt/14Tdisk/Projects/weikun/hic/ref/mm10.chrom.sizes &
./name.sh KO-smc1_rep1_logLR.bdg  /mnt/14Tdisk/Projects/weikun/hic/ref/mm10.chrom.sizes &
./name.sh KO-smc1_rep2_logLR.bdg  /mnt/14Tdisk/Projects/weikun/hic/ref/mm10.chrom.sizes &
./name.sh WT-H3K36ME3_logLR.bdg  /mnt/14Tdisk/Projects/weikun/hic/ref/mm10.chrom.sizes &
./name.sh KO-H3K36ME3_logLR.bdg  /mnt/14Tdisk/Projects/weikun/hic/ref/mm10.chrom.sizes &






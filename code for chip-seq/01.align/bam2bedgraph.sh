for i in `ls *sort.rmdup.bam`
do
	bamCoverage --outFileFormat bedgraph -b $i -o ${i/.bam/.bedgraph} --normalizeUsing RPKM --binSize 100 &
done

# --outFileFormat

# for i in `ls *.bam`
# do
# 	bamCoverage -b $i -o ${i/.bam/bw} --normalizeUsingRPKM &
# done
# for i in `ls *_split/shifted.bam`
# do
# 	bamCoverage -b $i -o ${i/bam/bw} --normalizeUsingRPKM --binSize 1 --numberOfProcessors 5 &
# done


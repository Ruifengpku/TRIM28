ref=/mnt/14Tdisk/Projects/weikun/hic/ref/bowtie2_index/mm10
#picard=/home/zhangc/tools/picard-tools-1.119/
picard=/home/ruifeng/tools/picard-tools-1.118/

for i in `ls ../Cleandata/*R1.fq.gz`
do
{
	b=`basename  $i`
	sample=`echo $b | cut -f 1 -d '_'`
	bowtie2 -p 10 -t -q -N 1 -L 25 -X 2000 --no-mixed --no-discordant -x $ref -1 $i -2 ${i/_R1/_R2} -S $sample".sam" > $sample".bowtie2.log"
	
	samtools view -b -h -o $sample".bam" -q 1 -@ 60 $sample".sam"

	samtools sort -m 2G -@ 60 -o  $sample".sort.bam" $sample".bam"

	java -Xms10g -Xmx10g -XX:ParallelGCThreads=60  -jar $picard/MarkDuplicates.jar TMP_DIR=./ INPUT=$sample".sort.bam" 	\
		OUTPUT=$sample".sort.rmdup.bam" METRICS_FILE=$sample".rmdup.metrics"	\
		VALIDATION_STRINGENCY=SILENT ASSUME_SORTED=true REMOVE_DUPLICATES=true MAX_RECORDS_IN_RAM=50000000

}&
done





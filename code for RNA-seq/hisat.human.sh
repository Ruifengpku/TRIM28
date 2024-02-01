for i in `ls ../data/m1_R1.fq.gz`
do
{
	r1=$i
	r2=${i/R1/R2}
	name=`basename $i`
	name=${name/_1.fastq.gz/}
	echo $name
	# hisat2 -X 600 --rg-id $name --rg $name \
	# --known-splicesite-infile /mnt/14Tdisk/reference/Homo_sapiens/Ensembl/GRCh37/hisat_index/gencode.annotation.for.hisat2.ss	\
	# --novel-splicesite-outfile $name".novel.splicesite"	\
	# -p 65 --reorder	\
	# -x /mnt/14Tdisk/reference/Homo_sapiens/Ensembl/GRCh37/hisat_index/humanGencodeIndex -1 $r1 -2 $r2 -S $name".sam" 
	samtools sort -@ 65 -m 5G -o $name".bam" $name".sam"
}&
done

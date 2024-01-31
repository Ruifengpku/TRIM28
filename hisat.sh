for i in `ls ../clean/*_1.fq.gz`
do
{
	r1=$i
	r2=${i/_1./_2.}
	name=`basename $i`
	name=${name/_1.fq.gz/}
	echo $name
	hisat2 -X 600 --rg-id $name --rg $name \
	--known-splicesite-infile /mnt/14Tdisk/reference_zhangc/fasta/gencode.vM12.annotation.spliceSite	\
	--novel-splicesite-outfile $name".novel.splicesite"	\
	-p 25 --reorder	\
	-x /mnt/14Tdisk/reference_zhangc/fasta/GRCm38.primary_assembly.genome -1 $r1 -2 $r2 -S $name".sam" 
	samtools sort -@ 2 -m 2G -o $name".bam" $name".sam"
}&
done

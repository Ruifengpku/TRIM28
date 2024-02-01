for i in `ls ../data/*_R1.fastq.gz`
do
{
	R1=$i
	R2=${i/_R1./_R2.}
	name=`basename $i`
	name=${name/_combined_R1.fastq.gz/}
	R1O=$name".R1.fq"
	R2O=$name".R2.fq"
	cutadapt -a GATCGGAAGAGCACACGTCTGAACTCCAGTCAC -A AGATCGGAAGAGCGTCGTGTAGGGAAA	\
		-m 30 -q 15 -o $R1O -p $R2O $R1 $R2 

}&
done






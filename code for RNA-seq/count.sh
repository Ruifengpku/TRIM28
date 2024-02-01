for i in `ls ../mapping/MEF-P[147].bam`
do
{
	nm=`basename $i`
	htseq-count -f bam -r pos -s reverse -i gene_name $i /lustre/user/liclab/zhangc/Taolab/guan/rna-seq/reference/fasta/gencode.vM12.annotation.gtf > ${nm/.bam/.counts}
}&
done

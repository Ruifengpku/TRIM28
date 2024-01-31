gtf=/mnt/14Tdisk/reference_zhangc/fasta/gencode.vM12.annotation.gtf
#gtf=/lustre/user/liclab/zhangc/Taolab/guan/rna-seq/reference/lncRNA_proteinCoding_sort.gtf
#gtf=/mnt/14Tdisk/reference_zhangc/protein_coding.gtf

for i in `ls ../hisat/*.bam`
do
{
    name=`basename $i`
    name=${name/.bam/}
	stringtie -e -B -p 10 -G $gtf -o $name".gtf" $i
}&
done



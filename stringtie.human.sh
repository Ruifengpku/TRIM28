gtf=/mnt/14Tdisk/reference/Homo_sapiens/Ensembl/GRCh37/hisat_index/genes.gtf
#gtf=/lustre/user/liclab/zhangc/Taolab/guan/rna-seq/reference/lncRNA_proteinCoding_sort.gtf
#gtf=/mnt/14Tdisk/reference_zhangc/protein_coding.gtf

for i in `ls ../hisat_r1/*.bam`
do
{
    name=`basename $i`
    name=${name/.bam/}
	stringtie -e -B -p 20 -G $gtf -o $name".gtf" $i
}&
done



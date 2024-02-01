for i in `ls *.bed`
do
{
	findMotifsGenome.pl $i hg19 ${i/.bed/}"_motif" -p 5 -preparse
}&
done



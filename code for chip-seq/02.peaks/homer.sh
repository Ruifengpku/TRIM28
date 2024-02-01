#findMotifsGenome.pl KOUP_homer.tmp mm10 motif_KOUP/ -size -300,100  -len 8,10,12
for i in `ls IRF8_p0.05_peaks.narrowPeak`
do
{
	findMotifsGenome.pl $i mm10 ${i/.narrowPeak/}"distal_motif_unmark" -p 60 -preparse -size -300,100  -len 8,10,12
}&
done

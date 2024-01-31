
### merge peaks
cat ../peaks/ATAC-CD4A_peaks.bed  ../peaks/ATAC-CD8B_peaks.bed  ../peaks/ATAC-CD8C_peaks.bed  ../peaks/G4B_peaks.bed  ../peaks/G4D_peaks.bed  ../peaks/G8A_peaks.bed  ../peaks/G8C_peaks.bed | sort -k1,1 -k2,2n - | mergeBed -i - > merged_peaks.bed

### get reads per peak
multiBamCov -bams ../align/ATAC-CD4A.sort.rmdup.bam  ../align/ATAC-CD8B.sort.rmdup.bam  ../align/ATAC-CD8C.sort.rmdup.bam  ../align/G4B.sort.rmdup.bam  ../align/G4D.sort.rmdup.bam  ../align/G8A.sort.rmdup.bam  ../align/G8C.sort.rmdup.bam  -bed merged_peaks.bed > merged_peaks.reads.bed

awk '{print $1":"$2"_"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9}' merged_peaks.reads.bed > merged_peaks.reads_reform.bed


multiBamCov -bams ../align/ATAC-CD4A.sort.rmdup.bam  ../align/ATAC-CD8B.sort.rmdup.bam > merged_peaks.reads.bed


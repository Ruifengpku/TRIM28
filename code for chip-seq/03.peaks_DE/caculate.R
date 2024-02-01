pe = read.table("merged_peaks.reads.bed")
colnames(pe) = c("chr","start","end","CD4A_before","CD8B_before",
                 "CD8C_before","CD4B_after","CD4D_after","CD8A_after","CD8C_after")
pe2 = pe
pe2[,4:10] = log2(pe[,4:10])

library(preprocessCore)
pe2[,4:10] = normalize.quantiles(as.matrix(pe[,4:10]))
pe_nor = log2(pe2[,4:10])
pe2[,4:10] = pe_nor
par(oma=c(4,3,2,1))
boxplot(pe_nor,col = c("steelblue","steelblue","steelblue","hotpink","hotpink","hotpink","hotpink"),las = 2,ylab = "Score of Peaks")                             
                                 
n <- 1000
exp = pe_nor
rownames(exp) = 1:48846
topSD <- apply(exp, 1, var)
topSD <- sort(topSD, decreasing = TRUE)[1:n]
#pdf(file = "heatmap.1000.148.pdf",width = 70,height = 25)
pheatmap(as.matrix(exp[names(topSD),]),main = "heatmap",cluster_rows = T, cluster_cols = T,fontsize_row = 2,
         #         annotation_col = annotation_row,
         border_color = NA,color = colorRampPalette(c( "black","white","orange"))(50))
#dev.off()              

result = array(NA,dim = c(dim(exp)[1],5))
colnames(exp)
result[,1] = (exp[,"CD4B_after"] + exp[,"CD4D_after"])/(2*exp[,"CD4A_before"])
result[,2] = abs((exp[,"CD4B_after"] + exp[,"CD4D_after"])/2-exp[,"CD4A_before"])
result[,3] = (exp[,"CD8A_after"] + exp[,"CD8C_after"])/(exp[,"CD8B_before"] + exp[,"CD8C_before"])
result[,4] = abs((exp[,"CD8A_after"] + exp[,"CD8C_after"]) - (exp[,"CD8B_before"] + exp[,"CD8C_before"]))
result[,5] = apply(exp, 1, var)

rr = cbind(pe2,result)
write.table(rr,file = "result.bed",col.names = F,row.names = F,quote = F,sep = "\t")
quantile(result[,5])


#############CD4CD8比较

pe = read.table("merged_peaks.reads.bed")
colnames(pe) = c("chr","start","end","CD4A_before","CD8B_before",
                 "CD8C_before","CD4B_after","CD4D_after","CD8A_after","CD8C_after")
pe2 = pe
pe2[,4:10] = log2(pe[,4:10])

library(preprocessCore)
pe2[,4:10] = normalize.quantiles(as.matrix(pe[,4:10]))
pe_nor = log2(pe2[,4:10])
pe2[,4:10] = pe_nor
par(oma=c(4,3,2,1))
boxplot(pe_nor,col = c("steelblue","steelblue","steelblue","hotpink","hotpink","hotpink","hotpink"),las = 2,ylab = "Score of Peaks")                             

n <- 1000
exp = pe_nor
rownames(exp) = 1:48846
topSD <- apply(exp, 1, var)
topSD <- sort(topSD, decreasing = TRUE)[1:n]
#pdf(file = "heatmap.1000.148.pdf",width = 70,height = 25)
pheatmap(as.matrix(exp[names(topSD),]),main = "heatmap",cluster_rows = T, cluster_cols = T,fontsize_row = 2,
         #         annotation_col = annotation_row,
         border_color = NA,color = colorRampPalette(c( "black","white","orange"))(50))
#dev.off()              

result = array(NA,dim = c(dim(exp)[1],3))
colnames(exp)
result[,1] = (exp[,"CD4B_after"] + exp[,"CD4D_after"])/(exp[,"CD8B_before"] + exp[,"CD8C_before"])
result[,2] = abs((exp[,"CD4B_after"] + exp[,"CD4D_after"])-(exp[,"CD8B_before"] + exp[,"CD8C_before"]))
result[,3] = apply(exp, 1, var)

rr = cbind(pe2,result)

up = which(result[,1]>1.6 & result[,2] >3 & result[,3]>1)
down = which(result[,1]<0.7 & result[,2] >3 & result[,3]>1)

write.table(rr[down,],file = "result——cd8up.bed",col.names = F,row.names = F,quote = F,sep = "\t")
quantile(result[,3])


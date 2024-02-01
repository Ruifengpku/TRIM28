setwd("/mnt/14Tdisk/Projects/weikun/chip/smc1_cuttag/merge/peaks")

library(DESeq2)
database <- as.matrix(read.csv("merged_peaks.reads_reform.bed",sep = "\t",row.names = 1,header = F))
colnames(database)
database = database[,1:4]
boxplot(log2(database+1))
#condition <- factor(c("pro_cl13","pro_cl13","pro_cl13","pro_cl13","ter_cl13","ter_cl13","ter_cl13","ter_cl13"))
condition <- factor(c("WT","WT","KO","KO"))
coldata <- data.frame(row.names = colnames(database), condition)
countData <- database[, rownames(coldata)]
dds <- DESeqDataSetFromMatrix(countData = countData, colData = coldata, design = ~ condition)
dds <- DESeq(dds)

count = counts(dds, normalized=T)

boxplot(log2(count+1))


res <- results(dds)
resordered <- res[order(res$padj),]
summary(res)
res_data = cbind(count,as.data.frame(res))
write.csv(res_data,file="results_WT_KO.csv")






###火山图
colnames(res_data)
res_data_regulate = cbind(res_data,"No")
res_data_regulate[,11] = as.character(res_data_regulate[,11])
res_data_regulate[which(res_data_regulate[,"pvalue"] < 0.01 & res_data_regulate[,"log2FoldChange"] > 0.58),11] =  "Up"
res_data_regulate[which(res_data_regulate[,"pvalue"] < 0.01 & res_data_regulate[,"log2FoldChange"] < -0.58),11] =  "Down"
table(res_data_regulate[,11])


res_hst = cbind(as.numeric(-log10(res_data_regulate[,"pvalue"])),as.numeric(res_data_regulate[,"log2FoldChange"]),as.character(res_data_regulate[,11]))

colnames(res_hst) = c("-log10FDR","log2FC","Regulate")
library(ggplot2)
temp1 = as.data.frame(res_hst)
head(temp1)
temp1[,1] = as.numeric(as.character(temp1[,1]))
temp1[,2] = as.numeric(as.character(temp1[,2]))
temp1$Regulate = factor(temp1$Regulate,levels = c("Up","Down","No"),ordered = T)


temp3 = temp1
temp1[,1] = temp1[,1]*2
temp3[,3]= as.character(temp3[,3])

temp3[which(temp3[,3] == "Up"),3] = "red"
temp3[which(temp3[,3] == "Down"),3] = "blue"
temp3[which(temp3[,3] == "No"),3] = "grey"

P_valcano = ggplot(temp1,aes(x=temp1$log2FC,y=temp1[,"-log10FDR"])) + 
  geom_point(shape = 21,color = "black", fill = temp3$Regulate,size = 1,alpha = 1/2)+
  #scale_color_manual(values = c("Up" = "Red","Down" = "Blue","No" = "grey")) +
  labs(x = "log2FoldChange",y = "-log10FDR") +
  #geom_hline(yintercept = -log10(0.05),linetype=4) + 
  #geom_vline(xintercept = c(-1,1),linetype=4)+
   xlim(-5,5)+
   ylim(0,15)+
  #scale_y_continuous(breaks=seq(0,20,by=5)) +
  #scale_x_continuous(breaks=seq(-10,10,by=2)) +
  theme(plot.title = element_text(size=25,face = "bold",vjust = 0.5,hjust = 0.5),
        legend.title = element_blank(),
        legend.text = element_text(size = 15,face = "bold"),
        legend.position = "right",
        legend.key.size = unit(0.8,"cm"),
        #axis.ticks.x = element_blank(),
        axis.line = element_line(colour = "black",
                                 size = 1, linetype = "solid"),
        axis.ticks = element_line(colour = "black", 
                                  size = 1, linetype = "solid"),
        #panel.border = element_rect(colour = "black", fill=NA, size=1),
        panel.border = element_blank(),
        axis.text.x = element_text(size = 15,vjust = 0.5,hjust = 0.5),
        axis.text.y = element_text(size = 15,vjust = 0.5,hjust = 0.5),
        axis.title.x = element_text(size = 15,vjust = 0.5,hjust = 0.5),
        axis.title.y = element_text(size = 15,vjust = 0.5,hjust = 0.5),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        panel.background = element_rect(fill = 'transparent',colour = "black")
  )


P_valcano  



save.image(file = "data.Rdata")
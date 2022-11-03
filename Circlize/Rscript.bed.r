#######################################################################
# 
workdir="/Data2/weigs/5.ForTest/93.circlize"
setwd(workdir)
library(circlize)

#######################################################################
# read files
file1="siNC_IPVSsiNC_input.bed"
file2="si8558_IPVSsi8558_input.bed"

# sample1
bed1=read.table(file1)
bed1=bed1[,c(1,2,3,5,6)]
colnames(bed1)=c("Chromosome","Start","End","Value","Strand")
bed1$Color<-c(rep("orange",length(bed1$Chromosome)))

# sample2
bed2=read.table(file2)
bed2=bed2[,c(1,2,3,5,6)]
colnames(bed2)=c("Chromosome","Start","End","Value","Strand")
bed2$Color<-c(rep("lightblue",length(bed2$Chromosome)))


#######################################################################
# plot
pdf("Allchrom.pdf")
circos.clear() # clear history in last plot
circos.initializeWithIdeogram("cytoBand.txt")

# plot sample1
bed=bed1
circos.trackPlotRegion(factors = bed$Chromosome,track.height = 0.2, bg.border = NA,
                         ylim=c(min(as.numeric( bed$Value )),max(as.numeric( bed$Value ))) )
circos.trackLines(bed$Chromosome, x = (bed$Star+bed$End)/2, y = bed$Value, cex=5, col=as.character(bed$Color),type="h",baseline=0)

# plot sample2
bed=bed2
circos.trackPlotRegion(factors = bed$Chromosome,track.height = 0.2, bg.border = NA,
                         ylim=c(min(as.numeric( bed$Value )),max(as.numeric( bed$Value ))) )
circos.trackLines(bed$Chromosome, x = (bed$Star+bed$End)/2, y = bed$Value, cex=5, col=as.character(bed$Color),type="h",baseline=0)
dev.off()



#######################################################################
# draw only chr1

library(circlize)
# read files only contain chr1, without any chromsome info
file1="siNC_IPVSsiNC_input.bed"
file2="si8558_IPVSsi8558_input.bed"

# sample1
bed1=read.table(file1)
bed1=bed1[,c(1,2,3,5,6)]
colnames(bed1)=c("Chromosome","Start","End","Value","Strand")
bed1=bed1[bed1$Chromosome == "chr1",]
bed1$Color<-c(rep("orange",length(bed1$Chromosome)))

# sample2
bed2=read.table(file2)
bed2=bed2[,c(1,2,3,5,6)]
colnames(bed2)=c("Chromosome","Start","End","Value","Strand")
bed2=bed2[bed2$Chromosome == "chr1",]
bed2$Color<-c(rep("lightblue",length(bed2$Chromosome)))


pdf("chr1.pdf")
circos.clear() # clear history in last plot
circos.par("start.degree" = 120, "gap.after" = 300) # set gap=300 and then remain only 60 degree
circos.initializeWithIdeogram("cytoBand.chr1.txt") # cytoBand contain only chr1 info

# plot sample1
bed=bed1
circos.trackPlotRegion(factors = bed$Chromosome,track.height = 0.2, bg.border = NA,
                        ylim=c(min(as.numeric( bed$Value )),max(as.numeric( bed$Value ))))
circos.trackLines(bed$Chromosome, x = (bed$Star+bed$End)/2, y = bed$Value, cex=5, col=as.character(bed$Color),type="h",baseline=0)

# plot sample2
bed=bed2
circos.trackPlotRegion(factors = bed$Chromosome,track.height = 0.2, bg.border = NA,
                        ylim=c(min(as.numeric( bed$Value )),max(as.numeric( bed$Value ))))
circos.trackLines(bed$Chromosome, x = (bed$Star+bed$End)/2, y = bed$Value, cex=5, col=as.character(bed$Color),type="h",baseline=0)

dev.off()




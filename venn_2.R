venn_2<-function(list1, list2){
	list1_name<-list1
	list2_name<-list2
	as.character(read.table(file=list1_name,header=F,fill=T,quote="")$V1)->list1
	as.vector(rownames(read.table(file=list2_name,row.names=1,header=T,fill=T,quote="")))->list2
	library(VennDiagram)
	ddm_num <- venn.diagram(
	  x = list(
	           list1=list1, list2=list2 ),
	  category.names=c(paste(list1_name,""),
					  paste(list2_name,"")),
	  filename = NULL, height = 500, width = 500,
	  euler.d = FALSE, scaled = FALSE,
	  col = "transparent",
	  #lty = "line",
	  lwd = 1,
	  fill = c("green", "red"),
	  alpha = 0.50,
	  margin = 0.1,
	#  label.col = "transparent",
	#  label.col = c("black", "black", "black"),
	#  cex = 2,
	#  fontfamily = "serif",
	  cat.col = c("black", "black"),
	#  cat.col = "transparent",
	#  cat.cex = 2.5,
	#  cat.fontfamily = "serif"
	  cat.default.pos = "text"
	);
	pdf(file=paste0(list1_name,"_",list2_name,".pdf"));
	grid.draw(ddm_num);
	dev.off();
	overlap<-calculate.overlap(x = list(list1_name=list1, list2_name=list2))
	write.table(overlap$a3,file=paste0(list1_name,"_",list2_name,".txt"),quote=F,row.names=F,col.names=F)
}

venn_2("ETT_Col-0_down_list","CD_up")
venn_2("ETT_Col-0_up_list","CD_up")
venn_2("ETT_Col-0_down_list","CD_down")
venn_2("ETT_Col-0_up_list","CD_down")

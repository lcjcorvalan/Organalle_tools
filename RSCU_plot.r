# Leonardo Corvalan
# 05/11/2022
# analise RSCU Sporophila
#pacotes
library(readxl)
library(ggplot2)
library(tidyverse) # Tidyverse to manipulate data
library(patchwork) # Patchwork to arrange plot


# paleta de cores
pallet <-c("0" = '#FF6D6D',
           "1" = '#FFB964',
           "2" = '#FAFF76',
           "3" = '#90FF7A',
           "4" = '#5CF1FF',
           "5" = '#609DFF',
           "6" = '#8771FF',
           "7" = '#FF83FF')

###### Sbo
# carregando dados
rscu_Sbo <- read_xlsx('RSCU_Sbo.xlsx')

#ajustando dados para corres

rscu_Sbo$Col=1
rscu_Sbo[rscu_Sbo==0] <- NA
rscu_Sbo<-rscu_Sbo[complete.cases(rscu_Sbo),]
rscu_Sbo
rscu_Sbo=rscu_Sbo %>% group_by(AA) %>% mutate(Col = lag(cumsum(Col), default = 0)) %>% mutate(Col =as.factor(Col))

#summary
summary(rscu_Sbo)
#plotando bar plot
p0=ggplot(data=rscu_Sbo, aes(x=AA, y=RSCU, fill=Col))+geom_bar(stat='identity')+theme_minimal()+theme(axis.title.x=element_blank(),legend.position="void")+
  theme_minimal()+
  xlab('')+
  theme(axis.title.x=element_blank(),legend.position="void")+labs(tag = "A")+
  scale_fill_manual(values = pallet)


#names
p1=ggplot(data=rscu_Sbo)+geom_tile(aes(x=AA, y=fct_rev(Col),fill=Col),col="white")+geom_text(aes(x=AA, y=Col,label=Codon),col="black") +theme_void()+theme(legend.position="none")+
  scale_fill_manual(values = pallet)

#Combine both plots in a single plot
p=p0/p1

#Set plot size. The ratio here is 7:1. The bar plot is 7 times the height of the tile plot
rscu_Sbo_plot=p+plot_layout(heights = c(7, 2))
rscu_Sbo_plot

tiff("rscu_sbo.tiff", units="in", width=12, height=8, res=300)
rscu_Sbo_plot
dev.off()

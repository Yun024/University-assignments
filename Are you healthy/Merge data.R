###### 패키지 불러오기
rm(list=ls())
# install.packages("rpart")
# install.packages("e1071")
# install.packages("ROCR")
# install.packages("pROC")
library(corrplot)
library(dplyr)
library(plyr)
library(ggplot2)
library(rpart)
library(e1071)
library(ROCR)
library(pROC)

data <- read.csv(choose.files())

###### 데이터 생성 및 통합하기 
a <- "NHIS_OPEN_GJ_"
b <- 2002:2017
c <- ".csv"
d <- paste(a,b,c,sep="")
data <- data.frame() # 02~06
data1 <- data.frame() # 07
data2 <- data.frame() # 08
data3 <-  data.frame() # 09~12
data4 <- data.frame() # 13~14
data5 <- data.frame() #15
data6 <- data.frame() #16
for(i in 1:6){
  result = 2001+i
  result <- read.csv(d[i])
  data <- rbind(data,result)
  rm(result)
}
data1 <- read.csv(d[7])
data2 <- read.csv(d[8])
for(i in 9:12){
  result = 2001+i
  result <- read.csv(d[i])
  data3 <- rbind(data3,result)
  rm(result)
}
for(i in 13:14){
  result = 2001+i
  result <- read.csv(d[i])
  data4 <- rbind(data4,result)
  rm(result)
}
data5 <- read.csv(d[15])
data6 <- read.csv(d[16])
names(data2) <- names(data3)
aa <- full_join(data3,data2); 
names(data5) <- names(aa) 
names(data6) <- names(aa)
bb <- full_join(data5,data6)
cc <- full_join(aa,bb) # data2,3,5,6
dd <- full_join(data1,data)
gg <- plyr::rename(data4, c("치석유무"="치석","데이터.기준일자"="데이터공개일자"))
uu <- full_join(cc,gg)
all.data <- full_join(uu,dd)
data <- all.data
# rm(aa,bb,cc,dd,gg,uu)
# rm(data,data1,data2,data3,data4,data5,data6)

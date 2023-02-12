### 변수 초기화
rm(list=ls())
###### 패키지 설치 및 불러오기
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("plotly")
library(dplyr)
library(ggplot2)
library(plotly)

### 데이터 불러오기
data <- read.csv(choose.files())


###### 반복문을 통해 2002~2016데이터 불러온 후 통합하기
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
# rm(aa,bb,cc,dd,gg,uu)
# rm(data,data1,data2,data3,data4,data5,data6)


###### 전처리
data <- all.data
data %>% summary()
data %>% head()
### 데이터 선택
data.use <- data %>% select(기준년도,성별코드,연령대코드.5세단위.,시도코드,흡연상태)
### 데이터 분할 -1 
data.use1 <- data.use %>% filter(`기준년도`== 2002)
for (i in 2003:2013){
  data.use3 <- data.use %>% filter(`기준년도`== i)
  data.use1 <- rbind(data.use1,data.use3)
}
### 데이터 분할 -2
data.use2 <- data.use %>% filter(`기준년도`== 2014)
for (i in 2015:2017){
  data.use3 <- data.use %>% filter(`기준년도`== i)
  data.use2 <- rbind(data.use2,data.use3)
}

###시도코드가 잘못 입력되어 있는 데이터 
data.use2$연령대[data.use2$연령대코드.5세단위.<7]="20대"
data.use2$연령대[data.use2$연령대코드.5세단위.>=7&data.use2$연령대코드.5세단위.<9]="30대"
data.use2$연령대[data.use2$연령대코드.5세단위.>=9&data.use2$연령대코드.5세단위.<11]="40대"
data.use2$연령대[data.use2$연령대코드.5세단위.>=11&data.use2$연령대코드.5세단위.<13]="50대"
data.use2$연령대[data.use2$연령대코드.5세단위.>=13&data.use2$연령대코드.5세단위.<15]="60대"
data.use2$연령대[data.use2$연령대코드.5세단위.>=15&data.use2$연령대코드.5세단위.<17]="70대"
data.use2$연령대[data.use2$연령대코드.5세단위.>=17&data.use2$연령대코드.5세단위.<19]="80대이상"
data.use2$연령대 <- data.use2$연령대 %>% as.factor()
###시도코드가 제대로 입력되어있는 데이터 
data.use1$연령대[data.use1$연령대코드.5세단위.<3]="20대"
data.use1$연령대[data.use1$연령대코드.5세단위.>=3&data.use1$연령대코드.5세단위.<5]="30대"
data.use1$연령대[data.use1$연령대코드.5세단위.>=5&data.use1$연령대코드.5세단위.<7]="40대"
data.use1$연령대[data.use1$연령대코드.5세단위.>=7&data.use1$연령대코드.5세단위.<9]="50대"
data.use1$연령대[data.use1$연령대코드.5세단위.>=9&data.use1$연령대코드.5세단위.<11]="60대"
data.use1$연령대[data.use1$연령대코드.5세단위.>=11&data.use1$연령대코드.5세단위.<13]="70대"
data.use1$연령대[data.use1$연령대코드.5세단위.>=13&data.use1$연령대코드.5세단위.<15]="80대이상"
data.use1$연령대 <- data.use1$연령대 %>% as.factor()
data.use <- rbind(data.use1,data.use2)


###### 최종 전처리 
data.use$기준년도 <-  as.factor(data.use$기준년도) 
data.use$성별코드 <- as.factor(data.use$성별코드)
data.use$연령대코드.5세단위. <- as.factor(data.use$연령대코드.5세단위.) 
data.use$시도코드 <- as.factor(data.use$시도코드)
data.use$흡연상태 <- as.factor(data.use$흡연상태)
data.use %>% summary()
data.use %>% head()
data.use$연령대 %>% summary()

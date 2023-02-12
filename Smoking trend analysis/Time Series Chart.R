###### 전체 흡연자 데이터 
## 흡연자 테이블
zz <- vector()
for(i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) 
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  zz <- c(zz,bb)
}

### 흡연비율
ff <- vector()
for (i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i)
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  cc <- bb[1]/(bb[1]+bb[2]+bb[3])
  dd <- bb[2]/(bb[1]+bb[2]+bb[3])
  ee <- bb[3]/(bb[1]+bb[2]+bb[3])
  ff <- c(ff,cc,dd,ee)
}

### 기준년도별 흡연자 데이터프레임 
`기준년도` <- rep(2002:2017,each=3)
`흡연상태` <- rep(1:3,16)
`흡연자` <- zz 
`흡연비율` <- ff  * 100
df <- data.frame(기준년도,흡연상태,흡연자,흡연비율)

### 꺽은선 그래프 
ggp <- ggplot(data=df,aes(x=기준년도,y=흡연비율,group=흡연상태,color=흡연상태)) + geom_line(size=1) +
  geom_point(size=3,shape=19,)	
ggp <- ggp  + scale_x_continuous(breaks=2002:2017) + lims(y=c(0,100)) 
ggp + ggtitle("전체 흡연자 그래프") + 
  theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "darkblue"))

###### 성별에 따른 흡연자 데이터 
### 남자 
zz <- vector()
for(i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`성별코드`==1)
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  zz <- c(zz,bb)
}

### 흡연비율
ff <- vector()
for (i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`성별코드`==1)
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  cc <- bb[1]/(bb[1]+bb[2]+bb[3])
  dd <- bb[2]/(bb[1]+bb[2]+bb[3])
  ee <- bb[3]/(bb[1]+bb[2]+bb[3])
  ff <- c(ff,cc,dd,ee)
}

### 기준년도별 흡연자 데이터프레임 
`기준년도` <- rep(2002:2017,each=3)
`흡연상태` <- rep(1:3,16)
`흡연자` <- zz 
`흡연비율` <- ff  * 100
df <- data.frame(기준년도,흡연상태,흡연자,흡연비율)

### 꺽은선 그래프 
ggp <- ggplot(data=df,aes(x=기준년도,y=흡연비율,group=흡연상태,color=흡연상태)) + geom_line(size=1) +
  geom_point(size=3,shape=19,)	
ggp <- ggp  + scale_x_continuous(breaks=2002:2017) + lims(y=c(0,100)) 
ggp + ggtitle("남성 흡연자 그래프") + theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "darkblue"))

### 여자
zz <- vector()
for(i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`성별코드`==2)
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  zz <- c(zz,bb)
}

### 흡연비율
ff <- vector()
for (i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`성별코드`==2)
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  cc <- bb[1]/(bb[1]+bb[2]+bb[3])
  dd <- bb[2]/(bb[1]+bb[2]+bb[3])
  ee <- bb[3]/(bb[1]+bb[2]+bb[3])
  ff <- c(ff,cc,dd,ee)
}

### 기준년도별 흡연자 데이터프레임 
`기준년도` <- rep(2002:2017,each=3)
`흡연상태` <- rep(1:3,16)
`흡연자` <- zz 
`흡연비율` <- ff  * 100
df <- data.frame(기준년도,흡연상태,흡연자,흡연비율)

### 꺽은선 그래프 
ggp <- ggplot(data=df,aes(x=기준년도,y=흡연비율,group=흡연상태,color=흡연상태)) + geom_line(size=1) +
  geom_point(size=3,shape=19,)	
ggp <- ggp  + scale_x_continuous(breaks=2002:2017) + lims(y=c(0,100)) 
ggp + ggtitle("여성 흡연자 그래프") + theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "darkblue"))

###### 연령에 따른 년도별 흡연자 데이터 ####
### 남성 -- 연령대만 변경하면 됨
zz <- vector()
for(i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`성별코드`==1) %>% filter(`연령대`=="80대이상")
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  zz <- c(zz,bb)
}

### 흡연비율
ff <- vector()
for (i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`성별코드`==1) %>% filter(`연령대`=="80대이상")
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  cc <- bb[1]/(bb[1]+bb[2]+bb[3])
  dd <- bb[2]/(bb[1]+bb[2]+bb[3])
  ee <- bb[3]/(bb[1]+bb[2]+bb[3])
  ff <- c(ff,cc,dd,ee)
}

### 기준년도별 흡연자 데이터프레임 
`기준년도` <- rep(2002:2017,each=3)
`흡연상태` <- rep(1:3,16)
`흡연자` <- zz 
`흡연비율` <- ff  * 100
df <- data.frame(기준년도,흡연상태,흡연자,흡연비율)

### 꺽은선 그래프 
ggp <- ggplot(data=df,aes(x=기준년도,y=흡연비율,group=흡연상태,color=흡연상태)) + geom_line(size=1) +
  geom_point(size=3,shape=19,)	
ggp <- ggp  + scale_x_continuous(breaks=2002:2017) + lims(y=c(0,100)) 
ggp + ggtitle("80대 남성 흡연자 그래프") + theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "darkblue"))

### 여성 
zz <- vector()
for(i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`성별코드`==2) %>% filter(`연령대`=="80대이상")
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  zz <- c(zz,bb)
}

### 흡연비율
ff <- vector()
for (i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`성별코드`==2) %>% filter(`연령대`=="80대이상")
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  cc <- bb[1]/(bb[1]+bb[2]+bb[3])
  dd <- bb[2]/(bb[1]+bb[2]+bb[3])
  ee <- bb[3]/(bb[1]+bb[2]+bb[3])
  ff <- c(ff,cc,dd,ee)
}

### 기준년도별 흡연자 데이터프레임 
`기준년도` <- rep(2002:2017,each=3)
`흡연상태` <- rep(1:3,16)
`흡연자` <- zz 
`흡연비율` <- ff  * 100
df <- data.frame(기준년도,흡연상태,흡연자,흡연비율)

### 꺽은선 그래프 
ggp <-  ggplot(data=df,aes(x=기준년도,y=흡연비율,group=흡연상태,color=흡연상태)) + geom_line(size=1) + geom_point(size=3,shape=19,)	
ggp <- ggp  + scale_x_continuous(breaks=2002:2017) + lims(y=c(0,100)) 
ggp + ggtitle("80대 이상 여성 흡연자 그래프") + theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "darkblue"))

###### 지역에 따른 년도별 흡연자 데이터 ####
### 시코드
zz <- vector()
for(i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`시도코드`==27)
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  zz <- c(zz,bb)
}

### 흡연비율
ff <- vector()
for (i in 2002:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% filter(`시도코드`==27)
  bb <- aa %>% select(`흡연상태`) %>% na.omit() %>% table()
  cc <- bb[1]/(bb[1]+bb[2]+bb[3])
  dd <- bb[2]/(bb[1]+bb[2]+bb[3])
  ee <- bb[3]/(bb[1]+bb[2]+bb[3])
  ff <- c(ff,cc,dd,ee)
}

### 기준년도별 흡연자 데이터프레임 
`기준년도` <- rep(2002:2017,each=3)
`흡연상태` <- rep(1:3,16)
`흡연자` <- zz 
`흡연비율` <- ff  * 100
df <- data.frame(기준년도,흡연상태,흡연자,흡연비율)

### 꺽은선 그래프 
ggp <-  ggplot(data=df,aes(x=기준년도,y=흡연비율,group=흡연상태,color=흡연상태)) + geom_line(size=1) + geom_point(size=3,shape=19,)	
ggp <- ggp  + scale_x_continuous(breaks=2002:2017) + lims(y=c(0,100)) 
ggp + ggtitle("서울특별시 흡연자 그래프") + theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "darkblue"))


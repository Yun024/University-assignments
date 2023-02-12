##### 가입자일련번호 summary 
data.num <- data
data.num$가입자일련번호 <- data.num$가입자일련번호 %>% as.factor()
data.num$가입자일련번호 %>% summary()
data.num %>% filter(`가입자일련번호`==16)
# 가입자일련번호에서 같은 번호는 많지만 모두 다른 데이터임을 알 수 있다. 

###### 년도 정하기 
ff <- vector()
for (i in 2008:2017){
  aa <- data.use %>% filter(`기준년도`==i) %>% select(체중.5Kg.단위.) %>% unlist() %>% na.omit() %>% mean()
  ff <- c(ff,aa)
}
`기준년도` <- rep(2008:2017)
`체중` <- ff
df <- data.frame(기준년도,체중)
ggplot(data=df,aes(x=기준년도,y=체중)) + geom_line()

data %>% names()


###### 필요한 변수 추출
## data <- read.csv(choose.files())
data.use <- data %>% select(-c(기준년도,가입자일련번호,시도코드,시력.좌.,시력.우.,청력.좌.,청력.우.,흡연상태,음주여부,
                                   구강검진.수검여부,치아우식증유무,치석유무,데이터.기준일자,혈청크레아티닌)) %>% na.omit()
data.use %>% names()
data.use %>% summary()

###### BMI변수 생성
data.use$BMI <- (data.use$체중.5Kg.단위./((data.use$신장.5Cm단위.*data.use$신장.5Cm단위.)/10000))

###### 상관관계 
data.cor <- data.use %>% select(-c(성별코드,연령대코드.5세단위.,요단백))
mcor <- cor(data.cor)
round(mcor,2)
cc <- corrplot(mcor,method='shade',diag=F,addCoef.col = "black")
data.use <- data.use %>% select(-c(이완기혈압,X.혈청지오티.AST,체중.5Kg.단위.,LDL콜레스테롤,허리둘레))
data.use %>% names()
data.use %>% summary()

###### 목표변수 생성 
data.use$Target %>% summary()
data.use$Target <- 0
data.use$Target <- ifelse(data.use %>% select(BMI) >25,data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(BMI) <18.5,data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(트리글리세라이드) >200, data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(총콜레스테롤) >240, data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(HDL콜레스테롤) <40,data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(요단백) >=2,data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(식전혈당.공복혈당.) <70,data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(식전혈당.공복혈당.) >125,data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(혈색소) <12, data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(혈색소) >17, data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(감마지티피) >60, data.use$Target+1,data.use$Target+0) 
data.use$Target <- ifelse(data.use %>% select(X.혈청지오티.ALT) >40,data.use$Target+1,data.use$Target+0) 
data.use$Target <- data.use$Target/10
data.use$Target <- ifelse(data.use %>% select(Target) >0.3,1,0)
tb <- data.use$Target %>% table()

###### 변수 factor화 
data.use$성별코드<- data.use$성별코드 %>% factor()
data.use$Target<- data.use$Target %>% factor()
data.use$요단백<- data.use$요단백 %>% factor()
data.use$연령대코드 <- (data.use$연령대코드.5세단위.- 4)
data.use$연령대코드 <- data.use$연령대코드 %>% factor()
data.use <- data.use %>% select(-c(연령대코드.5세단위.))
data.use %>% summary()

###### 오버샘플링
if(T){
  tb <- data.use$Target %>% table()
  tb
  over.n <- tb[1]-tb[2]
  training.over.idx <- sample(1:tb[2], over.n, T)
  training.data.bad <- data.use %>% filter(Target==1)
  data.use <- rbind(data.use, training.data.bad[training.over.idx,])
  data.use$Target %>% table()
}

####### 테스트 데이터와 트레인데이터 나누기
### 트레인 데이터
set.seed(1234)
training.ratio <- 0.5
training.data <- data.use[0,]
data.size <- nrow(data.use) 
training.size <- data.size * training.ratio 
training.idx <- sample(1:data.size, training.size)
data.train <- data.use[training.idx,]
data.train$Target %>% table()
data.train %>% summary()
### 테스트데이터 
data.test <- data.use[-training.idx,]
data.test$Target %>% table()

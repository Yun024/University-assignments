###### 로지스틱회귀분석
res.glm <- glm(Target~.,data=data.train,family=binomial)
res.glm %>% summary()

### AIC기준 변수선택
res.glm.step <- step(res.glm)
res.glm.step %>% summary()

### 정오분류표 작성
pred.glm <- predict(res.glm.step,newdata=data.test,type="response")
pred.glm.class <- ifelse(pred.glm<0.5,0,1)
tb <- table(data.test$Target,pred.glm.class)
tb 
(420690+431292)/(420690+43746+33734+431292)


####### 의사결정나무 
c <- rpart(Target~.,data=data.train)
plot(c,compress=T,margin=0.3)
text(c,cex=1.5)

### 정오분류표 작성
c.pred <- predict(c,newdata=data.test,type="class")
tb <- table(data.test$Target,c.pred)
tb
(426287+422347)/(426287+38149+42679+422347)

###### SVM모델 
res.svm <- svm(Target~.,data=data.train,gamma=0.01,cost=1)
svm.pred <- predict(res.svm,data=data.train)
table(data.train$quality,svm.pred)
### 최적의 gamma와 cost
svm.tune.res <- tune.svm(Target~.,data=data.train,gamma=c(0.01,0.1,1),cost=c(1,10,100))
svm.tune.res %>% summary()
# gamma = 0.1과 cost = 1 
res.svm.t <- svm(Target~.,data=data.train,gamma=0.1,cost=1)
svm.pred.t <- predict(res.svm.t,newdata=data.test)
table(data.test$Target,svm.pred.t)

###### ROC커브 
#로지스틱 회귀 분석
p <- predict(res.glm.step, newdata=data.test, type="response")
pr <- prediction(p, data.test$Target)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf,col="red",print.auc=T)


# 건강검진 지수 개발 프로젝트
## 분석배경 및 필요성 
- 평소 건강에 관심이 많으며 여러 운동에 흥미가 있는 내가 정말 건강한지 의문 발생
- 발생한 의문을 확인하기 위해 '국민건강검진' 데이터를 통해 프로젝트 진행 

## 연구 목표
- 국가통계포털 사이트에서 제공하는 '국민건강검진'데이터를 활용한'국민건강지수'를 개발하여 건강정도 파악

## 프로젝트 기간
- 2019년 11월 1일 ~ 12월 20일
- 개인 프로젝트 : 윤여준
  
## 사용 기술 : [모듈 및 패키지]
`PreProcessing` 
- R : `dplyr` `plyr`
- Excel

`Time Series Chart`
- R : `ggplot2` `corrplot` `ROCR` `rpart` 


## 데이터 설명 
|활용 데이터|형식|행|데이터 소스|
|------|------|------|------|
|국가중점 건강검진정보 데이터|csv|16,000,000건|국가통계포털|

 


## Contents
### 1. Merege data : *[바로가기](https://github.com/Yun024/University_assignments/blob/main/Are%20you%20healthy/Merge%20data.R)*
* paste함수와 for문을 이용해 년도 별 데이터를 불러온 후 rbind로 변수명이 같은 데이터 통합
* 변수명이 같지 않은 데이터 names와 rename함수로 변수명 통일 
* Full_join과 write.csv를 이용해서 통합 데이터 완성 - [16,000,000행, 31열] 
  
### 2. PreProcessing : *[바로가기](https://github.com/Yun024/University_assignments/blob/main/Are%20you%20healthy/Preprocessing.R)*
* 데이터 크기가 방대하여 데이터 분석이 원활하게 진행되지 않음
  <br> => '기준년도 별 평균체중 그래프'를 활용하여 가장 높게 나타난 년도인 2015년을 기준으로 분석 진행
* select함수를 활용하여 타겟 변수에 활용되는 변수 선택
  <br> => 총 31개 변수(수진자 기본정보, 건강검진결과 및 문진정보) 중 건강정도파악에 영향을 주지 않는다고 생각하는 변수 제거
  <br> [시력, 청력, 구강상태, 흡연상태, 음주여부]
* 상관행렬을 그려 상관관계가 높게 나타는 변수 제거
  <br> => [이완기혈압, 혈청지오티, 체중, 콜레스테롤, 허리둘레]
* BMI계산법을 활용한 BMI변수 생성
* 서울대학교병원에서 제공하는 변수 별 정상 참고치를 참고하여 변수 별 통과여부를 활용한 target변수 생성
  <br> => Ex) BMI지수가 18.5미만 25초과에 속하는가 등을 판단하여 4개 항목이상 일치하면 비건강(1), 그 외 건강(0) 부여 
* 오버샘플링 이후 test용 데이터 train용 데이터 분류
* 최종데이터 완성 
<img src="https://github.com/Yun024/University_assignments/assets/52143231/9aa29c81-849f-4288-9d54-bad3b7899acf.png"  width="800" height="400"/>  



### 3. Classification Model : *[바로가기](https://github.com/Yun024/University_assignments/blob/main/Are%20you%20healthy/Classification%20Model.R)*
* 로지스틱 회귀 분석 
<img src="https://github.com/Yun024/University_assignments/assets/52143231/71840022-7caa-4813-876f-20a56a8d4a89.png"  width="350" height="500"/>
<img src="https://github.com/Yun024/University_assignments/assets/52143231/710fb127-7d32-412f-a1aa-4dff46d9bb64.png"  width="350" height="500"/>


* 의사결정나무 
<img src="https://github.com/Yun024/University_assignments/assets/52143231/02308481-b23a-4357-aec8-f050332a4caa.png"  width="400" height="500"/>

* ROC곡선
<img src="https://github.com/Yun024/University_assignments/assets/52143231/15a83227-475b-4f41-bd56-7f796aae9810.png"  width="500" height="300"/>


## 해당 프로젝트로 확인가능한 것과 배운점
- ROC곡선 확인 결과 두 분석 모두 AUC값이 높게 나타났기 때문에 모델이 유의미함
- 이번 데이터의 경우 의사결정나무보다 로지스틱 회귀 분석 기법을 사용하는게 유용함 
- 전처리를 하는 과정이 복잡하여 많은 시간을 투자하고 발생하는 상황에 다양한 시각으로 대처할 필요성을 배움
- 데이터 전처리 과정에 익숙해지기 위해 여러 데이터를 핸들링하며 프로그래밍 능력을 숙달시키기 위한 노력 필요 


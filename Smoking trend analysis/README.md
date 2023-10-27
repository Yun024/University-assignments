# 흡연 정책 유효성 파악 프로젝트 
## 분석배경 및 필요성 
- 길거리를 돌아다니다 보면 아직도 길거리 흡연을 하는 사람들이 보이고 있음
- 간접 흡연을 당하며 흡연 정책이 어떤 것들이 있었고 그 효과가 있었는지에 대한 결과를 알고 싶어서 프로젝트 진행 

## 주요 흡연규제 정책
- 2009년 군대 면세 담배 보급 폐지
- 2015년 담배 소비자가 2000원에서 4500원으로 인상
- 2015년 금연 치료 및 진료비에 대한 금전적 지원
- 2016년 경고 그림 최초 시행
- 2019년 경고 그림 및 주제 변경 이후 수위 강화 

## 연구 목표
- 시간에 따른 년도 별 흡연율 그래프를 이용하여 흡연규제 정책 발의 이후 해당 정책의 실효성 파악

## 프로젝트 기간
- 2019년 11월 1일 ~ 12월 20일
- 개인 프로젝트 : 윤여준
  
  
## 사용 기술 : [모듈 및 패키지]
`PreProcessing` 
- R : [ wordcloud, RColorBrewer, rvest, stringr, dplyr, KoNLP, useSejongDic, reshape, readxl, ggplot2, ggcorrplot ]
- Excel

`Time Series Chart`
- Geo coding 
- QGIS

`Clustering`
- Python : [ matplotlib, sklearn, pandas, numpy, seaborn, os, yellowbrick, plotly, mpl_toolkits ]
- R : [ dplyr ]

## 데이터 설명 
|번호|활용 데이터|형식|행|데이터 소스|
|:------:|------|------|------|------|
|1|대전 시내버스 정류장 데이터|csv|2,807건|공공데이터포털|
|2|대전 시내버스 이용량 데이터|csv|50,449건|교통데이터 DW시스템|
|3|대전 시내버스 배치시간 별 운행 데이터|csv||대전교통정보센터|
|4|대전광역시 취약계층 복지건물 현황 데이터|csv||대전광역시청|
|5|대전 유·초·중·고 400m 버퍼데이터|csv||대전광역시교육청|
|6|대전 미세먼지 발생 및 배출 시설 400m 버퍼데이터|csv|2,830건|공공데이터포털|
|7|대전 구별 및 읍면동 연령별_인구 400m 버퍼데이터|csv|790건|대전광역시청|
|8|대전 지하철 위치정보 400m 버퍼데이터|shp||Google Map|
|9|대전 민원 텍스트 데이터|txt|373건|대전지역 사회문제 은행|


## Contents
### 1. EDA : *[바로가기](https://github.com/Yun024/Smartshelter_project/blob/main/1.Exploratory_Data_Analysis/README.md)*
* 대전 민원 분석(워드클라우드)
* 탐색적 데이터 분석 전 전처리
* 연속형 변수 상관계수 히트맵

### 2. PreProcessing : *[바로가기](https://github.com/Yun024/Smartshelter_project/blob/main/2.PreProcessing/README.md)*
* 정류장 별 승하차객 전처리
* 정류장 위도경도 전처리
* 읍면동 별 거주인구 전처리
* 데이터 병합_최종 전처리

### 3. Clustering : *[바로가기](https://github.com/Yun024/Smartshelter_project/blob/main/3.Clustering/README.md)*
* Kmeans
* DBSCAN
* GMM

## 느낀 점 
- QGIS를 이용하여 시각화하면 맵핑이 편리하며 공간분석에 용이하다는 사실을 배움
- 입지 선정 지수와 같이 주관적인 지표가 들어가면 객관적인 근거가 매우 필요하다는 정보를 얻게 됨
- 정성적인 자료도 중요하지만 정량적 자료가 많을 수록 프로젝트를 뒷받침하는 근거가 강해짐
- 한 가지 분석기법을 여러 프로그래밍언어에서 다룰 수 있도록 다방면으로 공부할 필요성을 느낌

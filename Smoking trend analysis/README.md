# 흡연 정책 유효성 파악 프로젝트 
## 분석배경 및 필요성 
- 길거리를 돌아다니다 보면 아직도 길거리 흡연을 하는 사람들이 보이고 있음
<br>-> 흡연정책에 대한 의문점 발생
- 흡연정책의 종류와 발의 의후 흡연률에 어떠한 영향을 끼치는지 확인하고 싶어 프로젝트 진행

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
- R : `dplyr`
- Excel

`Time Series Chart`
- R : `ggplot2` `plotly`


## 데이터 설명 
|활용 데이터|형식|행|데이터 소스|
|------|------|------|------|
|국가중점 건강검진정보 데이터|csv|16,000,000건|국가통계 포털|
* 총 31개 변수(수진자 기본정보, 건강검진결과 및 문진정보) 중 `기준년도` `성별코드` `연령대코드.5세단위` `흡연상태` 4개변수 선택


## Contents
### 1. PreProcessing : *[바로가기](https://github.com/Yun024/University_assignments/blob/main/Smoking%20trend%20analysis/PreProcessing.R)*
* paste함수와 for문을 이용해 년도 별 데이터를 불러온 후 rbind로 변수명이 같은 데이터 통합
* 변수명이 같지 않은 데이터 names와 rename함수로 변수명 통일
* 연령대코드에 시도코드가 들어가 있는 오류 데이터는 직접 메뉴얼을 보고 올바른 데이터로 변환 
* full_join을 이용하여 최종 데이터 완성
* 흡연상태(1 = 비흡연자, 2= 현재금연, 3= 흡연자)로 분류됨 

### 2. Time Series Chart : *[바로가기](https://github.com/Yun024/University_assignments/blob/main/Smoking%20trend%20analysis/Time%20Series%20Chart.R)*
* 전체 흡연율 시계열 그래프
<img src="https://github.com/Yun024/University_assignments/assets/52143231/55fedd34-600e-4934-b8fc-924d16e11b9f.png"  width="700" height="350"/>


* 성별에 따른 흡연율 시계열 그래프
<img src="https://github.com/Yun024/University_assignments/assets/52143231/5c182940-479a-41d4-af72-1ce69018088b.png"  width="700" height="350"/>
<img src="https://github.com/Yun024/University_assignments/assets/52143231/c4acfaa6-463b-4b6d-9df6-916dd81a0abf.png"  width="700" height="350"/>

※ 그 외 성별에 따른 연령대 별 흡연율 시계열 그래프, 지역별 흡연율 시계열 그래프 등 도출 


## 해당 프로젝트로 확인가능한 것과 배운점
- 담배 소비자가 인상되었던 2015년을 제외한 흡연규제 정책은 흡연율에 큰 영향을 주지 않았음을 확인
- 여성흡연율은 흡연규제 정책과 무관하게 최근년도로 다가갈수록 흡연율이 증가하고 있음
- 매년 데이터의 프리셋이 다를 수도 있으니 직접 핸들링하며 데이터를 이해하는 것이 중요
- 어떠한 데이터가 주어졌을때 당연하다는 것은 없으며 직접 가설을 세우고 검증하는 과정의 중요성을 배우게 됨


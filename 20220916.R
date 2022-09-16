#실습 예제

#- airquality 데이터셋에 대해 다음을 처리하세요
# 1.기온(Temp)이 가장 높은 날은 언제인지 월과 일을 추출
# 2. 6월달에 발생한 가장 강한 바람(wind)의 세기를 추출
# 3. 7월달의 평균기온을 추출
# 4. NA를 제외한 5월의 평균 오존 농도 추출
# 5. 오존 농도가 100을 넘는 날은 며칠인이 추출 [행,열]

data("airquality")                        # 데이터셋 로드

str(airquality)

# 기온이 가장 높은 날 -> 월/일 추출

top_temp <- data.frame(Month = 0, Day = 0)
# 날짜 값을 담아줄 데이터프레임 생성
top_temp$Month <- airquality$Month[ airquality$Temp == max(airquality$Temp, na.rm = T)]
top_temp$Day <- airquality$Day[ airquality$Temp == max(airquality$Temp, na.rm = T)]    # max를 이용하여 temp 열이 max 값인 month와 day를 추출하여 담음


cat(top_temp$Month,"/",top_temp$Day)
# 출력


# 6월달 발생한 가장 강한 바람의 세기 추출
June_strong <- max(airquality$Wind[airquality$Month == 6], na.rm = T) # max를 이용하여 month가 6인 행들 중 wind 열 값이 큰 것을 가져옴

cat(June_strong)


# 7월달의 평균 기온 추출
July_avg_temp <- mean(airquality$Temp[airquality$Month == 7])   # mean을 이용하여 month가 7인 행들의 평균 값

cat(July_avg_temp)


# NA를 제외한 5월의 평균 오존 농도 추출
May_avg_ozone <- mean(airquality$Ozone[airquality$Month == 5], na.rm = T) # mean의 na.rm 속성을 이용하여 na를 모두 제거하고 난 5월의 오존 평균 값

cat(May_avg_ozone)


# 오존 농도가 100을 넘는 날은 며칠인지 추출
ozone_over100 <- length(airquality$Ozone[airquality$Ozone >= 100]) # length를 이용하여 ozone의 값이 100을 넘는 값들의 갯수를 카운트

ozone_over100

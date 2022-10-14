setwd("C:\\bigdataR\\Part-III")
data <- read.csv("C:/bigdataR/Part-III/descriptive.csv", header = T )
head(data)

dim(data) #데이터 개수와 열의 개수확인
length(data) # 열의 개수
length(data$survey) 
str(data)

summary(data)

length(data$gender)
summary(data$gender)

table(data$gender) #성별 빈도수 -> 0과 5 이상치 발견

data <- subset(data,gender == 1|gender == 2)  #성별 남 여만 추출
x <- table(data$gender)
x
barplot(x)

prop.table(x) #비율 계산 : 0 < x < 1 사이의 값

y <- prop.table(x)
round(y * 100, 2 )
data$level

length(data$level)  #학력수준(leve): 서열척도

summary(data$level) 
table(data$level)   #빈도분석

x1 <- table(data$level)
barplot(x1)


survery <- data$survey
survery

summary(survery) #최소 , 최대, 중앙값 , 평균(의미없음)
x1 <- table(survery)
x1

hist(survery)

pie(x1)

summary(data$cost)
data$cost
plot(data$cost)

data <- subset(data, cost >= 2 & cost <= 10)
length(data$cost)

x <- data$cost
mean(x)
median(x)
sort(x)
sort(x, decreasing = T)

quantile(x, 1/4)

quantile(x, 2/4)

quantile(x, 3/4)

quantile(x, 4/4)

length(x)

x.t <- table(x)
x.t
class(x.t)
max(x.t)

x.m <- rbind(x.t)
class(x.m) 

str(x.m)
which(x.m[1,] == 18) #검색조건에 부합되는 인덱스 반환

x.df <- as.data.frame(x.m)
which(x.df[1,] == 18)     #matrix 을 dataframe으로 변환
x.df


which(x.df[ 1  ,  ] == 18) #열의 위치 번호 18번을 찾아 나타낸다

attributes(x.df) #열이름 , 행이름, 타입


x
var(x) #x의 분산
sd(x) #x의 표준편차
var(data$cost) #data의 cost 분산
sqrt(var(x)) #x의 표준편차

hist(data$cost)

plot(data$cost)


data$cost2[data$cost >= 1 & data$cost <=3] <-1 #새로운 열 생성
data$cost2[data$cost >= 4 & data$cost <=6] <-2 #새로운 열 생성
data$cost2[data$cost >= 7] <-3 #새로운 열 생성

table(data$cost2)
head(data)


par(mfrow = c(1,2))
barplot(table(data$cost2))
pie(table(data$cost2))
par(mfrow = c(1,1))
install.packages("moments")
library(moments)
cost <- data$cost
skewness(cost)
kurtosis(cost)
hist(cost)

hist(cost, freq = F)
lines(density(cost), col = 'blue')
x <= seq(0, 8, 0.1)
curve(dnorm(x,mean(cost), sd(cost)), col = 'red',add = T)

attach(data)
length(cost)
summary(cost)
mean(cost)
max(cost)
range(cost)
sqrt(var(cost,na.rm = T))
sd(cost, na.rm = T)
detach(data)

head(data)
data$resident
data$resident2[data$resident == 1] <- "특별시"
data$resident2
data$resident2[data$resident >= 2 & data$resident <= 4] <- "광역시"
data$resident2[data$resident == 5] <- "시군구"

x <- table(data$resident2)
x

prop.table(x)
y <- prop.table(x)
y

round(y * 100 , 2) #백분율 표현식
head(data)

summary(data$type) 

table(data$type)   #빈도분석
table(data$pass)   #type과 pass의 빈도를 분석

par(mfrow = c(1,2))
barplot(table(data$type))
pie(table(data$pass))

#----------------------------------------------------------------------------------------------
  

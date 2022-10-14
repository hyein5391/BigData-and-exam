# 모집단의 신뢰구간
N = 10000   #표본 크기 (10000명)
X = 165.1   #표본 평균  (키)
S = 2       #표본표준편차 (2cm)
low <- X - 1.96*S / sqrt(N) #신뢰구간 하한값
high <- X - 1.96*S / sqrt(N)  #신뢰구간 상한값
low; high

high - x

#표본 오차
(low - X) * 100
(high - X) * 100

#a 반도체 회사의 150을 표본 조사해서 90명이 여자임을 확인했다 . 이 회사 전체의 여자 비율을 구간 추정하세요 (신뢰구간 95%)
n <- 150
pbar <- 90 / 150
qbar <- 1 - pbar
pbar
low <-pbar - 1.96 * sqrt(pbar*qbar / n)
high <-pbar + 1.96 * sqrt(pbar*qbar / n)
low; high

#고객만족도
setwd("C:/bigdataR")
data <- read.csv("one_sample.csv")
data
head(data)
x <- data$survey
summary(x)
length(x)
table(x)

install.packages("prettyR")
library(prettyR)
freq(x)

n <- 150
binom.test(14, n, p = 0.2)
binom.test(14, n, p = 0.2, alternative = "two.sided", conf.level = 0.95)

binom.test(14, n, p = 0.2, alternative = "greater", conf.level = 0.95)

binom.test(14, n, p = 0.2, alternative = "less", conf.level = 0.95)
# 14불만족인원 , 양측검정(차이만 검정)

# 노트북 사용시간 검정(국내와 A사 비교)
data <- read.csv("one_sample.csv", header = T)
str(data)

x <- data$time
x

mean(x)
mean(x, na.rm = T)
x1 <- na.omit(x)
mean(x1)

#정규성 검정(정규분포와 다르지 않다 라는 귀무가설을 채택을 하여야 한다 p-value가 0.05보다 커야한다)

shapiro.test(x1)

par(mfrow=c(1,1))
hist(x1)
qqnorm(x1)
qqline(x1, col="blue")

t.test(x1, mu=5.2, alternative = "two.side", conf.level = 0.95)
t.test(x1, mu=5.2, alternative = "greater", conf.level = 0.95)
t.test(x1, mu=5.2, alternative = "less", conf.level = 0.95)

qt(7.083e-05, 108) # t 값이 귀무가설 임계값(절대값) 보다 클 경우 귀무가설을 기각한다.(t 테스트 검정)

#교육 방법에 따른 만족도 차이
#불만족(0), 만족(1)
data <- read.csv("two_sample.csv")
data

data$gender
data$survey # 1(만족), 0(불만족)
# 데이터 정체/전처리
x<- data$method # 성별 추출
y<- data$survey # 만족도 추출 
table(x)
table(y)
table(x,y)
# 교차테이블 확인
table(x) # 성별 구분 (1 : 174, 2 : 126)
table(y) # # 대학진학 만족도(0 : 55, 1 : 245)
table(x, y, useNA="ifany") # 결측치 까지 출력
#단계3: 두 집단 비율차이검증 : prop.test()
help(prop.test) # prop.test(x,n,p, alternative, conf.level, correct)
prop.test(c(110,135),c(150,150), alternative = "two.sided", conf.level = 0.95) # 남학생과 여학생의 만족도 차이 검정
prop.test(c(110,135),c(150,150), alternative = "greater", conf.level = 0.95) # 남학생과 여학생의 만족도 차이 검정
prop.test(c(110,135),c(150,150), alternative = "less", conf.level = 0.95) # 남학생과 여학생의 만족도 차이 검정


data <- read.csv("two_sample.csv", header = T)
head(data)
result <- subset(data, !is.na(score), c(method, score))
head(result)
tail(result)
tail(data)
head(data, n=30)
a <- subset(result, method == 1)
b <- subset(result, method == 2)

a1<- a$score
a1
b1 <- b$score
b1
mean(a1)
mean(b1)
#p-value 가 0.05보다 클 경우 분산비교 결과 비슷(동질성 있음)
t.test(a1,b1, conf.level = 0.95)


data <-read.csv("C:\\bigdataR\\paired_sample.csv", header = T)
data
head(data)

result <- subset(data, !is.na(after), c(before, after))
x <-result$before
y <-result$after
mean(x)
mean(y)

var.test(x,y,)
t.test(x,y)

# 세 집단 비율(만족율) 검정

data <- read.csv("three_sample.csv", header = T)
head(data)
method <- data$method
survey <- data$survey
method
survey
table(method)
table(survey)
table(method, survey)

prop.test(c(34,37,39), c(50,50,50))


#분산분석(3개 이상의 집단간 평균 검정에 사용)
#3가지 교육 방법에 따라 측정한 시험 결과는 차이가 있다 를 검정

data <-read.csv("three_sample.csv", header =T)
data <- subset(data, !is.na(score), c(method, score))
data$score
length(data$score)

plot(data$score)
barplot(data$score)
data2 <- subset(data, score <=14)
data2
boxplot(data2$score)


length(data2$score)
data2$method2[data2$method == 1] <- "방법1"
data2$method2[data2$method == 2] <- "방법2"
data2$method2[data2$method == 3] <- "방법3"
x <- table(data2$method2)
x

y <-tapply(data2$score, data2$method2,mean)
y
df <- data.frame(교육방법=x, 성적=y)
head(df)

bartlett.test(score ~ method, data = data2)   #동질성 검정

help(aov)
head(data2)
result <- aov(score ~ method2, data = data2)
result
summary(result)


TukeyHSD(result) #사후검정

plot(TukeyHSD(result))





#==================================================================================================
#중소기업에서 생산한 HDTV 판매율을 높이기 위해서 프로모션을 진행한 결과 기존 구
# #매비율 보다 15% 향상되었는지를 각 단계별로 분석을 수행하여 검정하시오. 연구가설(H1) : 기존 구매비율과 차이가 있다. 귀무가설(H0) : 기존 구매비율과 차이가 없다. 조건) 구매여부 변수 : buy (1: 구매하지 않음, 2: 구매)
# 단계1: 데이터셋 가져오기
setwd("C:\\bigdataR")
hdtv <- read.csv("hdtv.csv", header=TRUE)
# 단계2: 빈도수와 비율 계산

summary(hdtv) 
length(hdtv$buy) # 50개
freq(hdtv$buy) #buy에 대한 빈도수
table(hdtv$buy) # 1:40, 2:10
table(hdtv$buy, useNA="ifany") # NA 빈도수 표시 단계3: 가설검정
binom.test(c(10,40), p=0.15) #15% 비교 ->p-value = 0.321
binom.test(c(10,40), p=0.15, alternative="two.sided", conf.level=0.95)
#귀무가설 채택 : 기존 구매비율(15%)과 차이가 없다. 
#방향성이 있는 단측가설 검정
binom.test(c(10,40), p=0.15, alternative="greater", conf.level=0.95) 
#p-value=0.2089

binom.test(c(10,40), p=0.15, alternative="less", conf.level=0.95) #p-value = 
0.8801
#<해설> 방향성이 잇는 단측가설은 모두 기각된다.
#[실습] 11% 기준 : 방향성이 있는 연구가설 검정 
binom.test(c(10,40), p=0.11, alternative="greater", conf.level=0.95)

#=========================================================================================

#우리나라 전체 중학교 2학년 여학생 평균 키가 148.5센치 로 알려진 상태에서 A중학교 2학년 전체 500명을 대상으로 10%인 50명을 표본으로 선정하여 표본 평균 신장을 계산하고 모집단의 평균과 차이가 있는 지를 단계별로 분석을 수행하여 검정하시오


setwd("c:/Rwork/Part-III")
stheight<- read.csv("student_height.csv", header=TRUE)
stheight
height <- stheight$height
head(height)


length(height) #50
summary(height) # 149.4 x1 <- na.omit(height)
x1 # 정제 데이터 mean(x1) # 149.4 : 평균신장

#단계3: 정규성 검정

shapiro.test(x1) # p-value = 0.0001853 -> 정규분포 아님
# 정규분포(모수검정) - t.test()
# 비정규분포(비모수검정) - wilcox.test()
#단계4: 가설검정 - 양측검정
wilcox.test(x1, mu=148.5) # p-value = 0.067
wilcox.test(x1, mu=148.5, alter="two.side", conf.level=0.95) # p-value = 0.067
#<해설> 귀무가설을 기각할 수 없다




#==================================================================================================
#대학에 진학한 남학생과 여학생을 대상으로 진학한 대학에 대해서 만족도에 차이가 있는가를 검정하시오

#단계1: 실습데이터 가져오기
data <- read.csv("two_sample.csv", header=TRUE)
data
head(data) # 변수명 확인
#단계2: 두 집단 subset 작성

data$gender 
data$survey # 1(만족), 0(불만족)

# 데이터 정체/전처리
x<- data$gender # 성별 추출
y<- data$survey # 만족도 추출 

# 교차테이블 확인
table(x) # 성별 구분 (1 : 174, 2 : 126)
table(y) # # 대학진학 만족도(0 : 55, 1 : 245)
table(x, y, useNA="ifany") # 결측치 까지 출력

#단계3: 두 집단 비율차이검증 : prop.test()
help(prop.test) # prop.test(x,n,p, alternative, conf.level, correct)
prop.test(c(138,107),c(174,126)) # 남학생과 여학생의 만족도 차이 검정
prop.test(c(138,107),c(174,126), alternative="two.sided", conf.level=0.95)

#<해설> p-value = 0.2765 : 남학생과 여학생의 만족도에 차이가 없다.






#===================================================================================================
#교육 방법에 따라 시험성적에 차이가 있는지 검정하시오

edumethod <- read.csv("twomethod.csv", header=TRUE)
head(edumethod) #3개 변수 확인 -> id method score

#단계2: 두 집단 subset 작성(데이터 정제, 전처리)
# 데이터 전처리(score의 NA 처리)
result <- subset(edumethod, !is.na(score), c(method, score))
result

#단계3: 데이터 분리
# 1) 교육방법별로 분리
a <- subset(result,method==1) #부분집합(subset) method(방법) 1인 결과값 모음
b <- subset(result,method==2) #부분집합(subset) method(방법) 2인 결과값 모음
a
b
# 2) 교육방법에서 영업실적 추frequency(빈도수)출부분집합
a1 <- a$score
b1 <- b$score
a1
b1
# 3) 기술 통계량 
length(a1); # 22
length(b1); # 35

#단계4: 분포모양 검정
var.test(a1, b1) # p-value = 0.8494 : 차이가 없다. <해설> 동질성 분포와 차이가 없다. 모수검정 방법 수행

#단계5: 가설검정
t.test(a1, b1) # p-value = 1.303e-06
t.test(a1, b1, alter="greater", conf.int=TRUE, conf.level=0.95) # p-value = 1
t.test(a1, b1, alter="less", conf.int=TRUE, conf.level=0.95) # p-value = 6.513e-07 단축검정

#<해설> a1 교육방법과 b1 교육방법 간의 시험성적에 차이가 있다. t.test(b1, a1, alter="greater", conf.int=TRUE, conf.level=0.95) #p-value=6.513e-07
#해설> b1 교육 방법이 a1 교육방법 보다 시험성적이 더 좋다.





#==========================================================================================================================================

s1 <- c(1,2,1,2,3,2,3,4,5)
s2 <- c(1,3,1,2,3,2,4,3,4)
s3 <- c(2,3,2,3,2,5,3,4,2)
s4 <- c(2,4,2,3,2,5,3,4,1)
s5 <- c(4,5,4,5,2,5,2,4,3)
s6 <- c(4,3,4,4,2,5,2,4,2)
name <-1:10
name
subject <- data.frame(s1,s2,s3,s4,s5,s6)
str(subject)

#--------------------------------------------------------------------------------

pc <- prcomp(subject) #prcomp(principal Component Analysis) 주성분 분석
summary(pc)
plot(pc)

#----------------------------------------------------------------------------------------

en <- eigen(cor(subject)) #$values: 고유값, $vaectors:고유벡터
names(en)

en$values

en$vectors

plot(en$values, type = "o") #고유값을 이용한 시각화

cor(subject)  #상관계수수

result <- factanal(subject, factors = 2, rotation = "varimax")
result #p-value is 0.0232 < 0.05 #요인수가 증가 후 분석
result <- factanal(subject, factors = 2, rotation = "varimax", scores = "regression")
result

result$loadings #적재물
print(result, digits = 2, cutoff = 0.5)
print(result$loadings, cutoff = 0)
plot(result$scores[ , c(1:2)])
text(result$scores[ , 1], result$scores[, 2], labels=name, cex = 0.7, pos = 3, col = 'blue')

points(result$loadings[ , c(1:2)], pch=19, col = "red") #벡터 1과 2의 내용
text(result$loadings[,1], result$loadings[, 2], labels =  rownames(result$loadings), cex = 0.8, pos = 3, col = "red")

library(scatterplot3d)
result$scores
Factor1 <- result$scores[, 1]
Factor2 <- result$scores[, 2]
d3 <- scatterplot3d(Factor1,Factor2,type = 'p')
loading1 <- result$loadings[, 1]
loading2 <- result$loadings[, 2]
d3$points3d(loading1,loading2, bg="red" , pch=21, cex=2, type = "h")



install.packages("memisc")
library(memisc)

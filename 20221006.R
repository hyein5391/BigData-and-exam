setwd("C:\\bigdataR")
getwd()
data <- read.csv("C:\\bigdataR\\descriptive.csv", header = T)
head(data)

type <- data$type
type
type.table <- table(type)
par(mfrow=c(1,2)) # 한 행에 2개 plot
barplot(type.table) #빈도분석 결과 plot
pie(type.table)

pass <- data$pass
pass
barplot(pass.table) #빈도분석 결과 plot
pie(pass.table)

pass.table <- table(pass)
pass.table


par(mfrow=c(1,1)) #기본plot

age <- data$age
age

summary(age) #요약
mean(age) #평균
sd(age) #표준편차
var(age) #분산

install.packages("moments")
library(moments)
skewness(age) #왜도를 구해준다 age에 대한
kurtosis(age) #척도

hist(age, freq = F) #밀도 그래프
lines(density(age), col="blue") #density 밀도
x <- seq(40, 70, 1) #x 축 값(변량), seq함수는 sequence의 약자 연속되는 숫자에 대해서 일정간격을 두고 선언
curve(dnorm(x, mean(age), sd(age)), col='red', add =T) #정규분포의 x축과, (이상적인 정규분포 곡선) 


setwd("C:\\bigdataR")
data <- read.csv("cleanDescriptive.csv", header = T, fileEncoding = "euc-kr")
data
head(data)



x <- data$level2
y <- data$pass2
x
y
result <- data.frame(Level = x, Pass = y)
dim(result)

table(result) #교차 분할표

install.packages("gmodels")
library(gmodels)

install.packages("ggplot2")
library(ggplot2)
CrossTable(x= diamonds$color, y= diamonds$cut)


#부모학력과 자식진학 관계
x <- data$level2
y <- data$pass2
CrossTable(x,y) # 교차분할표




CrossTable(x= diamonds$cut, y= diamonds$color, chisq = T)

# 일원 카이스퀘어(적합도 검정)
chisq.test(c(4,6,17,16,8,9)) #주사위 던지기 60회

chisq.test(c(9,11,12,8,9,11))


data <- textConnection("스포츠음료 관측도수
                       1  41
                       2  30
                       3  51
                       4  71
                       5  61
                       ")
x <- read.table(data, header = T)
x
chisq.test(x$관측도수)  #방법1) 
                        # df = 4이고 유의수준은 0.05,
                        # 임계치:9.49 / X-squared = 20.488 이므로
 
                        # ∴ 귀무기각
                        
                        #data:  x$관측도수 결과 
                        #X-squared = 20.488, df = 4, p-value = 0.0003999 

 
 
                        # 방법2)

                        # 0.05(유의수준) > 0.0003999(p-value) 이므로

                        # ∴ 귀무기각


CrossTable(x, y, chisq = T)
##------------------------------------------------------------
#Chi^2 =  2.766951     d.f. =  2     p =  0.2507057 
# 검정통계량 : Chi^2 : 기대비율총합, d.f.(자유도) : n-1
#Chi_2 = 0.544 + 0.363 + 1.026 + 0.684 + 0.091 + 0.060
#Chi_2

# 귀무가설 : 학년수준과 자녀의 대학진학여부와 관련이 없다.(O)
# 대립가설 : 학년수준과 자녀의 대학진학여부와 관련이 있다.(x)
# p =  0.2507057 >= 0.05(알파)


#이원 카이스 퀘어 검정(동질성 검정)

data <- read.csv("homogenity.csv")
head(data)
summary(data)


data$method2[data$method == 1 ] <- "방법1"
data$method2[data$method == 2 ] <- "방법2"
data$method2[data$method == 3 ] <- "방법3"

data$survey2[data$survey == 1 ] <- "1.매우만족"
data$survey2[data$survey == 2 ] <- "2.매우만족"
data$survey2[data$survey == 3 ] <- "3.매우만족"
data$survey2[data$survey == 4 ] <- "4.매우만족"
data$survey2[data$survey == 5 ] <- "5.매우만족"

head(data)
table(data$method2,data$survey2)

chisq.test(data$method2, data$survey2)
#결과 X-squared = 6.5447, df = 8, p-value = 0.5865    #자유도8인 이유 2x4


#나이 와 직위 간의 관련성을 단계별로 분석하시오
data <- read.csv("C:\\bigdataR\\cleanData.csv", header = T, fileEncoding = "euc-kr")
head(data)

x <- data$position
y <- data$age3 
plot(x, y)
plot(x,y,abline(lm(y~x)),main="나이와 직위에 대한 산점도")
CrossTable(x,y, chisq = TRUE) 


# 교육 수준과 흡연율 간의 관련성을 분석하기 위한 연구가설을 수립하고 단계별로 가설을 검정하시오
smoke <- read.csv("smoke.csv", header=TRUE)
head(smoke)
#education(독립변수) : 1:대졸, 2:고졸, 3:중졸
#smoke(종속변수): 1:과다흡연, 2:보통흡연, 3:비흡연

smoke$education2[smoke$education==1] <- "1.대졸"
smoke$education2[smoke$education==2] <- "2.고줄"
smoke$education2[smoke$education==3] <- "3.중졸"
smoke$smoking2[smoke$smoking==1] <- "1.과대흡연"
smoke$smoking2[smoke$smoking==2] <- "2.보통흡연"
smoke$smoking2[smoke$smoking==3] <- "3.비흡연" 
table(smoke$education2, smoke$smoking2)
library(gmodels) # CrossTable() 함수 사용
CrossTable(x= smoke$education2, y=smoke$smoking2, chisq = TRUE)

#교육 수준과 흡연율은 서로 관련성이 있다. 를 분석하기 위해 355명을 표본으로 추출한 교육수준과 흡연율의 관련성은 유의미한 수준에서 관련이 있는 것으로 나타났다.(x2 = 18.9 P < 0.000). 따라서 , 귀무가설을 기각 하고 교육수준과 흡연율은 서로 관련이 있는것으로 분석할수 있다


# #직업 유형에 따른 응답 정도에 차이가 있는가 검정
# H0 : 직업 유형에 따른 응답 정도에 차이가 없다.
# H0 : 직업 유형에 따른 응답 정도에 차이가 있다.

response <- read.csv("response.csv", header = T)
response$job2[response$job == 1] <- "학생"
response$job2[response$job == 2] <- "직장인"
response$job2[response$job == 3] <- "주부"
response$response2[response$response == 1] <-"무응답"
response$response2[response$response == 2] <-"낮음"
response$response2[response$response == 3] <-"높음"
head(response)
CrossTable(x=response$job2, y=response$response2, chisq= T)

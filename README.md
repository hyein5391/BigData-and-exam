# BigData1

age <-36
name <- "홍길동"
names <-c('홍길동', '이순신', '유관순')

boolean <-T
sum(10,20,100)
num1 <-20 #scaler 값 저장

str1 <- "홍길동"
bool1 <- TRUE
sum(10,20,50)
sum(10,20,30,NA)
sum(10,20,30,NA, na.rm = T)

is.numeric(num1)
is.character(str1)
is.logical(bool1)

x <-c(1,2,'3')

result <- as.integer(x) * 3 # 문자를 숫자형으로 변환 후 곱셈 
result <- as.numeric(x) * 3 # 문자를 숫자형으로 변환 후 곱셈
result

mode(num1)
mode(result)
mode(str1)
mode(x)
class(x)

date1 <- as.Date('20/02/28','%y/%m/%d') # %H 24시간 %I 12시간 %M분 %S초 
date1
mode(date1)

date2 <- as.Date("2022-08-24 10:10:10", "%Y-%M-%D %H:%M:%S")
class(date2)

today <-strptime(sdate.format = '%Y-%m-%d %H:%M:%S')
class(today)


sdate <- '2022-08-24 12:27:5'
class(sdate)
today <- strptime(sdate.format = '%Y-%M-%D %H:%M:%S')
class(today)

dates <-c('02-28-20', '02-30-20', '03-01-20')
as.Date(dates,'%m-%d-%y')

dates

sdate <-'2019-11-11 12:47:5'

today<-strptime(sdate,format = '%Y-%m-%d %H:%M:%s')
sdate

args(max)
max(10,20,NA,30)

getwd()

c(0:15)
1:15



=====================================================================================================================================================

c(1:20)
c(1:40)
seq(1,40,2)
seq(1,10,1)
seq(1,100,2) #start. stop. step

rep(1:3, each=3)

x<- c(1,3,5,7)
y<- c(3,5)
union(x,y)
setdiff(x,y)
intersect(x,y)

age <-c(30,35,40)
age
namess(age) <- c(홍길동','이순신',강감찬')
age

a <- c(1:50)
a[10:45]

a[19: (length(a) - 5)]

v1<-c(13,-5,20:23,12, -2:3)
v1[1] # 백터 객체의 1 번째 원소 출력

v1[c(2,4)] # 벡터 객체의 2번쨰 원소와 4번째 원소 출력

v1[c(3:5)] # 벡터 객체의 3~5번째 원소 출력

v1[c(4,5:8,7)] # 콤마와 세미콜론으로 v1 벡터 객체의 원소 출력

v1[-1] # 1번째 데이터 제외
v1[c(-1)] #1번쨰 데이터 제외
v1[-c(2,4)] 

m<- matrix(c(1:5)) #열을 행렬 객체가 만들어진다
m

m<-matrix(c(1:10),nrow = 2) #열 우선으로 2행 2열의 행렬 객체 생성
m

c<- matrix(c(1:11), nrow = 2)
m

m<- matrix(c(1:10), nrow = 2, byrow = T) #byrow = T:행우선으로 바꾸어준다
m


mc<- cbind(x1,x2)
m


x1 <- c(5,40, 50:52)
x2 <- c(30,5, 6:8)
mr <- rbind(x1,x2)
mr


m3 <- matrix(10:19, 2) # 열우선
m3

m3[ 1 , ]
m3[  , 5 ]

m3(2,3) # 단일원소

m3[1, c(2:5)]  #1,2     1.2      1.4       1.5
m4 <- matrix(10:20, 2)
m3


x<- matrix(c(1:9), nrow =5,ncol=5)
x
length(x)

ncol(x)
apply(x, 1, max) # 행 단위로 최대값을 구한다
# apply함수 : 함수를 지정하여 행단위 또는 열단위 각각 계산된 값 출력
apply(x, 1, min)

apply(x, 1, mean)

apply(x, 1, min) #행단위 최소값

apply(x, 2, mean) # 열단위 평균

f <- function(num) { # 사용자 정의 함수
  num * 2
}

f(10)
f(c(1,2,3))

result<- apply(x, 1, f)
x
result


vec <-c(1:12)
arr <- array(vec,c(3,2,2)) # 3행2열 2개 평면
arr
arr( , , 1)
arr[,,2]
arr[1,2,2]

no<- c(1,2,3)
name <- c('hong','lee','kim')
pay <- c(150,250,300)
vemp <- data.frame(번호=no, 이름=name, 금액=pay)#칼럼명 지정
vemp

m <-matrix(
  c(1,'hong',150,
    2,'lee',250,
    3,'kim',300),3,by = T) #행 우선, 3개의 리스트 생성
memp <- data.frame(m)
memp

csvtemp <- read.csv("C:/bigdataR/emp.csv",header = T,encoding = 'euc-kr')
csvtemp

name <-c('사번','이름','급여')
csv2 <- read.csv("C:/bigdataR/emp2.csv",header = F,col.names = name)
csv2
csv2$사번 #컬럼명 참조($표시 사용)
csv2$이름
csv2$급여


str(csv2) #데이터프레임 구조
ncol(csv2) #열의개수
nrow(csv2) #행의개수

csv2[c(5)  ,     ]
csv2[]

summary(csv2) # 기술통계 #Median(평균값) #Min(중앙값이 유효하다)



======================================================================================================================================================

df                 #↓ 5개의 행으로 설정해놓음 seq(:
df <-data.frame(x=1:5,y=seq(2,10,2),z=c('a','b','c','d','e'))     # ,앞에 쓰이는 것을 열명칭, $x 표시는 열 명칭만 추출가능
df$x
str(df) # df는 각각의 열 단위로 데이터를 어떤 데이터로 이루어져 있는지 알려준다
summary(df) # 기술통계 <--를 알려준다
df[ c(2:3) , 1  ] #특정 데이터에 접근을 할때는 쉼표(,)를 기준으로 앞에는 행 뒤에는 열을 나타낸다(행 또는                                      열정보를 생략시 전체를 의미한다) 
# →(행) ↓(열)

apply(df[ , c(1,2)], 2,sum ) #[행],[],[열단위],사용할 함수)  min(에버리지가 아닌 나눔 사용시 min사용) apply(어플라이)여러가지 함수를 를 구하는 끌어쓰는 경우(통계관련 함수)백터는 ,(쉼표를 꼭 넣어놓고 시작하는게 좋다)
#aplly 는 데이터를 제외 시키는 방법이 없다

df
x1 <- subset (df, x>=3 ) #subset(부분집합을 구하는 함수) df에서 x열이 3보다 큰 데이터를 x1 에 저장한다, 
x1


y1 <- subset(df, y <=8 ) #저장문법
y1
#AND <--로지컬엔드(엔드연산자 참또는 거짓을 나타내는 )
#            X    Y   OUT    진리표
#            F    F    F  
#            F    T    F
#            T    F    F    
#            T    T    T

xyand <- subset(df , x >=2 & y <= 6) #논리 값은 and 하나에는 논리식 기호만 가능함 &같은 기호는 가능
xyand


xyor <- subset(df , x >=2 | y <= 6) #논리값은 or() \버튼 <-- 씨프트 누르고)
xyor

sid = c('a','b','c','d')#R에서는 (=이퀄) 권장하지 는 않음
score = c(90,80,70,60) # 문자는 작은 따음표도 가능하지만 통상적으로 큰 따움표를 쓴다 
subject = c('컴퓨터','국어국문','소프트웨어','유아교육')

sid
score
subject

student <- data.frame(sid, score, subject) #데이터 프레임으로 할경우 열 형식으로
student
class(student)
str(student)
str(student$sid)  # 이와 같은 식을 사용하면 sid 열의 구조를볼수있다
str(student$subject)
height <-data.frame(id=c(1,2), h=c(180,175))
weight <-data.frame(id=c(1,2), w=c(80,75))
height
weight
user <- merge(height, weight, by.x = 'id', by.y = 'id') # 단순한 값을 찾는것이 아닌 다른것또한 찾아서 병합하는 함수
user

member <-list(name=c("홍길동","유관순"), age=c(35,25),
              address=c("한양","충남"), gender=c("남자","여자"),
              htype=c("아파트","오피스텔"))
member
class(member)
member$name
member$name[1]

member$age[1] <-45 # 수정
member$id <- "hong" #추가
member
member$pwd <-"1234"
member$age <-NULL
member


df
df[  ,  ] #아무것도 안넣는다면 전체집합 결과가 나온다
df[ 1 , 1 ] # 1행 1열로 넣을경우 아래와 같다

=========================================================================================================================================================


install.packages("stringr") # 패키지 설치
library(stringr)
                                         #1~9 까지 2번 연속으로 표현함
str_extract("홍길동35이순신45유관순25", "[1-9]{2}") #, 이후에 쓰는것을 정규편식이라 한다 #정제안된 데이터가 들어와있을경우씀
str_extract_all("홍길동35이순신45유관순25", "[1-9]{2}") # 함수의 이름은 all이다
# ^캐럽 기호(제외문자) 는 정한 문자를 제외하고 표시한다

# 1은 여자 2는 남자 3은연도
str_extract_all(jumin, "\\d{6}-[1234]\\d{6}") #123456 - 1234567주민번호 일때 [0-9]{6} - [1234][0-9]{6}
#\\d{6} (디짓) 숫자가 6개 연속된 패턴을 지정한다 정규 표현식으로는 "[0-9]{6}" 과 같은결과를 나타낸다
#\\w{7} 는 단어의 길이가 7이상인 패턴을 지정하는 정규 표현식, 단어는 한글 영문 숫자가 포함된다 대신 특수문자는 불가능

str1 <-"1234홍길동"
str_sub <- str_sub(str1, 5)
str_sub

str2 <-str_repiace(str1, "홍길동","김삿갓")
str1
str2

str_rep <-"홍길동, 김삿갓, 강감찬, 이도령, 이순신"
str_split(str_rep, ",") #쉼표를 구분자로 처리해서 문자열 분리
str_c <-str_split(str_rep, ",") #저장
str_c

str_join <- paste(str_c, collapse = ",")
str_join


str_vec <-c("홍길동","김삿갓","강감찬","이도령","이순신")
str_join <- paste(str_vec, collapse = ",")
str_join

num <- scan()
name <- scan(what = character()) # 문자열 입력
name

df <-data.frame() #공백 데이터프레임 생성
df <- edit(df) #편집기 실행해서 데이터프레임 저장 =이퀄과 <- 변수지정 기호는 같이 사용된다
df

student <- read.table(file = "c:/bigdataR/student.txt") #기본 구분자는 공백 또는 탭
student

names(student) <- c("번호","이름","키","몸무게") #열이름 수정
student

student1 <- read.table(file = "c:/bigdataR/student1.txt", header = T)
student1

student1 <- read.table(file.choose(), header = T) #대화상자 발생

student2 <- read.table(file.choose(), header = T, sep = ";")
student2

student3 <- read.table(file.choose(), header = T, na.strings = "-")
student3

student4 <- read.csv(file.choose(), header = T, na.strings = "_", sep =",")
student4

install.packages("readxl") #xlsx 패키지 설치
library(readxl)

st_excel <- read_excel(path = "c:/bigdataR/studentexcel.xlsx", sheet = "Sheet1")
st_excel

# 깃허브에 있는 데이터 불러오기
titanic <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv")
titanic

dim(titanic)
str(titanic)
table(titanic$age) #나이가 합산 되어있어서 보기가 어려움......
table(titanic$sex) #성인 1207명 있다고 표기 # 아이가 109명이 있다 표기
table(titanic$survived) # 생존자 인원 체크

head(titanic)

tail(titanic)

tab <-table(titanic$survived,titanic$sex)
tab

#막대 그래프를 그리는 barplot 함수 사용
barplot(tab, col = rainbow(2)) #기본형 그래프 , 알아보기 쉽게 만드는게 가장 중요

#데이터를 text로 저장한다 row names 를 F로 만들어 로우네임즈 자체는 저장이 안된다
write.table(titanic, "c:/bigdataR/titanic.txt", row.names = F)
titanic
write.csv(titanic, "c:/bigdataR/titanic.csv", row.names = F)

#패키지 설치
install.packages("writexl")
library(writexl)

write_xlsx(x=titanic, path="C:/bigdataR/titanic.xlsx",
col_names = T)


#csv 자료를 불러오는 헤더를 T로 지정해준다
pop <- read.csv(file.choose(), header = T)
str(pop)
summary(pop)
head(pop)
tail(pop)
pop$총인구수.명.
pop$행정구역.시군구.별

#행번호를 찾아내는 함수
x <- grep("도$", pop$행정구역.시군구.별) #조회 대상의 행 번호를 벡터로 반환
x
data1 <- pop[ x,  ] # x벡터의 행번호에 해당하는 데이터 추출
data1

#광역시 를 조회하여 data2 변수에 저장
x <- grep("광역시$", pop$행정구역.시군구.별)
x
data2 <- pop[  x ,  ]
data2

# 서울시를 data3 에 저장
# 세종시를 data4 에 저장

x <- grep("특별시$", pop$행정구역.시군구.별)
x
data3 <- pop[ x,  ]
data3

x <- grep("자치시$", pop$행정구역.시군구.별)
x
data4 <- pop[ x,  ]
data4

#데이터 합치는 함수 rbind
newdata <- rbind(data1, data2)
newdata
newdata <- rbind(newdata, data3)
newdata
newdata <- rbind(newdata, data4)
newdata
# 행정구역, 남자인구, 여자인구

df <-data.frame(행정구역=newdata$행정구역.시군구.별, 남자인구=newdata$남자인구수.명., 여자인구=newdata$여자인구수.명.)
df
write.csv(df, "C:/bigdataR/newdata.csv", row.names = F) #파일 csv로 저장하는 방법

# 6월 데이터를 다운로드하여 행정구역, 남자, 여자인구로 저장하시오

pop <- read.csv(file.choose(), header = T)
str(pop)
summary(pop)
head(pop)
tail(pop)
pop$총인구수.명.
pop$행정구역.시군구.별

#행번호를 찾아내는 함수
x <- grep("도$", pop$행정구역.시군구.별) #조회 대상의 행 번호를 벡터로 반환
x
data5 <- pop[ x,  ] # x벡터의 행번호에 해당하는 데이터 추출
data5

#광역시 를 조회하여 data2 변수에 저장
x <- grep("광역시$", pop$행정구역.시군구.별)
x
data6 <- pop[  x ,  ]
data6

# 서울시를 data3 에 저장
# 세종시를 data4 에 저장

x <- grep("특별시$", pop$행정구역.시군구.별)
x
data7 <- pop[ x,  ]
data7

x <- grep("자치시$", pop$행정구역.시군구.별)
x
data8 <- pop[ x,  ]
data8

#데이터 합치는 함수 rbind
newdata1 <- rbind(data5, data6)
newdata1
newdata1 <- rbind(newdata1, data7)
newdata1
newdata1 <- rbind(newdata1, data8)
newdata1
# 행정구역, 남자인구, 여자인구

df <-data.frame(행정구역=newdata$행정구역.시군구.별, 남자인구=newdata$남자인구수.명., 여자인구=newdata$여자인구수.명.)
df
write.csv(df, "C:/bigdataR/newdata1.csv", row.names = F) #파일 csv로 저장하는 방법

#===============================================================================================================

# 시와 군 단위 이동 통계 순이동이 양수인 데이터를 저장 -는 전출인원 + 인구유입
#pop <- read.csv(file.choose(), header = T, fileEncoding = "euc-kr")
pop <- read.csv(file.choose(), header = T) #파일을 불러오는 명령어 header=T 헤더가 존재한다
#str(pop)                                                    #fileEncoding 을 사용하는 경우 한글로 된 파일일 경우 사용
#summary(pop)
head(pop)
tail(pop)
pop$총인구수.명.
pop$행정구역.시군구.별

#행번호를 찾아내는 함수
y <- grep("시$", pop$행정구역.시군구.별) #조회 대상의 행 번호를 벡터로 반환
y
data09 <- pop[ y,  ] # x벡터의 행번호에 해당하는 데이터 추출
data09

#광역시 를 조회하여 data2 변수에 저장
x <- grep("군$", pop$행정구역.시군구.별)
x
data10 <- pop[  x ,  ]
data10


#데이터 합치는 함수 rbind
newdata2 <- rbind(data09, data10)

# 행정구역, 남자인구, 여자인구

df <-data.frame(행정구역=newdata$행정구역.시군구.별, 남자인구=newdata$남자인구수.명., 여자인구=newdata$여자인구수.명.)
df
write.csv(df, "C:/bigdataR/newdata1.csv", row.names = F) #파일 csv로 저장하는 방법



#================================================================================================================
#2022 09 01

pop <- read.csv(file.choose(), header = T)
head(pop)
tail(pop)


x <-grep("시$", pop$행정구역.시군구.별) # 모든 시를 추출한다(행번호)
print(x)
# cat(x) <- 프린터 외 출력하는 변수
# x <- 프린터 외 출력하는 변수 총 3개

data1 <- pop[x  ,   ]        #pop만 쓰경우 전부 저장,[1:10]*1부터10까지 저장, 
head(data1, n=15) #data 프레임일 경우 ,를 쓴다 , 데이터를 늘릴때는 n=15 상위 15개를 뜻함
tail(data1)



x <- grep("자치시$", data1$행정구역.시군구.별) #이미 추출한 데이터프레임(시) 중에 위치(행번호) 조회한다
x
data1 <-  data1[-c(9), ] #중복된 행을 제외한 모든 행을 저장한다

x <- grep("군$", pop$행정구역.시군구.별) #군 을 조회
x

#length(x) # 길이를 구하는 함수,,,,,, dim(data1)는 행과 열의 개수를 나타내어준다

data2 <- pop[x  ,   ]
dim(data2) #행과 열의 개수를 세어준다
head(data2) #군이 잘 불러졌는지 데이타2를 불러온다


data3 <- rbind(data1, data2)
head(data3)
tail(data3)
dim(data3)

data4 <- data3[data3$순이동.명. > 0 ,    ] #전입이 전출보다 큰 경우
dim(data4)

head(data4, n=15)

write.csv(data4, "C:/bigdataR/pop4.csv", row.names =  F, fileEncoding = "UTF-8")
#저장시 행정구역과 이동인구만 나타내는게 편하다


head(data4)
names(data4) #데이터프레임의 열 이름을 추출

name <- c(names(data4)) # c컴바인 함수를 사용하여 벡터로 만들어 네임변수에 저장한다
name
for ( n      in     names(data4)) {
  print(n)
}

#================================================================================================================

#제어문과 함수
#산술 연산자
num1 <-100
num2 <-20
result <- num1+ num2
result

result <- num1 - num2
result

result <- num1 * num2
result

result <- num1 / num2
result

result <- num1 %% num2 #나머지를 계산 (0)
result

result <- num1 ^ num2 #100의 20승(10020) (1e+40)
result

#관계연산자
#     == :EQ, != : NE, > : GT, < : LT, >= : GE, <= : LE


#논리연산자

logical <- num1 >= 50 & num2 <= 10 #두 관계식이 같은지 판단단
logical


# 배타적 논리합 =  X  Y  XOR
#                  F  F   F
#                  F  T   T
#                  T  F   T
#                  T  T   F

#ifelse #함수라기보단 조건문이다 파이썬에선 괄호를 적어야 하지만 R에서는 과호를 안적어도 괜찮다

x <- 50
y <- 4
z <- x * y

if ( x * y >= 40  ) {
  cat("40 이상입니다. \n")
  cat("x * y =", z, "\n")
  x
} else {
  cat("40미만입니다.", z, "\n")
}
#==================================================================================================================

score <- scan()              #점수를 미리 입력
85
score
result <-"노력"              #결과 초기값 지정
if(score>= 80){              # 입력 점수가 80이상이면
  result <- "우수"           # 결과 변경
}
cat("당신의 학점은", result,score) # 결과 확인

#==================================================================================================================

score <- scan()
90
if(score >= 90){
  result = "A학점"
} else if(score >=80){
  result = "B학점"
} else if(score >=70){
  result = "C학점"
} else if(score >=60){
  result = "D학점"
} else{
  result = "F학점"
}
cat("당신의 학점은", result)      #문자열과 변수의 값을 함께 출력
print(result)                     #print()함수는 변수의 값 또는 수식의 결과만 출력

#==================================================================================================================

Score <- scan()
90
ifelse(score >=80, "우수", "노력")  #조건문을 함수로 구현    #"우수"선택
ifelse(score <=80, "우수", "노력")                           #"노력"선택


#sqrt(제곱근을 계산한다) &연산자는 둘다 참일경우만 참이다
                                         #switch
switch("name", id="hong",name ="홍길동") #(찾고자 하는 값,      ,       )
#값을 조회해서 존재할 경우 저장된 내용을 출력한다

switch("apple" , apple = "1000", banana = "1500")


name <-c("kim", "lee", "choi", "park")
which(name == "choi")  #사람이름이 몇번째 들어있는지 알려준다

no <-c(1:5)
name <-c("홍길동","이순신", "강감찬","유관순","김유신")
score <-c(85,78,89,90,74)
exam <- data.frame(학번 = no, 이름 =name, 성적 = score)
exam



#for 문(반복문)
i <-c(1:10)
for(n in i){
  print(n * 10)
  print(n)
}
#==================================================================================================================
# for (작은데이터  in 큰데이터 )
tot <- 0 #초기화
for ( n in c(1:10)){
  tot <- tot + n
  print(tot)
}

#==================================================================================================================
score <-c(85,95,98)
name <-c("홍길동","이순신","강감찬")

i<-1                          # 인덱스,,,, 첨자로 사용하는 변수 #R에서는 파이썬처럼 0부터 시작이 아니라 1부터 보통 시작한다
for(s in score) {             # score 의 개수만큼 반복
  cat(name[i],": ",s,"\n")
  i <- i+1
}

for ( i in c(100, 200)) {
  print(i)
}

#==================================================================================================================

i = 0         #0부터 기준을 잡음
while(i<10){  #0부터 10까지
  i <- i+1    #0부터 + 1씩 늘어난다다
  print(i)
}



#==================================================================================================================
#function() 예약어

f1 <- function(){
  cat("매개변수가 없는 함수")
}
f1()                          #사용자 정의 함수 호출


#==================================================================================================================
#return(돌려주는 함수)

f3 <- function(x,y){
  add <- x+y
  return(add)
}
add <- f3(10,20)              #함수 호출 #함수 밖으로 빠져있는 재활용이 불가능,,,,,데이타는 인식을 할수가없다 예를들어 {       } 사이라고 볼수있다
add



#  quakes 일정기간동안 발생한 지진의 위도 경도 발생 횟수가 저장되어있음, class 는 "data.frame" 이다
#mag 는 진도 수치
quakes
class(quakes)
help(quakes)


head(quakes)
quakes$mag

#   summary #요약하여 통계량 구하기
summary(quakes$mag)
table(quakes$mag)         #결과 4도 4,1도 순으로 각 몇회 정도 지진이 일어났는지 결과를 볼수있다 msg에 대한 내용 




x <- quakes$mag           #지진강도를 백터로 저장x 라는 변수에에
x
# sd <- 스탠다드 에이션[분산 표준편차] 정규분포 그래프는 종모양 그래프
var_sd <- function(x){            #length 행길이
  var <- sum(x - mean(x)^2 ) / (length(x) - 1)        #분산
  sd <- sqrt(var)       #표준편차
  cat ("분산:", var, "\n" )
  cat("표준편차 : ", sd, "\n")
}
sd(x) #호출



#==================================================================================================================

data <-c(10,20,5,4,40,7,NA,6,3,NA,2,NA)     #SUM:97
na <-function(x){                   #remove = True
  #1차: NA제거
  print(x)
  print(mean(x, na.rm = T))
  
  #2차: NA를 0으로 대체
  data <- ifelse(!is.na(x),x,0) # 결측치일 경우 0으로 치환
  print(data)
  print(mean(data)) # 0이 포함된 평균
  
  #3차: NA를 평균으로 대체한다
  data2 <- ifelse(!is.na(x), x, round(mean(x, na.rm = T),2))               #(is.na) 결측치냐 #(!is.na) 결측치가 아니냐 는 표기
  print(data2)
  print(mean(data2))
}
na(data)                                    #추출 시작은 기술 통계가 먼저고 그 이후 통계량 측정


#==================================================================================================================
install.packages("RSADBE")

library(RSADBE)                          #패키지를 메모리에 로드한다
data("Bug_Metrics_Software")
Bug_Metrics_Software[, , 1] # [, , 1] 앞에 쉼표 두개는 전체 데이타를 나타낸다
dim(Bug_Metrics_Software)

rowSums(Bug_Metrics_Software[, , 1])    #출시전 버그 합계(SW별)
rowMeans(Bug_Metrics_Software[, , 1])   #출시전 버그 평균(SW별)
colSums(Bug_Metrics_Software[, , 1])    #버그 종류별 버그 수 합계
colMeans(Bug_Metrics_Software[, , 1])   #버그 종류별 버그 수 평균

#seq(-2,2,by= .2) #-2~2 범위에서 0.2씩 증가한다는 뜻


#=================================================================================================================
#그래프 그려보기


n <- 1000
x <- rnorm(n,mean = 0, sd=1)  #[표준정규분포] 평균이 0 표준편차가 1인 난수1000개 를 나타낸다 , x변수에 넣어준다
# hist[히스토그램]
hist(x)  # 중심부가 주로 영향을 받고 좌우로는 분포가 매우 적다 

#R uni 랜덤 유니펌
y <- runif(n,min = 0, max = 10) #균등분포 난수,,,, 현실적으로 불가능한 분포 임의적으로 만든 그래프 분포도
hist(y)

#==================================================================================================================
rnorm(5,mean = 0, sd=1) #매번 실행시 임의의 난수를 실행
set.seed(123)           #seed는 임의의 정수 사용
rnorm(5,mean = 0, sd=1) #종자값을 이용한 난수생성
set.seed(123)           #종자값을 123으로 설정
rnorm(5,mean = 0, sd=1) #이전 실행으로 생성된 난수와 같은 결과
set.seed(12345678)      #종자 값을 12345678 로 설정 같은 종자 값이면 같은 난수 생성
rnorm(5,mean = 0, sd=1)

set.seed(12345678)        #시드발생후의 값은 동일하게 유효하다
runif(5, min = 0, max=10)

#===================================================================================================================
#행렬 연산을 위한 x,y 행렬 생성
x <- matrix(1:9, nrow = 3, ncol = 3, byrow = T)  #행우선       # 3 x 3 정방행렬
x
y <- matrix(1:3, nrow = 3)                             # 3 x 1 행렬
y
ncol(x)
nrow(x)

t(x)                                            #x의 전치행렬 반환
cbind(x,1:3)                                    #x에 열 추가
rbind(x,10:12)                                  #x에 행 추가
diag(x)                                         #정방행렬 x에서 대각선 값 반환
det(x)                                          #6.661338e-16
apply(x,1,sum)                                  #x의 행 단위 합계
apply(x,2,mean)                                 #x의 열 단위 평균
svd(x)                                          #정방행렬 x에서 d,u,v 행렬로 특이값 분해


#=====================================================================================================================
#1키로 헤르츠당 1000번 데이터 발생이 된다 이산값<---- 정수값으로 추린값



chart_data <-c(305,450,320,460,330,480,380,520) #8개의 벡터에 칼럼명 지정
names(chart_data) <- c("2018_1","2018_2","2018_3","2018_4",
                       "2019_1","2019_2","2019_3","2019_4")
chart_data
barplot(chart_data, ylim = c(0,1000), xlab = "분기", ylab = "매출액", col = rainbow(8), main = "분기별 매출현황")
#======================================================================================================================
#가로막대 <---- 그리는 방법 하지만 잘 안쓴다

barplot(chart_data, xlab = "분기", ylab = "매출액", col = rainbow(8), main = "분기별 매출현황", horiz = T)
#수평방향으로 그리겠다 horiz #<---- 참 혹은 거짓




#======================================================================================================================
#누적막대 차트 그리기
#버지니아 주의 사망 비율
data(VADeaths)
VADeaths
dim(VADeaths)
str(VADeaths)
mode(VADeaths)


par(mfrow = c(1,1))                      #1행 2열 그래프 그리게 명령
barplot(VADeaths, beside = T, col = rainbow(5),main = "버지니아 인구 사망 비율")        #기본값만 넣어줘도 그래프는 그려지고--- 그이후(  ,  , )속성을 넣어준다
legend("topright", c("50-54","55-59","60-64","65-69","70-74"),cex=0.8,fill=rainbow(5), ncol = 5)

barplot(VADeaths,beside = F, col = rainbow(5), ylim = (0.250))        #두가지의 그래프를 그려줘야하므로 두가지의 기본값과 속성을 넣어준다
legend("topleft",c("50-54","55-59","60-64","65-69","70-74"),cex=0.8,fill=rainbow(5), ncol = 5)
                                                        
#legend(3.8,200,c("50-54","55-59","60-64","65-69","70-74"),cex=0.8,fill=rainbow(5))

#top, bottom, left, right, 위치 지정 

#======================================================================================================================
#데이타를 이용하여 도트 형식의 차트를 만드는 방법

chart_data
dotchart(chart_data, color = c("blue", "red"),
         lcolor = "black", pch = 6,
         xlab = "매출액",
         ylab = "분기별현황",
         cex = 1,1)
barplot(chart_data)
chart_data                              #차트 데이터 저장되어있는 것을 불러온다

#원통형 그래프 색깔은 임의로 지정되어 나타난다 , # cex 는 글자의 크기를 나타냄
pie(chart_data, labels = names(chart_data), col = rainbow(8), cex=1.2, main = "분기별 매출현황")


names(chart_data)                       #제일 상단부의 열 이름이 무엇이 들어가 있는지 알아볼수있는 함수

boxplot(VADeaths)                       #박스형 그래프
abline(h=37, lty = 3, col = "red")     #추세선 을 나타내어 준다
summary(VADeaths)                      #summary <-요약

quakes                                 #지진 데이터 불러오기
x <- quakes$mag #변수 하나를 만들어 quakes$mag만 따로 추출
boxplot(x,col = "red", main="지진강도 데이터 분포")
summary(quakes)

============================================================================================================================================================
data(iris)            #꽃(식물)에 대한 데이타 품종 종류는 3종류만 있음(setosa, versicolor,virginica 각각 50개씩 저장 되어있다)
iris
str(iris)             #데이터 구조 보는 함수
summary(iris)
hist(iris$Sepal.Lengthm, xlim = c(4.3, 7.9))

summary(iris$Sepal.Width)
hist(iris$Sepal.Width,xlab = "iris$Sepal.Width", col = rainbow(12), main = "iris 꽃받침 너비 Histogram", xlim = c(2.0,4.5))
help(hist)

#======================================================================================================================

par(mfrow = c(1,2))
hist(iris$Sepal.Width,xlab = "꽃받침", col = rainbow(12), main = "iris 꽃받침 빈도수") #확률 밀도

hist(iris$Sepal.Width,xlab = "꽃받침", col = rainbow(12), main = "iris 꽃받침 너비 밀도", freq = F) #너비 밀도

#꽃잎의 길이 확률 밀도와 너비 확률밀도 그래프를 1행에 2개를 그리시오 

par(mfrow = c(1,2))
hist(iris$Petal.Length,xlab = "꽃받침", col = rainbow(12), main = "iris 꽃받침 길이 빈도수") #확률 밀도
lines(density(iris$Petal.Length), col = "red")

hist(iris$Petal.Width,xlab = "꽃받침", col = rainbow(12), main = "iris 꽃받침 길이 밀도", freq = F) #너비 밀도
lines(density(iris$Petal.Width), col = "blue")
#======================================================================================================================

par(mfrow=c(1,1))
hist(iris$Sepal.Width,xlab = "꽃받침", col = rainbow(8), main = "iris 꽃받침 길이 밀도", freq = F) #너비 밀도
lines(density(iris$Sepal.Width), col = "red")

x <- seq(2.0,4.5,0.1) #2.0 에서 5.0까지 0.1개의 간격으로 값을 준다
x  # 정규분포 ★★★★★★★★★★★★
curve(dnorm(x, mean = mean(iris$Sepal.Width), sd=sd(iris$Sepal.Width), col="blue", add = T )) 
#기존데이터에 추가하는 방식 x 데이터 로부터의 평균은

#======================================================================================================================
summary(quakes$mag)

x <-quakes$mag
y <-seq(4.0,6.5,0.5)#4.0부터 6.4 까지의 수치를 0.5칸씩 계급으로 설정하여 준다 ★★★★★★
y

hist(x, breaks = seq(4.0, 6.5, 0.5),col = rainbow(5))          #계급으로 설정하여 준다 ★★★★★★

#======================================================================================================================
#price 함수  

price <- runif(10, min = 1, max = 100)
price
plot(price)                           #사전도 그래프 표시
par(new=T)                            #속성설정정
line_chart = 1:100                    #대각선을 그리는 라인의 원료 1에서부터 100까지
line_chart
plot(line_chart, type = "l", col="red", axes = F, ann = F) # 다른속성은 전부 False로 만들어줌 Type은 L 라인으로 넣어준다
text(70, 80, "대각선추가", col = "blue") #특정 좌표 지정(x축이 위에서 내려온다)
par(mfrow=c(2,2))
plot(price, type = "l")      #실선 
plot(price, type = "o")      #원형과 실선(원형통과)
plot(price, type = "h")      #직선
plot(price, type = "s")      #꺽은선

#======================================================================================================================
par(mfrow = c(2,2))
plot(price, type = "o", pch =5)
plot(price, type = "o", pch =15)
plot(price, type = "o", pch =20, col = "blue")
plot(price, type = "o", pch =20, col="orange", cex=1.5)

par(mfrow = c(1,1))
plot(price, type = "o", pch=20, cex=2.0, lwd = 3, col="green")
plot(quakes$mag, type = "o", pch=20, cex=1.0, lwd = 1, col="green")

x <-c(1,2,3,4,2,4)    #6개의 숫자
y <-rep(2,6)          #2를 6회 반복
x
y

plot(x, y)            #점(point) 4개만 출력
xy.df <- as.data.frame(table(x,y))      #table 함수를 사용 하여 데이터 프레임 생성
xy.df
plot(x, y, pch=15,cex=0.5 * xy.df$Freq) #pch 점의 모양
install.packages("UsingR")
library(UsingR)
data(galton)
galton
help(galton)
table(galton$child,galton$parent)
galtonData <- as.data.frame(table(galton$child,galton$parent))
galtonData                                                        #Freq 프리퀀시: 빈도 잦음 진발 진동수 등의 의미를 가지고있음 



#======================================================================================================================

names(galtonData) <- c("child", "parent", "freq")
head(galtonData)
str(galtonData)

parent <-  as.numeric(galtonData$parent) # as.numeric 숫자형으로 변환
child <- as.numerinc(galtonData$child)  #factor 타입을 number 타임으로 변환환
parent
child
plot(parent, child, pch=21, cex = 0.2 * galtonData$freq, col="blue", bg="green") 
# freq 로 지정후 결과 값(테두리 컬러는 blue로 내부를 백그라운드를 사용하여 green 으로 바꾸어 준다)


#======================================================================================================================

head(iris)
pairs(iris[iris$Species == "virginica", 1:4]) #버지니카 품종 한정
#데이터 프레임을 사용하기 위해선 ,쉼표 를 사용한다[1:5 , 1부터 5개 까지 데이터를 나타내라 ]두번째 쉼표1:4- 1,2,3,4열만 나타내라]
pairs(iris[iris$Species == "setosa", 1:4])




install.packages("scatterplot3d")
library(scatterplot3d)

iris_setosa = iris[iris$Species == "setosa"   ,     ]  # 검색식
iris_versicolor = iris[iris$Species == "verslcolor"   ,     ]
iris_virginica = iris[iris$Species == "setosa"   ,     ]

iris_setosa

d3 <- scatterplot3d(iris$Petal.Length, iris$Sepal.Length, iris$Sepal.Width, type='n') #3d 기법인가...? X Y Z 축
d3$points3d(iris_setosa$Petal.Length, iris_setosa$Sepal.Length, iris_setosa$Sepal.Width, bg='orange', pch=21)
d3$points3d(iris_setosa$Petal.Length, iris_setosa$Sepal.Length, iris_setosa$Sepal.Width, bg='blue', pch=23)
d3$points3d(iris_setosa$Petal.Length, iris_setosa$Sepal.Length, iris_setosa$Sepal.Width, bg='green', pch=25)
# ↑ 위치 틀림 수정 해야함   #164페이지



x <-seq(10,20)  #10,11,12,13,14,15,16,17,18,19,20 # x축을 제시 안했으니 Y축의 값만 입력됨
x
y <- seq(1, 11)
y
plot(y, x)

# iris의 꽃받침 너비(x)와 꽃잎 너비(y)를 비교하는 그래프
# 그래프에 사용되는 데이터 타입은 반드시 숫자형 이어야함

plot(iris$Sepal.Width, iris$Petal.Width) #Sepal.width(꽃받침 너비)x , petal.width(꽃잎 너비)y


install.packages("dplyr")
install.packages("hflights")

#library 는 다시 실행 시켜주어야 한다
library(dplyr)
library(hflights)

iris %>% head()   #head(iris), %>% 와 두가지가 동일하게 사용된다


hflights_df <- tbl_df(hflights) # 그리드 형식으로 저장
hflights_df


hflights_df <- hflights %>% tbl_df()    #그리드 형식 테이블로 저장

dim(hflights_df)
filter(hflights_df, Month == 1 & DayofMonth ==2 ) # 2월 1일 Data

hflights_df %>% filter(Month == 1 & DayofMonth ==2)
hflights_df %>% filter(Month == 1 | Month == 2)

arrange(hflights_df, Year, Month, DepTime, ArrTime) 
# 위와 같은 순으로 기본적으로 오름차순으로 정렬된다

select(hflights_df, Year, Month, DepTime, ArrTime)

select(hflights_df, Year:ArrTime) # : 무엇무엇부터 무엇무엇까지

mutate(hflights_df,gain = ArrDelay - DepDelay)
#gain_per_hour - gain /(AirTime / 60))
select(mutate(hflights_df,gain = ArrDelay - DepDelay), Year, Month, gain)

summarise(hflights_df, avgAirTime = mean(AirTime,na.rm = T))

hflights_df %>% summarise(avgAirTime = mean(AirTime), na.rm = T)


str(iris) #스트럭션

species <- group_by(iris, Species)
str(species)
species



#======================================================================================================================
inner_join(df1,df2, by="x")  #X를 기준으로 같은것만 모아서 조인 (이너조인 이라고 부른다)
df1 <- data.frame(x = 1:5, y = rnorm(5))
df2 <- data.frame(x = 2:6, z = rnorm(5))
df1
df2


left_join(df1,df2, by="x")  #왼쪽 제품을 기준으로 왼쪽의 데이터는 유지 시킨 상태로 병합진행
right_join(df1,df2, by="x")
full_join(df1, df2, by="x") # 두가지 데이터 전부를 살링 상태로 병합진행하여 나타냄



df1 <- data.frame(x = 1:5, y=rnorm(5))
df2 <- data.frame(x = 6:10, y=rnorm(5))
df3 <- data.frame(z = 1:5)
df_cols <- bind_cols(df1, df3)
df_cols
#df_rows <-bind_rows(df1,df2)                 #행단위로 합침
#df_rows

df_rename <- rename(df_cols, x1 = x)
df_rename


#iris에서 3 개의 품종을 각각 df1, df2, df3 에 저장
# df_all 이란 이름으로 변수에 행단위 병합(vergi... , versi, setosa 순으로 저장을 하시오

summary(iris)
df1 <- iris[iris$Species == "setosa", ]
df1
df2 <- iris[iris$Species == "virginica", ]
df3 <- iris[iris$Species == "versicolor", ]
df_all <- bind_rows(df3, df2)
df_all <- bind_rows(df_all, df1)
df_all
========================================================================================================================================================


#다운로드 주소 , 가메출판사 , 게시판 , 소스자료실 :[G295]빅 데이터 분석을 위한 R 프로그래밍 개정판(2nd Edition) - R Scripts
install.packages("reshape2")
library(reshape2)

data <- read.csv("C:\\bigdataR\\PartII/data.csv", header = T) #file.choose()      #파일을 불러온후
data

wide <- dcast(data, Customer_ID~Date, sum)      #wide 를 이용하여 넓게 펼치며 sum으로 더하여 중복날짜를 전부 더해준다
wide

setwd("C:\\bigdataR\\PartII")
write.csv(wide, "wide_.csv", row.names = FALSE) # row.names = FALSE 를 이용하여 행이름을 삭제후 저장
wide <- read.csv("wide_.csv")
# colnames(wide) wide 파일에 대한 행이름을 출력하여 준다
colnames(wide)<-c('Customer_ID','day1','day2','day3','day4','day5','day6','day7') #각각의 행에 대한 name바꾸는용어
wide

long <- melt(wide, id = "Customer_ID") #melt를 이용하여 형식을 long format 형식으로 돌려준다
long

colnames(long)<- c("Customer_ID","Date","Buy")
head(long)

data("smiths")
smiths

long <- melt(smiths, id = 1:2, smiths) #1열부터 2열까지
long

wide <- dcast(long, subject + time~...) #긴 형식을 넓은 형식으로 변경하기
wide

airquality     # 뉴욕의 특정 기간 대기질 저장
help("airquality")
names(airquality)       # 열 이름
names(airquality) <- toupper(names(airquality))   #toupper 대문자로 변경해주는 용어

air_melt <-melt(airquality, id=c("MONTH","DAY"),na.rm = T)
head(air_melt)
names(air_melt)<- tolower(names(air_melt))
acast <- acast (air_melt, day ~ month ~ variable) #행, 열, 연 순서로 작성 하여 준다
acast

acast2 <- acast(air_melt, month ~ variable, mean, margins = T)    #평균을 측정 하여 나타낸다
acast2

#--------------------------------------------------------------------------------------
#실습용 데이터 가져오기
getwd()                                          #현재 작업디렉터리 읽어오는 함수
dataset <- read.csv("dataset.csv", header = T)    #헤더가 있는경우 True 로 진행한다
dataset                                           #열 이름:resident, gender job, age, position, price,survey
print(dataset)
View(dataset)
head(dataset)     #상위 6개의 데이터를 본다
tail(dataset)     #하위 6개의 데이터를 본다
attributes(dataset)
str(dataset)
summary(dataset)  #기술 통계량을 나타낸다(최대 , 최소, 개수, 평균, 중앙값, 합계, 분산, 표준편차 )

dataset$age
dataset$resident
lengths(dataset$age) # 나이에 대한 개수 측정

x <- dataset$gender
x
y <- dataset$price
y

plot(dataset$price)   #전부 생략한수 그릴경우 y축, x축은 인덱스로 설정됨 (특정 데이터에 대한 그래프를 그려주는)

dataset["gender"]
dataset$gender #vector 형식으로 출력

dataset[1 , 2]      #  , 기준으로 왼쪽은 행 오른쪽은 열
names(dataset)
dataset[c("job" , "price")]         #job 과 price 열 조회
dataset[c(2,6)]                     #2번째와 6번째(gender,price) 열 조회회
dataset[c(1,2,3)]                   #1~3열(resident,gender,age) 조회
dataset[c(2, 4:6, 3, 1)]            #gender,age,position,price,job,resident 열 조회
dataset[-c(1:100), ]
#rn을 True로 변경시 NA를 제거하여 준다

summary(dataset$price)
sum(dataset$price, na.rm = T) # NA 제거 후 합계계

price2 <- na.omit(dataset$price) #omit 잘려나라는 함수 , NA제거
sum(price2)

x <- dataset$price
x
dataset$price2 <- ifelse(!is.na(x), x , 0 )   #! NOT 으로 형용됨 NA가 아닐 경우 x, NA일 경우 0의 값을 준다
names(dataset)
dataset$price2
dataset$price2[1:30]
roundmean(mean(x,na.rm = T), 2) #소수2째자리 반올림한 평균

dataset$price3 <- ifelse(!is.na(x) , x ,round(mean(x,na.rm = T),2))
dataset$price3[1:30]
dataset[c(1:30) , c("price", "price2", "price3")]


table(dataset$gender)     #빈도수를 정리 시켜주는 함수

pie(table(dataset$gender), )   #pie 그래프 도출

dataset <- subset(dataset, gender==1 | gender ==2 )
dataset
length(dataset$gender)    #len 함수를 이용하여 개수를 세는데 dataset개수만 봤을땐 열의수만 나타남

dataset <- read.csv("dataset.csv", header = T)
dataset$price
summary(dataset$price)

#서브셋 : 부분집합 함수
dataset2 <- subset(dataset , price >= 2 & price <= 8 )
dataset2
length(dataset2$gender)
summary(dataset2$price)
summary(dataset2$age)

dataset2 <- subset(dataset2 , age >= 20 & age <= 69 )
dataset2
length(dataset2$age)
boxplot(dataset2$age,col = "red")

boxplot(dataset$price, col = "blue")

boxplot(dataset$price)$stats
dataset_sub <- subset(dataset, price >= 2.1 & price <= 7.9)
summary(dataset_sub$price)

dataset2
dataset2$resident2[dataset2$resident == 1] <- '1.서울특별시' #행과 관련된 정보만 넣을수있다
dataset2$resident2[dataset2$resident == 2] <- '2.인천광역시'
dataset2$resident2[dataset2$resident == 3] <- '3.대전광역시'
dataset2$resident2[dataset2$resident == 4] <- '4.대구광역시'
dataset2$resident2[dataset2$resident == 5] <- '5.기타시군'
dataset2[ , c("resident","resident2")]

dataset2$age2[dataset2$age <= 30] <-"청년층"
dataset2$age2[dataset2$age > 30 & dataset2$age <= 55]<- "중년층"
dataset2$age2[dataset2$age > 55] <- "장년층"
head(dataset2)

survey <-dataset2$survey
survey
csurvey <- 6 - survey         #역코딩은 순서를 바꾸어 주는 함수 1이 5로 변함
csurvey

dataset2$survey <- csurvey
head(dataset2)
getwd()
new_data <- read.csv("new_data.csv", header = T, fileEncoding = "euc-kr")   #가져와야할 파일에 한글이 섞여 있을시 파일 인코딩
head(new_data)
str(new_data)

resident_gender <- table(new_data$resident2, new_data$gender2)
gender_resident <- table(new_data$gender2, new_data$resident2)

barplot(resident_gender, beside = T, col = rainbow(9), legend=row.names(resident_gender), horiz = T, mail) #horiz 를 T로 바꾸면 가로로

barplot(resident_gender, beside = T, horiz = T, col = rainbow(5), legend = row.names(resident_gender), main = '성별에 따른 거주지역 분포 현황')

barplot(resident_gender, beside = T, horiz = T, col = rep(c(2,4),5), legend = c("남자", "여자"), main = ' 거주지역 성별 분포 현황')

install.packages("lattice")


densityplot(~ age, data = new_data, groups = job2, auto.key = T)


densityplot(~price | factor(gender2),data = new_data,groups = position2, plot.points = T, auto.key = T) #~바로 앞에 써주는 x축 데이타


densityplot(~price | factor(position2),data = new_data,groups = gender2, plot.points = F, auto.key = T) #plot.points 를 F로밀도삭제

xyplot(price ~ age | factor(gender2), data = new_data)


setwd("C:/bigdataR/PartII")
user_data <-read.csv("user_data.csv", header = T , fileEncoding = "euc-kr")
head(user_data)
table(user_data$house_type)
length(user_data$house_type)
house_type2 <- ifelse(user_data$house_type == 1 | user_data$house_type == 2,0,1) # 단독주택, 다가구 : 0 , 아파트, 오피스텔 :1
#↑ 파생변수 더미 변수 라고 부른다

#_= proc(aaa)   _는 의미없는 더미변수
house_type2[1:10]       
user_data$house_type2 <- house_type2      #하우스 타입 2를 저장하여 나타낸다
head(user_data)

library(lattice)
library(dplyr)
library(reshape2)
pay_data <- read.csv("pay_data.csv", header = T, fileEncoding = "euc-kr")
head(pay_data)
table(pay_data$product_type)
product_price <- dcast(pay_data, user_id~product_type, sum, na.rm= T)
head(product_price)

#===============================================================================================================
#2022년  9월 16일

@ -104,9 +104,8 @@ dim(testing)
# 동일한 데이터셋을 N등분하여 N-1개의 학습데이터로 하고
# 나머지 1을 검정데이터로 이용

# K겹 교차 검정 데이터셋 알고리즘 사용
# EX) N = 3 => N1 = D1, D2, D3 | N2 = D1, D2, D3 | N3 = D1, D2, D3
# EX) K = 3 => 검정:학습1/학습2 => N1 -> D1:D2/D3 | N2 -> D2:D1/D3 | N3 -> D3:D1/D2
# K겹 교차 검정 데이터셋 알고리즘 사용 ( K fold )
# EX) K = 3 => 검정:학습1/학습2 => 1겹 -> D1:D2/D3 | 2겹 -> D2:D1/D3 | 3겹 -> D3:D1/D2

name <- c('a', 'b', 'c', 'd', 'e', 'f')
score <- c(90, 85, 99, 75, 65, 88)
@@ -117,3 +116,74 @@ df <- data.frame(Name = name, Score = score)
install.packages("cvTools")
library(cvTools)
                                          # 교차 검정을 위한 패키지 설치 및 로드
cross <- cvFolds(n = 6, K = 3, R = 1, type = "random")
                                          # cvFolds(n = 요소 개수, K = K겹, R = 반복횟수, type = "추출 방법" )
                                          # K겹 교차 검정 데이터 셋 생성
str(cross)

cross$subsets[cross$which == 1, 1]        # K = 1인 경우 -> 2, 6 = test : train = 5, 4, 3, 1  
cross$subsets[cross$which == 2, 1]        # K = 2인 경우 -> 1, 5 = test : train = 6, 4, 3, 2
cross$subsets[cross$which == 3, 1]        # K = 3인 경우 -> 3, 4 = test : train = 6, 5, 2, 1

r = 1                                     # 반복 횟수
K = 1:3                                   # K겹 교차 검정

for(i in K){                              # K회 반복
  data_ind <- cross$subsets[cross$which == i, r]
                                          # data_ind에 which가 i인 r열 데이터를 임시로 담는다.
  cat('K = ', i, '검정데이터 \n')
  print(df[data_ind, ])
                                          # data_ind를 인덱스 삼아 df에서 검정데이터를 추출한다.
  cat('K = ', i, '훈련데이터 \n')
  print(df[-data_ind, ])                  # 검정데이터의 인덱스를 제외한 나머지 데이터를 훈련데이터로 추출한다.
}


컨트롤 씨프트 C 키를 누를시 선택한 데이터를 주석처리 가능 주석 해지시도 가능


============================================================================================================================

install.packages("lattlce")
library(lattice)
library(stringr)
head(quakes)
summary(quakes$depth)

depthgroup <- equal.count(quakes$depth, number=5, overlap=0)    #overlap 겹치는것 0으로 놓을시 겹치는것이 없어짐
depthgroup
xyplot(lat ~ long | depthgroup, data = quakes) #depthgroup에 있는 데이타가 특정 구역에있다고 표기 하기위해 data = quakes 를 지정하여준다

magnitudegroup <- equal.count(quakes$mag, number = 2, overlap = 0)        #2개의 그룹으로 추출
magnitudegroup

xyplot(lat ~ long | magnitudegroup, data = quakes)


#깊이와 진도를 합성해서 표현

xyplot(lat ~ long | depthgroup * magnitudegroup, data = quakes)     #depthgroup 과 magnitudegroup을 곱하여 10개의 데이터 차트가 나온다

quakes$depth3[quakes$depth >= 39.5 & quakes$depth <= 80.5] <- 'd1'
quakes$depth3[quakes$depth >= 79.5 & quakes$depth <= 186.5] <- 'd2'
quakes$depth3[quakes$depth >= 185.5 & quakes$depth <= 397.5] <- 'd3'
quakes$depth3[quakes$depth >= 396.5 & quakes$depth <= 562.5] <- 'd4'
quakes$depth3[quakes$depth >= 562.5 & quakes$depth <= 680.5] <- 'd5'
head(quakes)

quakes$mag3[quakes$mag >= 3.95 & quakes$mag <= 4.65] <- 'm1'
quakes$mag3[quakes$mag >= 4.55 & quakes$mag <= 6.45] <- 'm2'
head(quakes)

xyplot(lat ~ long | factor(depthgroup) * factor(magnitudegroup), data = quakes)
convert <- transform(quakes, depth3 = factor(depth3), mag3 = factor(mag3))
str(convert)    #두개의 열을 factor 타입으로변환  
str(quakes)

xyplot(lat ~ long | depth3 * mag3, data = convert, col=c("red","blue"))

# conplot 그래프는 구간 처리한 변수가 필요없음
coplot(lat ~ long | depth, data = quakes, overlap = 0.1)      #겹치는 구간 0.1
coplot(lat ~ long | depth, data = quakes, number = 5, rows = 1, overlap =  0.1, col = 'blue', bar.bg = c(num='green'))

#진도를 5개 구간으로 조건그래프
coplot(lat ~ long | mag, quakes, number = 5, rows = 1, overlap =  0, col = 'blue', bar.bg = c(num='green'))


cloud(depth ~ lat * long, data = quakes)        # ~필드마크 앞에 지정하는 값이 z축 

#ggplot2
install.packages("ggplot2")
library(ggplot2)
data(mpg)
str(mpg)
help(mpg)
#quakes(지진), iris(꽃), mpg(자동차 연비효율), mtcars, diamonds
#mpg(1999년부터 2008년 사이의 가장 대중적인 모델 38개 자동차에 대한 연비효율을 기록한 데이터 )
head(mpg)
summary(mpg)
help(qplot)

qplot(  hwy  ,   data = mpg, fill=drv, binwidth=2   )

qplot(  hwy  ,   data = mpg, fill=drv, binwidth=2, facets = .~drv   ) # 열단위


qplot(  hwy  ,   data = mpg, fill=drv, binwidth=2, facets = drv ~.   )  #행단위, 빈도수

qplot(displ, hwy, data=mpg) # 앞쪽이 x축 뒷쪽이 y축 순서
qplot(displ, hwy, data=mpg, color=drv, facets = .~drv)
qplot(displ, hwy, data=mpg, color=drv)

help(mtcars)
mtcars
str(mtcars)
qplot(wt, mpg ,data = mtcars, color=factor(carb), size=qsec )     #그룹화 시킬때는 factor 함수 사용 필수(범주형으로 변경)

qplot(wt, mpg ,data = mtcars, color=factor(carb), size=qsec, shape=factor (cyl) )

help(diamonds)
head(diamonds)
str(diamonds)

#qplot(clarity, data=diamonds, fill=cut, geom="bar", colour=cut)    #fill 채우기 속성
qplot(clarity, data=diamonds, geom="bar", colour=cut) #채우기 속성을 제외후 결과값

str(mtcars)
qplot(wt, mpg, data=mtcars, size=qsec, "point") #산점도
qplot(wt, mpg, data=mtcars, size=factor(cyl), color=factor(carb))

qplot(wt, mpg, data=mtcars, size=factor(cyl))
qplot(wt, mpg, data=mtcars, size=qsec, color=factor(carb) , shape=factor(cyl))

qplot(wt, mpg, data=mtcars, geom=c("point","smooth"), color=factor(cyl))

qplot(wt, mpg, data=mtcars, geom=c("line"))
qplot(wt, mpg, data=mtcars, geom=c("point","line"),color=factor(cyl))

# ggplot 그래프

ggplot(diamonds, aes(carat, price)) + geom_point() # 축설정 앞은 x 뒤는 y(aes(carat,price)), geom_point(산전도)


p <- ggplot(diamonds, aes(carat, price, color=cut))
p + geom_point()

p <- ggplot(mtcars, aes(mpg, wt, color=factor(cyl)))
p + geom_line() #선그리는 그래프

p + geom_point()

p <- ggplot(diamonds, aes(price))
p
p + stat_bin(aes(fill=cut), geom="bar")   #히스토 그램과 요인의 합성결과
p + stat_bin()      #기본형 히스토그램
p + stat_bin(aes(fill=..density..)) #밀도의 크기를 알아보는 density

p + stat_bin(aes(fill=cut), geom="area")
p + stat_bin(aes(color=cut, size=..density..), geom="point")


library(UsingR)
help(galton)
head(galton)
tail(galton)
data("galton")
p <- ggplot(data = galton, aes(x=parent, y = child))
p + geom_count()
p + geom_count() + geom_smooth(method = "Im")
p

getwd()
setwd("C:/bigdataR")

p <- p + geom_count() + geom_smooth(method = "Im")
p
ggsave(file="diamond.jpg",plot=p) # 그려진 그래프 사진저장 명령어

install.packages("ggmap")
library(ggmap)
library(stringr)

seoul <- c(left = 126.77, bottom = 37.40, right = 127.17, top = 37.70)
map <- get_stamenmap(seoul,zoom = 12, maptype = 'terrain')
ggmap(map)


pop <- read.csv(file.choose("C:/bigdataR/population201901.csv"), header = T)
pop
region <- pop$지역명
lon <- pop$LON
lat <- pop$LAT
tot_pop <- as.numeric(str_replace_all(pop$총인구수, ',' , ''))
tot_pop
df <- data.frame(region, lon, lat, tot_pop)
df
df <- df[ 1:17 ,  ]
df

daegu <- c(left=123.44, bottom=32.85, right=131.60, top=38.87)
map <- get_stamenmap(daegu, zoom = 7, maptype = 'watercolor')
layer1 <- ggmap(map)
layer1

layer2 <- layer1 + geom_point(data=df, aes(x=lon, y=lat, color=factor(tot_pop), size=factor(tot_pop)))
layer2

layer3 <- layer2 + geom_text(data = df, aes(x = lon + 0.01, y = lat + 0.08, label = region), size=3)
layer3

ggsave("pop.png",width = 10.24, height = 7.68)

#1번. depth와 mag를 3행 2열 패널로 산점도 그리기(xplot)
a <-equal.count(quakes$depth, number=3, overlap=0)

b <-equal.count(quakes$mag, number=2, overlap=0)

xyplot(lat ~ long | a*b, data=quakes, main="Fiji Earthquakes", ylab="latitude", xlab="longitude",
       pch="@",col=c("red","blue"))
aes


#2번. iris 데이터셋의 Sepal.length(x) 와 Sepal.width(y)와 관계를 나타내는 그래프를 그리고 , 3가지 품종별로 다른 색상과 도형으로 표시(ggplot 함수 사용)

attributes(iris) #iris3 데이터 셋의 칼럼명을 확인
str(iris) #iris3 데이터 셋의 구조를 확인

p <- ggplot(data = iris, aes(x=Sepal.Length, y = Sepal.Width)) #축에 들어갈 재료 iris , aes를 사용 하여 x축과 y축을 적용
p
p + geom_point(aes(color=Species, shape=Species))

#3번. iris품종별로 petal.length 와 petal.width의 관계를 서로 다른 패널에 표시 #xyplot(함수 사용)

p <- ggplot(data = iris, aes(x=Petal.Length, y = Petal.Width))
p
p + geom_point(aes(color=Species, shape=Species))

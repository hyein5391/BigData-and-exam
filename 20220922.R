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






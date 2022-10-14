#===================================================================
#네트워크 방식으로 불러오기

install.packages("httr")
install.packages("XML")
library(httr)
library(XML)
library(stringr)
url <- "http://media.daum.net/"
web <- GET(url)
web                   #지정된 url에 접속해서 html 소스코드를 반환

html <- htmlTreeParse(web, useInternalNodes = T, trim = T, encoding = "utf-8")
html

rootNode <- xmlRoot(html)  #최상위 노드 찾기
rootNode

news <- xpathSApply(rootNode, "//a[@class = 'link_txt']", xmlValue) #해당되는 모든 노드를 탐색하여 벡터로 저장(문자열)
news

news_pre <- gsub("[\r\n\t]", '', news) #특수 문자를 찾아서 제거
news_pre
new_pre <- gsub("[[:punct:]]", '' , news_pre) #문장 부호를 나타내는 패턴 ''시 공백처리
new_pre

news_pre <- gsub("[[:cntrl:]]", '' , news_pre) #특수문자 제거
news_pre

news_pre <- str_trim(news_pre) #좌우측 문자열 공백 제거
news_pre


getwd()
setwd("C:/bigdataR")
write.csv(news_pre, "news_data.csv", quote = F, fileEncoding = "euc-kr")    #큰따옴표 저장하지 않음 quote = F

news_data <- read.csv("news_data.csv", header = T, fileEncoding = "euc-kr")
news_data
str(news_data)

names(news_data) <- c("No", "News_txt") #열이름 변경
news_data

write.csv(news_data, "news_final.csv", fileEncoding = "euc-kr", row.names = F)





# 코로나19 사이트의 뉴스%이슈에서 번호, 제목, 담당을 스크레이핑
url <- "http://ncov.kdca.go.kr/tcmBoardList.do?brdId=&brdGubun=&dataGubun=&ncvContSeq=&contSeq=&board_id=140&gubun="
web <- GET(url)
web  

html <- htmlTreeParse(web, useInternalNodes = T, trim = T, encoding = "utf-8")
html

rootNode <- xmlRoot(html)  #최상위 노드 찾기
rootNode

ncovs <- xpathSApply(rootNode, "//div[@class='board_list']//tbody/tr/td[1]", xmlValue) #해당되는 모든 노드를 탐색하여 벡터로 저장(문자열)
ncovs
ncovsubject <- xpathSApply(rootNode, "//a[@class'bl_link']",xmlValue)

ncov <- xpathSApply(rootNode, "//div[@class='board_list']//tbody/tr/td[3]", xmlValue) #해당되는 모든 노드를 탐색하여 벡터로 저장(문자열)
ncov

ncovsubject <- xpathSApply(rootNode, "//div[@class'board_list]//tbody/tr/td[3]",xmlValue)

ncovdate <-xpathSApply(rootNode, "//div[@class='board_list']//tbody/tr/td[4]", xmlValue)
ncovdate


#=====================================================================================================
#반복문을 사용하여 각 페이지 불러온다

df <- data.frame(번호 = NULL, 제목 = NULL, 담당 = NULL, 날짜=NULL)  #공백 데이터프레임

for (      i     in       c(1:10)         ) {
  url <- paste("http://ncov.kdca.go.kr/tcmBoardList.do?pageIndex=1&brdId=&brdGubun=&board_id=140&search_item="  ,i,  "&search_content=", sep = "")

web <- GET(url)                  #지정된 url에 접속해서 html 소스코드를 반환
html <- htmlTreeParse(web, useInternalNodes = T, trim = T, encoding = "utf-8")
rootNode <- xmlRoot(html)  #최상위 노드 찾기
covidNum <- xpathSApply(rootNode, "//a[@class='board_link']//tbody/tr/td[1]",xmlValue)
covidSubjet <- xpathSApply(rootNode, "//div[@class='bl_link", xmlValue)
covidPart <- xpathSApply(rootNode, "//div[@class='board_link']//tbody/tr/td[3]",xmlValue)
covidDate <- xpathSApply(rootNode, "//div[@class='board_link']//tbody/tr/td[4]",xmlValue)

subdf <- data.frame(번호 = covidNum, 제목 = covidSubjet, 담당 = covidPart, 날짜=covidDate = covidDate)
df <- rbind(df, subdf)
}
df



#===============================================================================================================
#옥션 웹 크롤링
searchName <- URLencode(iconv("노트북", "euc-kr", "utf-8"))

url <- paste("http://browse.auction.co.kr/search?keyword= "   ,searchName, " &itemno=&nickname=&frm=hometab&dom=auction&isSuggestion=No&retry=&Fwk= "   ,searchName, "      &acode=SRP_SU_0100&arraycategory=&encKeyword= "   ,searchName, "   &v=l", sep = "")
url
web <- GET(url)
web
html <- htmlTreeParse(web, useinternalNodes = T, trim = T, encoding = "utf-8")
rootNode <- xmlRoot(html)
rootNode
productName <- xpathSApply(rootNode, "//span[@class='text--title']",xmlValue)
productName

productPrice <- xpathSApply(rootNode, "//strong[@class='text--price_seller']", xmlValue)
productPrice
productPrice <- gsub(",", "", productPrice)  #쉼표 제거
df <- data.frame(품명 = productName, 단가=productPrice)
df
write.csv(df, "auction.csv", row.names = F, fileEncoding = "euc-kr") 
#===========================================================================================================================






#============================================================================================================================
write.csv(covid_df, "Covid.csv", row.names = F, fileEncoding = "euc-kr")
# csv 파일로 저장


# 반복문을 이용하여 여러 페이지의 데이터를 저장
# 1~10 페이지

covid_df <- data.frame(No = NULL, Title = NULL, Author = NULL, Date = NULL)
# 데이터가 누적되어 들어갈 df

for(i in c(1:10)){
  url <- paste("http://ncov.kdca.go.kr/tcmBoardList.do?pageIndex=",i,"&brdId=&brdGubun=&board_id=140&search_item=1&search_content=", sep = "")
  # paste( str1, num1, ..., sep="구분자" )  -> 구분자로 여러 데이터형을 연결
  # 구분자의 기본값은 " "
  HTML <- GET(URL)
  HTML <- htmlTreeParse(HTML, useInternalNodes = T, trim = T, encoding = 'utf-8')
  root <- xmlRoot(HTML)
  
  number <- xpathSApply(root, "//div[@class = 'board_list']//tbody/tr/td[1]", xmlValue)
  
  author <- xpathSApply(root, "//div[@class = 'board_list']//tbody/tr/td[3]", xmlValue)
  
  title <- xpathSApply(root, "//a[@class = 'bl_link']", xmlValue)
  
  date <- xpathSApply(root, "//div[@class = 'board_list']//tbody/tr/td[4]", xmlValue)
  
  sub <- data.frame(No = number, Title = title, Author = author, Date = date) 
  # 결합을 위해 임시로 만든 df
  covid_df <- rbind(covid_df, sub)                # 행기준 결합
}

write.csv(covid_df, "Covid_1to10.csv", row.names = F, fileEncoding = "euc-kr")


# 쇼핑몰 스크래핑

searchName <- URLencode(iconv("노트북", "euc-kr", "UTF-8"))
searchName
url <- paste("http://browse.auction.co.kr/search?keyword=", searchName, "&itemno=&nickname=&frm=hometab&dom=auction&isSuggestion=Yes&retry=&Fwk=", searchName, "&acode=SRP_SU_0100&arraycategory=&encKeyword=", searchName, sep = "")

html <- GET(url)                                  # 주소에 한글이 들어가면 인코딩 된 후후 들어가야함


# 한글 인코딩 처리

searchName <-
  
  url <- 
  
  html <- GET(url)
html <- htmlTreeParse(html, useInternalNodes = T, trim = T, encoding = 'utf-8')
root <- xmlRoot(root)

s_title <- xpathSApply(root, "//span[@class = 'text--title']", xmlValue)
#=========================================================================================================================

url <- "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=SyDxU1fZhs5bxdV3Uy9pwqEIgdmXRFEedsH0fdk52etyVn9pTU1zqj4Apm0aMHNXAfTCoXMNoHcyxXb%2Bgjrjcw%3D%3D&returnType=xml&numOfRows=100&pageNo=1&sidoName=%EC%B6%A9%EB%B6%81&ver=1.0"

xmlFile <- xmlParse(url) #파서를 이용하여 저장
df <- xmlToDataFrame(getNodeSet(xmlFile, "//item"))   #반복탐색하며 item 내용을 저장한다
df
df$statlonName

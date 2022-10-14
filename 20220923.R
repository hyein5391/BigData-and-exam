install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")

Sys.setenv(JAVA_HOME="C:\\bigdataR\\jdk-11")


library(rJava)
library(DBI)
library(RJDBC)
drv <- JDBC(driverC = "com.mysql.jdbc.Driver", "C:\\bigdataR\\mysql-connector-java-5.1.49.jar")

drv <- JDBC(driverClass = "com.mysql.cj.jdbc.Driver",
            "C:\\bigdataR\\mysql-connector-java-5.1.49.jar")
conn <-dbConnect(drv, "jdbc:mysql://127.0.0.1:3306/work","scott","tiger")

query = "select * from goods"
goodsAll <- dbGetQuery(conn, query)
goodsAll

query = "select * from goods where su >=3"
goodsOne <- dbGetQuery(conn, query)
goodsOne

query = "SELECT * FROM goods order by dan desc"
dbGetQuery(conn, query)

insert.df <- data.frame(code = 5, name = '식기세척기', su = 1, dan = 250000)
insert.df

dbWriteTable(conn, "goods1" ,insert.df)    #데이터프레임을 새로운 테이블에 일괄 입력 

query = "select * from goods1"
goodsAll <- dbGetQuery(conn, query)
goodsAll

recode <- read.csv("C:\\bigdataR\\recode.csv", header = T, fileEncoding = 'euc-kr')
recode
dbWriteTable(conn, "goods2", recode)

# goods2 테이블 조회

query = "select * from goods2"
goodsAll <- dbGetQuery(conn, query)   # 쿼리 실행 후 반환 
goodsAll

# goods2 테이블에 행 추가
query = "insert into goods2 values(6, 'test', 1, 1000)"
dbSendUpdate(conn, query) #반환 없이 실행만 진행

query = "update goods2 set name = '테스트' where code = 6"      #내용 변경시 사용
dbSendUpdate(conn, query)
query = "select * from goods2"
goodsAll <- dbGetQuery(conn,query)
goodsAll

query <- "delete from goods2 where code = 6"        #특정 코드 내용을 삭제 한다
dbSendUpdate(conn, query)

# code 가 6 단가 20만원인 "청소기" 2개를 추가
query = "insert into goods2 values(6, '청소기', 2, 200000)"
dbSendUpdate(conn, query)

# 단가 60만원 보다 큰 상품에 대해 수량을 5로 수정
query = "update goods2 set su = 5 where dan > 600000"
#query = "update goods2 set su = 5 where code = 4"
#query = "update goods2 set su = 5 where code = 1"#내용 변경시 사용
dbSendUpdate(conn, query)

# 수량이 1인 상품을 삭제
query <- "delete from goods2 where su = 1"        #특정 코드 내용을 삭제 한다
dbSendUpdate(conn, query)
query = "select * from goods2"
goodsAll <- dbGetQuery(conn,query)
goodsAll

# 각 문법이 실행될 때마다 전체 테이블 조회
# 특정 문자로 시작하거나 끝나는 문자열(like, %사용)
query <- "select * from goods2 where name like '%기' "   #%는 모든 문자를 말하고 마지막은 기 <--- 가와야 한다
goodsAll <- dbGetQuery(conn,query)   #쿼리 실행후 반환
goodsAll

# 일부 열의 데이터만 추가
query <- "insert into goods2 (code, name) values(7, '안마의자')"
dbSendUpdate(conn, query)

# 복수의 열에 대해 수정
query <- "update goods2 set su = 1 , dan = 560000 where code = 2"
dbSendUpdate(conn, query)

# DML(Data Manipulatlon Language) : 데이터 조작어
# select, insert, update, delete
# select 필드명리스트 from 테이블명 where 조건절 order by 정렬키 순서
# insert into 테이블명 (필드리스트) values(값리스트)
# update 테이블명 set 필드명1 = 값1, 필드명2= 값2........ where 조건절
# delete from 테이블명 where 조건절






# shopUser, shopProduct, shopSale 의 테이블 생성
# shopUser : uid(문자열10)키, uname(문자열(varchar)20), uage(정수)
# shopProduct : pCode(int)키, pName(문자열20), pPrice(int)
# shopSale : uid, pCode, sCount(int)

# 테이블 삭제시 drop table(테이블명)



query <- "select * from goods2 where name like '%기' "   #%는 모든 문자를 말하고 마지막은 기 <--- 가와야 한다
goodsAll <- dbGetQuery(conn,query)

# 김삿갓이 구매한 내역에 대해 성명, 상품명, 수량을 출력
query <- "SELECT u.uname, p.pName, s.sCount,  p.pPrice * s.sCount subtot
	FROM shopuser u, shopproduct p, shopsale s
	WHERE u.uid = s.uid AND p.pCode = s.pCode
		AND u.uname = '김삿갓'"

goodsAll <- dbGetQuery(conn,query)   #쿼리 실행후 반환
goodsAll

#===================================================================
#네트워크 방식으로 불러오기






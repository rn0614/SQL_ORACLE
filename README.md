# Oracle (SQL)

## 목차

1. DBMS란? , ORACLE의 구조
2. 데이터 타입 
3. PRIMARY, FOREIGN KEY
4. 함수





## ch1 DBMS 개요 및 Oracle

> DBMS ( ): 여러명이 데이터 베이스의 공유 및 접근을 관리하는 프로그램
>
> 무결성 : 데이터 베이스의 제약 조건(있어야 하는 값)
>
> 독립성 : 데이터베이스와 프로그램은 서로 독립적인 관계
>
> 관계형DBMS :  테이블형 데이터베이스
>
> SQL : 관계형 DBMS 에서 사용 되는 언어(오라클에서 DBMS관리하는 언어)
>
> 대소문자 구분 안함
>
> sql 코드 작성과 테이블이 따로 있는 구조





## ch2 데이터 타입

데이터 유형

CHAR, NCAHR, VARCHAR, NVARCHAR, DATE, NUMBER

크게 문제가 없다면 DATE(날짜), VARCHAR2(가변형문자열), NUMER(숫자)

로 구성해도 크게 문제가 없다. 다만 SUM등의 함수를 쓸 때는 NUMBER의 데이터 타입 사용

- 널 아님: 널 값이 들어가면 안되는 열에 체크





## CH3 함수

> 데이터 정의어(DDL) : 테이블이나 관계의 구조 생성 : `CREATE` , `ALTER` , `DROP`
>
> 데이터 조작어(DML) : 테이블 데이터를 수정 : `SELECT` , `INSERT` , `DELETE` , `UPDATE` 
>
> 데이터 제어어(DCL) : 사용 권한을 관리 : `GRANT` , `REVOKE` , `COMMIT` , `ROLLBACK`





- 테이블 생성 : `CREATE TABLE "테이블이름"`

- 테이블 삭제 : `DROP TABLE "테이블이름"` 
- `PRIMART KEY`, `FOREIGN KEY` 설정
- 데이터 속성 `NOT NULL` , `DEFAULT` , `CHECK`
- 타입 `VARCHAR2` : 가변 문자열 , `NUMBER` : 숫자  , `DATE` : 날짜

``` sql
CREATE TABLE 테이블이름1(		-- 테이블 생성
    열1 타입1(타입크기1),	   -- 열생성
    열2 타입2(타입크기2) NOT NULL,-- 널 아님(널 값이 열에 들어갈 수 없음) 
    
    
    열3 타입3(타입크기3) DEFAULT 초기값 CHECK(조건식) -- 초기에 초기값 들어가고 CHECK에 조건 만족하는 데이터만 열 삽입 가능
    
    --기본키 설정 방법
    열4 타입4(타입크기4) PRIMARY KEY, --(방법1) 열3을 기본키로 설정
    CONSTRAINT PK_열1 PRIMARY KEY(열1) -- (방법2)열1을 기본키로 설정    
);

CREATE TABLE 테이블이름2(
	열11 타입11(타입크기11),
	열12 타입12(타입크기12),
	열13 타입13(타입크기13),
	
    -- 열1과 연동되는 열11(외래키 *입력순서 주의)
    CONSTRAINT FK_열11_열1 FOREIGN KEY (열11) REFERENCES 테이블1 (열1)
);


--테이블 삭제
DROP TABLE 테이블명;
```



- INSERT() : 데이터 입력
- DELETE() : 데이터 삭제
- UPDATE() : 데이터 수정

``` SQL
 INSERT INTO 테이블명 ( 열1, 열2 , 열3 )
 VALUES(값1, 값2, 값3) -- 값은 문자열일 경우 ''(작은 따움표)로 감싼다.
 
 --값을 한번에 다 넣는다.
 INSERT ALL
 INTO 테이블명 VALUES(값1, 값2, 값3)
 INTO 테이블명 VALUES(값1, 값2, 값3)
 
 --삭제
 DELETE FROM 테이블 WHERE 열이름 =삭제값;
 
 --수정
 UPDATE 테이블 SET VALUES (행정보);
```



- 시퀀스

``` SQL
CREATE SEQUENCE NO_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 10000
MINVALUE 1
NOCYCLE; -- 시퀀스 생성문 1~ 10000까지(번호생성문)

INSERT INTO 테이블명 values (NO_SEQ.NEXTVAL,값1,값2); -- 형태로 삽입

SELECT NO_SEQ CURRVAL FROM dual; -- 현재 시퀀스의 값 검색

SELECT SYSDATE FROM DUAL; -- 실행중인 날짜 출력
SELECT CURRENT_DATE FROM DUAL; -- 실행중인 현재 날짜 출력
```



- 제약조건 추가

``` sql
-- 열1을 기본키로 설정
ALTER TABLE 테이블1
	ADD CONSTRAINT PK_테이블1_열1
	PRIMARY KEY (열1); 
	
-- 열2를 외래키로 설정
ALTER TABLE 테이블2
	ADD CONSTRAINT PK_열1_열2
	FOREIGN KEY(열2) REFERENCES 테이블1(열1)
```



- `SELECT*FROM 테이블이름;`  :  전체(*)테이블 조회하기
- `SELECT 열이름 FROM 테이블이름 WHERE 조건` : 테이블에서 조건에 맞는 열을 출력
- `GROUP BY` , `ORDER BY`
- `DISTINCT` / `UNIQUE`
- `AS`

``` SQL
--SELECT 기본 
SELECT 출력열 FROM 테이블 WHERE 조건 --ORDER BY 열 (ASC/DESC)

--GROUP BY (ORDER BY)
SELECT 출력열, SUM(열2) FROM 테이블 HAVING 검색조건 --ORDER BY 열 (ASC/DESC)

-- DISTINCT / UNIQUE
SELECT DISTINCT 출력열 FROM 테이블 WHERE 조건 -- 출력열의 중복 제거

-- AS
열 AS "새로운 열이름"
```



- 집계함수 `SUM()`  , `AVG()` , `COUNT()` , `MAX()` , `MIN()`

``` SQL
SUM(열) --데이터의 합
AVG(열) --데이터의 평균
COUNT(열) --데이터 갯수
MAX(열) --최댓값
NIN(열) --최솟값
```



- 패턴매칭 `%` , `_`
- `LIKE`
- IN

``` SQL
 --조건식 _는 하나의 글자, %는 미정의 글자  / LIKE는 열에서 해당 글자를 찾는다.
 열이름 LIKE '_홍%'
 
 -- 값들 중 하나이면 열을 출력
 열이름 IN (값1, 값2, ...)
```







pivot 으로 행을 열로 바꿀 수 있다.







[테이블 생성방식]

- 직접 생성(현직에선 별로 사용 안됨)
- IMPORT 생성
  - 테이블 임포드

테이블 사이에 PRIMARY KEY,FORIEGN KEY 등록

(*추가) ALTER 함수로 NULL 포함, 키의 자료값등을 수정 가능

SELECT 함수로 다양한 조건으로 자료 확인



AS(이름 선언), FROM (테이블명), WHRER(열명)



SELECT [행동] [함수] AS "이름선언"

FORM  (테이블 명);



CREATE TABLE [테이블명]

 















테이블 생성

테이블 생성(기존의 다른 테이블과 연동)

변경 alter NOT NULL로

열 삽입

행 삽입 : INSET INTO book

​				VALUES( 열);

조건 변경 (열2가 값2인 것 행을 / 열1 을 값1로 변경)

: update 테이블명 set 열1 = 값1 WHERE 열2=값2;

















현재 테이블 확인: SELECT * FROM 테이블;



추가 add

제거 delete  (조건 1과 2를 만족하는 행 삭제 )

DELETE FROM 테이블명 WHERE (열1 조건 AND 열2 조건);









내부 조인(INNER JOIN)

메인이 되는 테이블 1

``` sql
SELLEC [약자1].[내부열1] [약자1].[내부열2] [약자2].[내부열3]
FROM [테이블1] [약자1]
	INNER JOIN [테이블2] [약자2] ON [약지2].[FK_약자1_약자2] = [약자1].[FK_약자1_약자2]
	... 다수 INNER JOIN
WHERE [조건식]
ORDER BY [대상] [DESC/ASC];
```





메인이 되는 테이블 2

``` SQL
SELECT  C.clientName, (B.bookPrice*bs.bsQty )As "구매액"
FROM bookSale BS
INNER JOIN client C ON C.clientNo = BS.ClientNo
INNER JOIN book B ON B.bookNo = BS.bookNo
INNER JOIN publisher P ON P.pubNo = B.pubNo
GROUP BY  C.clientName, (B.bookPrice*bs.bsQty)
HAVING SUM(B.bookPrice*bs.bsQty)>100000;
```


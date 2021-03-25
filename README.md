# Oracle (SQL)





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



## ch2  오라클 및 sqldeveloper 설치

> 오라클 초기 세팅
>
> - ORACLE, SQLDEVELOPER 다운
> - SQLDEVELOPER는 C와 가깝게 폴더 전체를 옮길것
> - 초기 로컬 시스템은 그냥 생산, 사용자 접속은 사용자로 등록하고 접속



## ch3 오라클 간단한 사용법

- 사용자 접속
- 테이블에 값 입력법(수기)



데이터 유형

CHAR

NCAHR

VARCHAR

NVARCHAR

DATE

NUMBER



- 널 아님: 널 값이 들어가면 안되는 열에 체크



SQL 코드로 테이블 다루기

- `SELECT*FROM 테이블이름;`  :  테이블 조회하기
- `SELECT 열이름 FROM 테이블이름 WHERE 조건` : 테이블에서 조건에 맞는 열을 출력
- `CREATE TABLE "테이블이름"` : "테이블이름" 으로 테이블 생성
- `DROP TABLE "테이블이름"` : ''테이블이름"의 테이블을 삭제





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


# Oracle (SQL)

## 목차

1. DBMS란? , ORACLE의 구조
2. 데이터 타입 
3. PRIMARY, FOREIGN KEY
4. 함수
   1. CREAT, DROP, ALTER   (+ 시퀀스 생성)
   2. INSERT, DELETE, UPDATE 
   3. SELECT
   4. 내장함수
      - 



## ch1 DBMS 개요 및 Oracle

> DBMS ( ): 여러명이 데이터 베이스의 공유 및 접근을 관리하는 프로그램
>
> 무결성 : 데이터 베이스의 제약 조건(있어야 하는 값)
>
> 독립성 : 데이터베이스와 프로그램은 서로 독립적인 관계 (SQL과 테이블은 독립적으로 존재)
>
> 관계형DBMS :  테이블형 데이터베이스
>
> SQL : 관계형 DBMS 에서 사용 되는 언어(오라클에서 DBMS관리하는 언어)
>



## ch2 데이터 타입

데이터 유형 : 타입(크기)

- VRCHER2 : 가변형 문자열 
- DATE : 날짜형
- NUMBER : 상수형
- 널 아님: 널 값이 들어가면 안되는 열에 체크



## CH3 함수

> 데이터 정의어(DDL) : 테이블이나 관계의 구조 생성 : `CREATE` , `ALTER` , `DROP`
>
> 데이터 조작어(DML) : 테이블 데이터를 수정 : `SELECT` , `INSERT` , `DELETE` , `UPDATE` 
>
> 데이터 제어어(DCL) : 사용 권한을 관리 : `GRANT` , `REVOKE` , `COMMIT` , `ROLLBACK`



### CH3-1. `CREATE`, `DROP` , `ALTER`: 테이블 구조 생성/ 삭제 /수정

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



- `ALTER` : 제약조건(CONSTRAINT) 추가 (`PRIAMARY KEY` , `FORIEGN KEY`)

``` sql
-- 열1을 기본키로 설정
ALTER TABLE 테이블1
	ADD CONSTRAINT 제약조건이름 -- 대개 기본키는 PK_열이름, 외래키는 FK_열이름1_열이름2
	PRIMARY KEY (열1); 
	
-- 열2를 외래키로 설정
ALTER TABLE 테이블2
	ADD CONSTRAINT 제약조건이름	-- CONSTRAINT 는 제약조건을 뜻함
	FOREIGN KEY(열2) REFERENCES 테이블1(열1)
	
ALTER TABLE 테이블3
	MODIFY 열3 int NOT NULL;
```



- 시퀀스: 일련번호 생성

``` SQL
CREATE SEQUENCE NO_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 10000
MINVALUE 1
NOCYCLE; -- 시퀀스 생성문 1~ 10000까지(번호생성문)

--테이블의 형태 (NUMBER, VARCHAR2,VACHAR2)

INSERT INTO 테이블명 values (NO_SEQ.NEXTVAL,값1,값2); -- 형태로 삽입

SELECT NO_SEQ.CURRVAL FROM dual; -- 현재 시퀀스의 값 검색

SELECT SYSDATE FROM DUAL; -- 실행중인 날짜 출력
SELECT CURRENT_DATE FROM DUAL; -- 실행중인 현재 날짜 출력
```





### CH3- 2 : `INSERT` ,  `DELETE` `UPDATE` : 테이블 데이터를 입력/삭제/수정

- `INSERT()` : 데이터 입력
- `DELETE()` : 데이터 삭제
- `UPDATE()` : 데이터 수정

``` SQL
 INSERT INTO 테이블명 VALUES(값1, 값2, 값3);
 
 --값을 한번에 다 넣는다.
 INSERT ALL
 INTO 테이블명 VALUES(값1, 값2, 값3)
 INTO 테이블명 VALUES(값1, 값2, 값3)
 
 --삭제
 DELETE FROM 테이블 WHERE 열이름 =삭제값;
 
 --수정
 UPDATE 테이블 SET VALUES (행정보);
```



###  CH3-3 : `SELECT` : 데이터 검색,출력

- `SELECT*FROM 테이블이름;`  :  전체(*)테이블 조회하기
- `SELECT 열이름 FROM 테이블이름 WHERE 조건` : 테이블에서 조건에 맞는 열을 출력
- `GROUP BY` , `ORDER BY` : 그룹별, 순서별 정렬
- `DISTINCT` / `UNIQUE` : 열에서 중복을 제외
- `AS` : 앞의 열 이름을 새로운 열이름으로 출력

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



- (패턴매칭 `%` , `_`) ,`LIKE`, `IN`

``` SQL
 --조건식 _는 하나의 글자, %는 미정의 글자  / LIKE는 열에서 해당 글자를 찾는다.
 열이름 LIKE '_홍%'
 
 -- 값들 중 하나이면 열을 출력
 열이름 IN (값1, 값2, ...)
```







pivot 으로 행을 열로 바꿀 수 있다.









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







-  `replace()`, `translate()`, `length()`, `lengthB()`

``` sql


replace('abcadb','ab','AB') -- ABcadb 출력 'ab'를 'AB' 로 변경
translate('abcadb','ab','AB') -- ABcAdB 출력 'a','b'를 각각 'A','B' 로 변경
length() -- 글자 수 출력 전부 1글자로 인식
lengthB() -- 바이트 수 계산 한글 3/ 나머지 1바이트 인식

--위 함수들은 SELECT와 같이 쓰는데 SELECT는 출력값만 변경 할 뿐 테이블은 그대로인 상태 
```



- `SUBSTR()`, `CONCAT()` ,`||연산자`

``` sql
SUBSTR(열이름, 시작인덱스, 길이) -- 지정한 길이만큼 문자열 반환
SELECT SUBSTR('성이름', 1, 1 ) AS "성"
SELECT SUBSTR('성이름', 2, 2 ) AS "이름"

-- 문자열 연결함수
CONCAT() ,||연산자
SELECT CONCAT('문자열', '연결방법1'), '문자열'||''||'연결방법2' FROM dual;

SELECT '문자열1' || ' : ' || '문자열2' || ':' || '문자열3' FROM dual;
```





- `INSTR()`

``` SQL
INSTR(기준 문자열, 지정된 문자열, 찾을 시작 위치, 출현위치) -- 위치 반환

SELECT INSTR('가나다라마바사 가나다라마바사', '가나', 5, 2) FROM dual; --결과 9
```



- `LOWER()` , `UPPER()` , `INITCAP()` : 전부 소문자로, 전부 대문자로, 첫글자 대문자로



- `LPAD(문자열, 길이, 채울 문자열) `: 왼쪽부터 채움
- `RPAD(문자열, 길이, 채울 문자열)` : 오른쪽부터 채움



- `TRIM(제거할 방향 FROM 문자열)` : 문자열 앞 뒤 공백 제거

``` SQL
SELECT TRIM('    대한    ') FROM dual; --양쪽
SELECT TRIM(LEADING '* 'FROM '***데이터베이스***)'FROM dual;-- 
SELECT TRIM(TRAILING '*' FROM '***데이터베이스***')FROM dual;
SELECT TRIM(BOTH '*'FROM '***데이터베이스***')FROM dual;
```



- `RANK()` : 값의 순위 변환 (동일 순위 개수만큼 증가)
- `DENSE_RANK()` : 값의 순위 반환(동일 순위 상관 없이  증가)
- `ROW_NUMBER()` 

```sql
SELECT 열이름1,
            RANK() OVER (ORDER BY 열이름1 DESC) "RANK",
            DENSE_RANK() OVER (ORDER BY 열이름1 DESC) "DENS_RANK",
            ROW_NUMBER() OVER (ORDER BY 열이름1 DESC) "ROW_NUMBER"
    FROM book;
    
--상위 N개 출력 : WHERE ROWNUM BETWEEN 1 AND N
    
```



- `ROWNUM` : 순위 반환

``` SQL
SELECT ROWNUM , bookPrice
FROM (select bookPrice from book order by bookPrice desc)book
WHERE ROWNUM BETWEEN 1 AND 5
ORDER BY bookPrice DESC;
```







- ROLLUP() /CUBE() /GROUPING SET() : 그룹의 소계와 총계 출력

``` SQL
-- CUBE()    
SELECT 열이름1, 열이름2, SUM(열이름3) AS "수량합계"  -- 열이름3은 NUMBER타입
FROM 테이블이름
GROUP BY CUBE(열이름1, 열이름2) -- 순서 변경해도 상관 없음
ORDER BY 열이름1, 열이름2;
    
--ROLLUP()  : 그룹의 소계를 함. prdName 우선(순서 중요)
SELECT 열이름1, 열이름2, SUM(열이름3) AS "수량합계"  -- 열이름3은 NUMBER타입
FROM 테이블이름
GROUP BY ROLLUP(열이름1, 열이름2) -- 열이름1을 기준으로 정렬
ORDER BY 열이름1, 열이름2;
 
    
--GROUPING SET()
--항목별 소계만 출력(순서에 따라 출력값의 순서만 다름.)
ELECT 열이름1, 열이름2, SUM(열이름3) AS "수량합계"  -- 열이름3은 NUMBER타입
FROM 테이블이름
GROUP BY GROUPING SETS(열이름1, 열이름2) -- 앞의 항목을 먼저 출력
ORDER BY 열이름1, 열이름2;
 
    
```



- `SYSDATE` , `CURRENT_DATE` , `ADD_MONTHS()` , `EXTRACT()`

``` SQL
--SYSDATE, DURRENT_DATE : 오늘 날짜 
SELECT SYSDATE FROM dual; -- 오늘(오라클 서버)
SELECT CURRENT_DATE FROM dual; -- 오늘(세션 설정)

-- 일(DAY) 더하기
SELECT SYSDATE +1 FROM dual; --내일
SELECT SYSDATE -1 FROM dual; --어제

-- 월(MONTH) 더하기
SELECT ADD_MONTHS(SYSDATE, -12) FROM dual;


-- EXTRACT 년,월,일 기준 하나 추출
SELECT EXTRACT(YEAR FROM SYSDATE) 년,
	   EXTRACT(MONTH FROM SYSDATE) 월,
	   EXTRACT(DAY FROM SYSDATE) 일
FROM dual;

```



- `CURRENT_TIMESTAMP` , `TO_CHAR()`

``` SQL
-- 날짜 시간 표기
SELECT CURRENT_TIMESTAMP FROM dual;

-- 문자열로 변경
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') FROM dual;

SELECT TO_CHAR(SYSDATE, 'HH24') 시,
	TO_CHAR(SYSDATE, 'MI') 분,
	TO_CHAR(SYSDATE, 'SS') 초
FROM dual;


--날짜 추출 : 년, 월, 일
SELECT TO_CHAR(SYSDATE ,'YYYY') 년,
	TO_CHAR(SYSDATE ,'MM') 월,
	TO_CHAR(SYSDATE ,'DD') 일
FROM dual;

--월 추출
SELECT TO_CHAR( 날짜타입열 ,'MM') 월
FROM 테이블;
```



- `NVL2 (값,'A','B')`  : 값이 NULL 이 아닌경우 'A' 출력 NULL인 경우 'B' CNFFUR

``` SQL
-- 열의 값이 NULL 혹은 ' '(공백) 일경우 값을 출력
UPDATE 테이블 SET 열이름= 값
WHERE NVL2(열이름,'Y', 'N')='N' OR clientHobby =' ';
```





- `DECLARE`, `BEGIN`, `END;` : 함수 선언

``` SQL
SET SERVEROUTP ON -- 화면출력 허용(접속 연결동안 1회 수행)

DECLARE
	변수명1 데이터타입(크기);
	변수명2 데이터타입(크기) := 값2 ;    -- 초기화하면서 넣기
	변수명3 CONSTANT 데이터타입(크기) := 값3 ; -- 상수값
BEGIN
	변수명1 := 값1;
	변수명2 := 값2;
	DBMS_OUTPUT.PUT_LINE(변수명); -- DBMS 창에 출력하기 위한 출력문
END;




-- 테이블 열의 값을 변수에 대입할 때
-- 변수의 데이터 타입을 테이블의 열의 타입으로 선언
DECLARE
    --변수를 테이블의 열의 타입으로 선언
    변수명 테이블.열이름1%TYPE;
BEGIN
    --열의 값을 알아와서 변수 변수명에 저장하고 출력(열이름2=값 인)
    SELECT 열이름1 INTO 변수명 FROM 테이블 WHERE 열이름2 = 값 ;
    -- 변수 값 출력
    DBMS_OUTPUT.PUT_LINE(변수명);
END;
```



- `IF문`

``` SQL
IF 조건문 THEN
	조건이 참 일 때 수행되는 문장;
ELSE
    조건이 거짓일 때 수행되는 문장;
END IF;
```



- CASE 문

``` SQL
CASE
    WHEN 조건1 THEN 결과1
    WHEN 조건2 THEN 결과2
    WHEN 조건3 THEN 결과3
    ELSE
END -- 조건에 합당하는 결과로 반환값을 정함
```



- LOOP 문

``` SQL
LOOP
	증감값			-- 종료 조건과 연동
	반복수행되는 문장
	종료조건		-- 종료 조건이 없으면 무한 반복이므로 꼭 필요
END LOOP;
```



- FORLOOP문

``` SQL
FOR 변수 IN 시작값 .. 종료값 -- 변수가 시작값에서 종료값이 될 때까지 
LOOP
	증감값					-- 보통 변수 := 변수 +1
	반복수행되는 문장
	종료조건				
END LOOP;
```


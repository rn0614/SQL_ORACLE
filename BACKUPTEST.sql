
-- 내장함수
/*
    문자함수
    - REPLACE() : 문자열 치환
    - LENGTH() : 글자 수 반환
    - LENGTHB() : 바이트 수반환
    - SUBSTR() : 지정한 길이만큼 문자열 반환

*/

-- REPLACE() : 문자열 치환
    SELECT REPLACE('자바 프로그래밍 자바 ', '자바','파이썬') FROM dual;
    --'자바' 전체를 '파이썬'으로 치환
    
--TRANCSLATE()
    SELECT TRANSLATE('apple airplane apart', 'ap', '*^') FROM dual;
    -- 'ap'를 '*^'로 치환
    -- 첫 번째 문자 a 는 *로 치환.
    -- 두 번째 문자 p 는 ^로 치환.
    
    --안드로이드를 영어로 
    SELECT bookNo, REPLACE(bookName, '안드로이드', 'Android') bookName, bookAuthor, bookPrice
    FROM book
    WHERE bookName LIKE '%안드로이드%'
    --원래 테이블은 안변함
    
    SELECT*FROM BOOK;
    
-- LENGTH() : 글자 수 반환
-- LENGTHB() : 바이트 수반환
    --'서울 출판사'에서 출간한 도서의 도서명과 도서명의 글자수, 바이트 수 , 출판사명 출력
    SELECT B.bookName AS "도서명", LENGTH(bookName) AS "길이",
                            LENGTHB(bookName) AS "바이트", P.pubName AS "출판사"
    FROM book B
        INNER JOIN publisher P ON B.pubNo = P.pubNo
    WHERE P.pubName = '서울 출판사';    
    
    --한글 : 3바이트 /영어,숫자,스페이스 : 1바이트

-- SUBSTR(전체 문자열, 시작인덱스, 길이) : 지정한 길이만큼 문자열 반환

-- 도서 테이블 : 저자 이름에서 성씨만 출력
    SELECT SUBSTR(bookAuthor, 1, 1 ) AS "성"
    FROM book;

-- 도서테이블 : 이름만 출력
    SELECT SUBSTR(bookAuthor, 2, 2 ) AS "이름"
    FROM book;

-- 성이 손씨
    SELECT bookAuthor
    FROM book
    WHERE SUBSTR(bookAuthor, 1, 1 )= '손'
    
-- 저자 이름에서 같은 성씨 몇명?
    SELECT SUBSTR(bookAuthor, 1, 1) AS "성", COUNT(*) AS "인원수"
    FROM book
    GROUP BY SUBSTR(bookAuthor, 1, 1);
    
-- CONCAT() : 문자열 연결함수
-- || : 문자열 연결 연산자

    SELECT CONCAT('문자열', '연결방법1'), '문자열'||''||'연결방법2' FROM dual;
    
    SELECT CONCAT(bookAuthor, ' : ', bookname, ' : ' , bookPrice) FROM book;
    SELECT '문자열1' || ' : ' || '문자열2' || ':' || '문자열3' FROM dual;
    
    SELECT bookAuthor || ' : ' || bookName ||' : '|| bookPrice
    FROM book;
    
    -- INSTR(기준 문자열, 지정된 문자열, 찾을 시작 위치, 출현위치) : 위치 반환
    -- 문자열(string) 에서 지정된 문자열 (substring)을 찾아서 위치 반환
    -- 지정된 문자열이 첫 번째 출현하는 위치 반환
    SELECT INSTR('초등학생 고등학생 대학생','학생',1,1) FROM dual; --3
    
    -- 5번째 문자부터 찾아서 두 번째 나오는 위치
    SELECT INSTR('초등학생 중학생 고등학생 대학생 학생', '학생', 5, 2) FROM dual;
    
    -- LOWER() / UPPER() / INITCAP()  첫글자를 대문자로 변환
    SELECT LOWER('java Programming'), UPPER('java Programming'), INITCAP('java Programming')
    FROM dual;
    
    --LPAD(문자열, 길이, 채울 문자열) : 왼쪽부터 채움
    --RPAD(문자열, 길이, 채울 문자열) : 오른쪽부터 채움
    SELECT LPAD('데이터 베이스', 20, '*') FROM dual;
    SELECT RPAD('데이터 베이스', 20, '*') FROM dual;
    
    --TRIM(제거할 방향 FROM 문자열) : 문자열 앞 뒤 공백 제거
    -- 제거할 방향 : LEADING(앞) BOTH(양쪽) TRAILING (뒤)
    SELECT TRIM('    대한    ') FROM dual;
    SELECT TRIM(LEADING '* 'FROM '***데이터베이스***)'FROM dual;
    SELECT TRIM(TRAILING '*' FROM '***데이터베이스***')FROM dual;
    SELECT TRIM(BOTH '*'FROM '***데이터베이스***')FROM dual;
    
    -- 순위 출력 함수
    -- RANK() /DENSE_RANK() / ROW_NUMBER()
    --RANK() : 값의 순위 변환 (동일 순위 개수만큼 증가)
    -- DENSE_RANK() : 값의 순위 반환(동일 순위 상관 없이 1 증가)
    -- ROW_NUMBER() : 행위 순위 반환
    SELECT bookPrice,
            RANK() OVER (ORDER BY bookPrice DESC) "RANK",
            DENSE_RANK() OVER (ORDER BY bookPrice DESC) "DENS_RANK",
            ROW_NUMBER() OVER (ORDER BY bookPrice DESC) "ROW_NUMBER"
    FROM book;
    
    -- TOP N 출력 : ROWNUM 사용
    -- 도서가격 순위 1~5 위 출력
    SELECT ROWNUM , bookPrice
    FROM (select bookPrice from book order by bookPrice desc)book
    WHERE ROWNUM BETWEEN 1 AND 5
    ORDER BY bookPrice DESC;
    
    SELECT bookPrice
    FROM book
    ORDER BY bookPrice;
    
    -- 그룹의 소계와 총계 출력
    -- ROLLUP() /CUBE() /GROUPING SET()
    --ROLLUP()
        -- 그룹의 소계와 총계 산출
        -- 순서가 중요, 맨 앞에 놓인 것에 소계 산출
    -- CUBE()
        -- 각 그룹의 모든 경우의 수에 대한 소계와 총계 산출
        -- 항목들간 다차원적인 소계를 계산
    --GROUPING SETS()
        -- 특정 항목에 대한 소계 산출
        
    CREATE TABLE cubeTBL(
     prdName VARCHAR2(10),
     color VARCHAR2(6),
     amount NUMBER(2)
    );
    
    INSERT INTO cubeTBL VALUES('컴퓨터','검정', 11);
    INSERT INTO cubeTBL VALUES('컴퓨터','파랑', 22);
    INSERT INTO cubeTBL VALUES('모니터','검정', 33);
    INSERT INTO cubeTBL VALUES('모니터','파랑', 44);
    INSERT INTO cubeTBL VALUES('마우스','검정', 55);
    INSERT INTO cubeTBL VALUES('마우스','파랑', 66);
    
    SELECT*FROM cubeTBL;
    
    --CUBE() 함수 : 각 그룹의 모든 경우의 수에 대한 소계와 총계를 산출
    -- 항목들 간 다차원 소계 계산
    
    SELECT prdName, color, SUM(amount) AS "수량합계"
    FROM cubeTBL
    GROUP BY CUBE(color, prdName) -- 순서 변경해도 상관 없음
    ORDER BY prdName, color;
    
    
    --ROLLUP()  : 그룹의 소계를 해함. prdName 우선(순서 중요)
    SELECT prdName, color, SUM(amount) AS "수량합계"
    FROM cubeTBL
    GROUP BY ROLLUP(prdName, color)
    ORDER BY prdName, color;    
    
    
    SELECT prdName, color, SUM(amount) AS "수량합계"
    FROM cubeTBL
    GROUP BY ROLLUP(color, prdName) --맨 처음에 있는 color에 대해서만 소개
    ORDER BY prdName, color; 
    
    
    --GROUPING SET()
    --항목별 소계만 출력(순서에 따라 출력값의 순서만 다름.)
    SELECT prdName, color, SUM(amount) AS "매출액"
    FROM cubeTBL
    GROUP BY GROUPING SETS(prdName, color); -- 앞의 항목을 먼저 출력
    
    -- ROLLUP() /CUBE() /GROUPING SET() 예제 2
    
    CREATE TABLE sales(
        prdName VARCHAR2(20),
        salesDate VARCHAR2(10),
        prdCompany VARCHAR2(10),
        salesAmount NUMBER(8)
    );
    
    INSERT INTO sales VALUES ('노트북', '2021.01','삼성',10000);
    INSERT INTO sales VALUES ('노트북', '2021.03','삼성',20000);
    INSERT INTO sales VALUES ('냉장고', '2021.01','삼성',12000);
    INSERT INTO sales VALUES ('냉장고', '2021.03','삼성',12000);
    INSERT INTO sales VALUES ('프린터', '2021.01','삼성',3000);
    INSERT INTO sales VALUES ('프린터', '2021.03','삼성',1000);
    
    SELECT*FROM sales;
    
    -- CUBE()  함수 사용해서 소계 및 총계 출력
    
    SELECT prdName,salesDate,prdCompany, sum(salesAmount) AS "매출액"
    FROM sales
    GROUP BY CUBE(prdName,salesDate,prdCompany)
    ORDER BY prdName,salesDate,prdCompany;
    
    
    -- 상품별 소계만 출력, 총계 출력
    SELECT prdName,salesDate,prdCompany, sum(salesAmount) AS "매출액"
    FROM sales
    GROUP BY ROLLUP(prdName,salesDate,prdCompany)
    ORDER BY prdName,salesDate,prdCompany;
    
    SELECT prdName,salesDate,prdCompany, sum(salesAmount) AS "매출액"
    FROM sales
    GROUP BY GROUPING SETS(prdName,salesDate,prdCompany)
    ORDER BY prdName,salesDate,prdCompany;
    
    
    --날짜 관련 함수
    --EXTRACT() /ADD_MONTHS()
    -- 형 변환 함수 : TO_CHAR()
    
    SELECT SYSDATE FROM dual; -- 오늘
    SELECT CURRENT_DATE FROM dual;
    SELECT SYSDATE +1 FROM dual; --내일
    SELECT SYSDATE -1 FROM dual;
        
    SELECT ADD_MONTHS(SYSDATE,-1) FROM dual;
    
    SELECT ADD_MONTHS(SYSDATE, -12) FROM dual;
    
    --EXTRACT() : 현재 날짜에서 년, 월, 일, 추출
    
    SELECT EXTRACT(YEAR FROM SYSDATE) 년,
              EXTRACT(MONTH FROM SYSDATE) 월,
              EXTRACT(DAY FROM SYSDATE) 일
    FROM dual;
    
    --작년, 올해, 내년
    SELECT EXTRACT(YEAR FROM SYSDATE ) -1 작년,
              EXTRACT(YEAR FROM SYSDATE ) 올해,
              EXTRACT(YEAR FROM SYSDATE ) +1 내년
    FROM dual;
    
    -- (1) 도서주문 테이블에서 주문일에 7일 더한 날을 배송일로 계산
    SELECT bsdate 주문일,bsDate+7 AS "배송일"
    FROM booksale;
    
    -- (2) 도서 테이블에서 도서명과 출판연도 출력
    SELECT bookName 도서명, EXTRACT(YEAR FROM bookdate) 출판년도
    FROM book;
    
    
    SELECT CURRENT_TIMESTAMP FROM dual;
    
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
    

    SELECT TO_CHAR(BSDATE,'MM') 월
    FROM BOOKSALE;
    
    
    UPDATE client SET clientHobby= '없음'
    WHERE NVL2(clientHobby,'Y', 'N')='N' OR clientHobby =' ';
    
    SELECT clientHobby FROM client;
-- PL /SQL : 오라클에 내장된 절차적 언어
-- 프로시저 호출해서 사용

/*
    구문형식
    
    DECLARE
        변수명1 데이터타입;
        변수명2 데이터타입;
    BEGIN
    
        여기에 실행코드 작성
    
    
    END;
*/

 -- 화면 출력 허용 (접속 연결 동안 1회 수행)
 SET SERVEROUTP ON;
 DECLARE
    name VARCHAR2(10);
    age NUMBER(3);
BEGIN
    name := '홍길동';
    age := 23;
    
    -- 실행 결과를 DBMS 창에 출력
    DBMS_OUTPUT.PUT_LINE(name);
    DBMS_OUTPUT.PUT_LINE(age);
END;


-- 변수 선언과 동시에 값 초기화
 DECLARE
    name VARCHAR2(10) := '이몽룡';
    age NUMBER(3):=35;
BEGIN
    -- 실행 결과를 DBMS 창에 출력
    DBMS_OUTPUT.PUT_LINE(name);
    DBMS_OUTPUT.PUT_LINE(age);
END;



-- 테이블의 열의 값을 변수에 대입
-- 변수의 데이터 타입을 테이블의 열의 타입으로 선언
DECLARE
    --book테이블의 bookPrice 타입으로 선언
    bPrice book.bookPrice%TYPE;
BEGIN
    --bookPrice 열의 값을 알아와서 변수 bPrice에 저장하고 출력
    SELECT bookPrice INTO bPrice FROM book WHERE bookName ='자바 프로그래밍';
    -- 변수 값 출력
    DBMS_OUTPUT.PUT_LINE(BpRICE);
END;


-- 상수 : CONSTRAINT 키워드 사용
-- 상수는 프로그램 실행 중에 값 변경 불가
DECLARE
    -- 변수 선언 및 초기화
    price NUMBER(5) :=100;
    points NUMBER(4);
    
    -- 상수 rate 초기화
    rate CONSTANT NUMBER(2, 2):= 0.03;
BEGIN
    price :=200; -- 변수 값 변경 가능(오류 없음)
    --rate := 0.05; -- 상수 값 변경 시 (오류 발생)
    
    
    points := price* rate;
    DBMS_OUTPUT.PUT_LINE(points);
    
    DBMS_OUTPUT.PUT_LINE('적립포인트 : ' ||points);
END;

/*
    조건문
    - IF 문
    - CASE 문
    
    IF문 형식
    
    IF <조건> THEN
        조건이 참일 때 수행되는 문장;
    ELSE
        조건이 거짓일 때 수행되는 문장;
    END IF;
*/

DECLARE
    bStock NUMBER(5);
BEGIN
    -- book 테이블의 bookStock 열의 값을 변수 bStock에 저장
   SELECT bookStock into bStock FROM book WHERE bookNo ='1003';
    -- 조건 : bookNo가 '1003'
    -- bStock 값 출력
    DBMS_OUTPUT.PUT_LINE('재고 : ' ||bStock);
    
    --재고가 7 이상이면 '재고 수준 위험', 7 미만이면 '재고 수준 보통' 출력
    
        IF bStock>=7 THEN
            DBMS_OUTPUT.PUT_LINE('재고 수준 위험');
        ELSE
            DBMS_OUTPUT.PUT_LINE('재고 수준 보통');
        END IF;
END;

/*
CASE 문
- 조건에 따라 결과 값 반환
- 조건이 여러개인 경우에 사용
-주로 SELECT 절에서 반환 값을 열로 사용
-반환 값을 변수에 저장해서 사용해도 됨

형식
CASE
    WHEN 조건1 THEN 결과1
    WHEN 조건2 THEN 결과2
    WHEN 조건3 THEN 결과3
    ELSE
END
*/

--CASE 문 예 ; SELECT 절에서 반환값을 열로 사용
    SELECT C.clientname, SUM(B.bookPrice *bsQty) AS "총 주문액",
    CASE
        WHEN SUM(B.bookPrice *bsQty) >=200000 THEN '최우수'
        WHEN SUM(B.bookPrice *bsQty) >=100000 THEN '우수'
        WHEN SUM(B.bookPrice *bsQty) >=50000 THEN '일반'
        ELSE '관심고객'
    END AS "고객등급"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.clientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
    GROUP BY C.clientNo, C.clientName
    ORDER BY "총 주문액" DESC;
    
    
    --CASE 문 예제 : 반환값을 변수에 저장해서 사용
    DECLARE
        bStock NUMBER(4);
        resultValue VARCHAR2(5);
    BEGIN
        --book 테이블의 bookStock 열의 값을 변수 bStock에 저장
        SELECT bookStock INTO bStock FROM BOOK WHERE bookNo ='1003' ;
        DBMS_OUTPUT.PUT_LINE('재고 : ' || bStock ); -- 재고 xx출력
        
        resultValue :=
            CASE
                WHEN bStock >= 7 THEN '위험'
                WHEN bStock >= 4 THEN '보통'
                ELSE '재고 수준 우수'
            END;
            
        --resultValue 값 출력
        DBMS_OUTPUT.PUT_LINE('재고 수준 : ' || resultValue ); -- 재고 xx출력
        --재고 : xx 출력
    
    END;
        
        /*
            반복문
            -LOPP
            -FOR ~ LOOP
            -WHILE ~LOOP
        */
        
        /*
            LOOP문 형식
            
            초기값
            LOOP
                증감값
                반복수행되는 문장
                종료조건
            END LOOP;
        */
        
        DECLARE
            i NUMBER(3) :=0;
        BEGIN
            LOOP
                i:= i+1;--증강값
                DBMS_OUTPUT.PUT_LINE(i); --반복 수행되는 문장
                EXIT WHEN I>=10; --종료 조건
            END LOOP;
        END;
    
    
    /*
        FOR LOOP 문 형식
        
        FOR 변수 IN 시작값 .. 종료값
        LOOP
            반복 수행되는 문장
        END LOOP;
        
        --REVERSE : 1씩 감소
    */
    
    
    -- FOR ~ LOOP 문 : 1~10 출력
        DECLARE
            i NUMBER(3);
        BEGIN
            FOR i IN 1 .. 10
            LOOP
                DBMS_OUTPUT.PUT_LINE(i);
            END LOOP;
        END;
        --REVERSE : 1씩 감소
        
        
        --FOR ~LOOP 문 : 1~100 합
        DECLARE
            s NUMBER(4):=0;
            i NUMBER(4);
        BEGIN
            FOR i IN 1 .. 100
            LOOP
                s:=s+i;
            END LOOP;
            DBMS_OUTPUT.PUT_LINE(s);
        END;
        
        
        
        --재고가 5권 이상인 도서 추출해서 재고 계산
        -- 재고액이 200,000 초과된 출력
        DECLARE
            stockSum Number(7);
        BEGIN
            FOR b IN (SELECT bookName, bookPrice, bookStock
                      FROM book
                      WHERE bookStock >=5)
            LOOP
                --재고액 계산
                stockSum := b.bookPrice*b.bookStock;
                --재고액이 200,000 초과된 출력
                IF stockSum > 200000 THEN
                     DBMS_OUTPUT.PUT_LINE(B.bookname || ' : ' || stockSum);
                END IF;
            END lOOP;
        END;
        
        
        --예외 처리
    
        --(1) 사전에 미리 정의된 예외 처리
        -- 결과 1행인 경우 : 정상 처리
        -- 결과 0행인 경우 : 저자가 없다고 예외 처리(NO_DATA_FOUND)
        -- 결과 2행 이상인 경우 : 너무 많다고 예외 처리(TOO_MANY_ROWS)
        
        DECLARE
            bAuthor book.bookAuthor%TYPE;
        BEGIN
            SELECT bookAuthor INTO bAuthor
            FROM book
            WHERE bookAuthor LIKE('차%'); -- 김, 홍, 차 확인
            -- 출력
            DBMS_OUTPUT.PUT_LINE('저자:' || bAuthor || '입니다.');
            
            EXCEPTION
                WHEN NO_DATA_FOUND THEN -- 0행 반환된 경우
                    DBMS_OUTPUT.PUT_LINE('해당 저자가 없습니다.');
                WHEN TOO_MANY_ROWS THEN -- 2행 반환된 경우
                    DBMS_OUTPUT.PUT_LINE('해당 저자가 너무 많습니다.');
        END;
        
        
        --(2) 사전에 미리 정의된 예외 처리2
        -- 기본키 중복 예외 처리
        
        BEGIN
            INSERT INTO book
            VALUES('2021','SQL','박길동',20000,'2020-11-12',5,'1');
            COMMIT; -- 변경 내용을 영구적으로 DB에 반영
            
            --오류 없으면 출력
            DBMS_OUTPUT.PUT_LINE('등록 성공');
            EXCEPTION
                WHEN DUP_VAL_ON_INDEX THEN --기본키 중복된 경우
                DBMS_OUTPUT.PUT_LINE('기본키 중복: 이미 존재하는 도시입니다.');
        END;
        
        
        
        --(3) 사용자 정의 예외 처리
        -- 존재하지 않는 도서번호로 도서 삭제시 예외처리
        DECLARE
            BOOKNO_NOT_FOUND EXCEPTION; -- (1)사용자 정의 예외형 선언(선언부에 선언)
        BEGIN
            --존재하지 않는 도서번호로 도서 삭제
            DELETE FROM book WHERE bookNo ='10100';
            
            -- SQL%NOTFOUND : 해당 SQL 문에 영향을 받는 행의 수가 없을 경우 TRUE 반환
            IF(SQL%NOTFOUND) THEN
                RAISE BOOKNO_NOT_FOUND; --(2)사용자 정의 예외 발생
            ELSE
                DBMS_OUTPUT.PUT_LINE('삭제 성공');
            END IF;
            
            --도서번호가 존재하지 않는 경우 예외 발생 -> 예외처리
            EXCEPTION --(3) 예외명(예외종류)로 예외 처리
                WHEN BOOKNO_NOT_FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('없는 도서번호입니다.');
        END;
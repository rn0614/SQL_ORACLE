
/*
    UPDATE 문
    -특정 열의 값을 수정하는 명령어
    -조건에 맞는 행을 찾아서 열의 값 수정
    -조건 : WHERE
    
    형식 : UPDATE 테이블명 SET 열 = 값 WHERE 조건;

    예 : 상품번호가 5인 행의 상품을 'UHD TV'로 수정
    UPDATE product SET prdName = 'UHD TV' WHERE prdNo ='5';
*/
    --상품 테이블 조회
    SELECT*FROM product;
    SELECT prdName,prdPrice FROM product;
    
    --예 : 상품번호가 5인 행의 상품을 'UHD TV'로 수정
    UPDATE product SET prdName = 'UHD TV' WHERE prdNo ='5';

    -- 상품명 그늘막 텐트 인것을 가격 50000원으로 변경    
    UPDATE product SET prdPrice =50000 WHERE prdName = '그늘막 텐트';
    
    /*
        delete 문
        - 테이블에 있는 기존 행을 삭제
        
        형식 : delete from 테이블명 where 조건;
        
        DELETE FROM product WHERE prdName='그늘막 텐트';
    */
    --상품명 '그늘막 텐트'인 행 삭제
    DELETE FROM product WHERE prdName='그늘막 텐트';
    
    /*
         연습문제
         (1) book 테이블에 다음과 같이 행 삽입
          6 JAVA 프로그래밍 33000  2021-02-10 서울 출판사
          7 파이썬             24000   2019-10-10  도서출판 강남
          
          
          (2)book 테이블에서 도서명이 '데이터 베이스' 인 행의 가격을 22000으로 변경
    */
    SELECT*FROM book;
    
    
    -- 연습문제
    --1. 고객 테이블 (COSTIMER) 생성
    CREATE TABLE customer(
        custNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        custName VARCHAR2(30),
        custPhone VARCHAR2(13),
        custAddress VARCHAR2(50)
    );
    
    --2. 주문테이블 생성(생성된 PRODUCT 테이블에 대한 주문)
    --주문번호, 주문일, 주문수량, 고객번호, 상품번호
    CREATE TABLE orderProduct(
        ordNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        orderDate Date,
        orderQty NUMBER(3), 
        custNo VARCHAR2(10) NOT NULL,
        prdNo VARCHAR2(4) NOT NULL,
        CONSTRAINT FK_orderProduct_customer FOREIGN KEY (custNo) REFERENCES customer (custNo),
        CONSTRAINT FK_orderProduct_product FOREIGN KEY (prdNo) REFERENCES product (prdNo)
    );
    
    -- 3. 고객 테이블의 전화번호 열 not null 변경
    ALTER TABLE customer MODIFY custPhone VARCHAR2(13) NOT NULL;
    
    --4. 고객 테이블에 '성별', '나이' 열 추가
    ALTER TABLE customer ADD(custGender VARCHAR2(3), custAge NUMBER(3));
    
    --5. 고객 주문 테이블에 데이터 삽입
    INSERT INTO customer VALUES('1001','이름','전화번호','위치','남',25);
    INSERT INTO customer VALUES('1002','이름2','전화번호2','위치2','여',24);
    INSERT INTO customer VALUES('1003','이름3','전화번호3','위치3','남',22);
  
    SELECT*FROM customer ;
    SELECT*FROM orderproduct ;
    
    INSERT INTO orderProduct VALUES('1','2021-02-10',3,'1003','10');
    INSERT INTO orderProduct VALUES('2','2021-02-11',20,'1001','5');
    INSERT INTO orderProduct VALUES('3','2021-02-12',5,'1002','17');
    INSERT INTO orderProduct VALUES('4','2021-02-10',1,'1003','2');
    

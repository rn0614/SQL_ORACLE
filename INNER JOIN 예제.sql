/*R
    조인(JOIN)
    - 여러 개의 테이블을 결합하여 조건에 맞는 행 검색
    
    조인의 종류
    - INNER JOIN (내부 조인)
        -공통되는 열(속성)이 있을때 사용
        -공통 속성의 속성 값이 동일한 튜플만 반환
        - 예: 상품을 주문한 적이 있는 고객 조회
        
    - OUTTER JOIN (외부 조인)
        -공통되는 열(속성)이 없을 때 사용
        -공통된 속성을 매개로 하는 정보가 없더라도 버리지 않고
         연산의 결과를 릴레이션에 표시
        -예 : 주문하지 않은 고객도 조회 
*/

-- 한번이라도 도서를 주문한 적이 있는 고객 조회
SELECT*
FROM client
    INNER JOIN bookSale
    ON client.clientNo = bookSale.clientNo;
    
    
    --필요한 열만 추출
    --테이블명 대신 별칭 (Alias) 사용
    --한 번이라도 도서를 주문한 적이 있는 고객의
    --고객번호와 고객명 출력
    SELECT C.clientNo, C.clientName
    FROM client C
        INNER JOIN bookSale BS
        ON C.clientNo = BS.clientNo;
        
    --한 번이라도 도서를 주문한 적이 있는 고객의
    --고객번호와 고객명 출력
    --중복되는 행은 한 번만 출력
    --고객번호를 기준으로 오름차순 정렬
    
    SELECT UNIQUE C.clientNo, C.clientName
    FROM client C
        INNER JOIN bookSale BS
        ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo ASC;
    /*
        3개의 테이블 결합 : 기본키 = 외래키 조건을 2개 지정
        book (bookNo)
        client (clientNo)
        bookSale (bsNo, bookNo, clientNo)
        
    */ 
    
    -- 주문된 도서에 대하여 도서를 주문한 고객명과 도서명을 출력
    --조건을 2개를 적어야함(연결고리)
    SELECT C.clientName, b.bookName
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.clientNo
        INNER JOIN book B On B.bookNo = BS.bookNo;
        
        
    SELECT BS.bsNo, BS.bookNo, C.clientno, C.clientName, B.bookName,Bs.bsQty
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.clientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
    ORDER BY BS.bsNo;
    
    -- 고객별로 총 주문수량 계산
    -- 고객번호, 고객명, 총주문 수량 출력
    -- 총부문수량 기준 내림차순 정렬
    
    SELECT C.clientNo, C.clientName, SUM(BS.bsQty) AS "총 주문수량"
    FROM bookSale BS
        INNER JOIN client C ON C.CLIENTnO = bs.ClientNo
    GROUP BY C.clientNo, C.clientName  -- 서로 다른 고객인데 동일 그룹으로 묶일 수있음.(반드시 둘다 쓸 것)
    ORDER BY "총 주문수량" DESC;
    
    --주문된 도서의 주문일, 고객명, 도서명, 도서가격, 주문수량, 주문액 계산해서 출력
    --주문액 기준 내림차순
    
    SELECT BS.bsDate, C.clientName, B.BookName, B.bookPrice, BS.bsQty, (BS.bsQty*B.bookPrice) AS "주문액"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = bs.ClientNo
        INNER JOIN book B ON B.bookNo = bs.bookNo
    ORDER BY "주문액" DESC ;
    
    -- WHERE 절 추가
    -- 2018 ~  현재까지 판매된 도서일의 주문일 ,
    SELECT BS.bsDate, C.clientName, B.BookName, B.bookPrice, BS.bsQty, (BS.bsQty*B.bookPrice) AS "주문액"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = bs.ClientNo
        INNER JOIN book B ON B.bookNo = bs.bookNo
    WHERE BS.bsDate >='2019-01-01' 
    ORDER BY "주문액" DESC ;
    -- 19년 전 주문 안보임.
    
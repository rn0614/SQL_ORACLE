--1. 모든 도서에 대하여 도서의 도서번호, 도서명, 출판사명 출력
SELECT B.bookNo, B.bookName, P.pubName
FROM book B
    INNER JOIN publisher P ON P.pubNo = b.pubNo;
    
--2. ‘서울 출판사'에서 출간한 도서의 도서명, 저자명, 출판사명 출력 (출판사명 사용)
    SELECT B.bookName, B.bookAuthor, P.pubName AS "출판사명"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE P.pubName= '서울 출판사' ;

--3. '정보출판사'에서 출간한 도서 중 판매된 도서의 도서명 출력 (중복된 경우 한 번만 출력) (출판사명 사용)
    SELECT UNIQUE B.bookName
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE P.pubName= '정보출판사' ;

--4. 도서가격이 30,000원 이상인 도서를 주문한 고객의 고객명, 도서명, 도서가격, 주문수량 출력
    SELECT C.clientName, B.bookName,B.bookPrice,Bs.bsQty
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE B.bookPrice>=30000 ;

--5. '안드로이드 프로그래밍' 도서를 구매한 고객에 대하여 도서명, 고객명, 성별, 주소 출력 (고객명으로 오름차순 정렬)
    SELECT B.bookName, C.clientName, C.Clientgender, C.clientaddress
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE B.bookName LIKE '안드로이드 프로그래밍' 
    ORDER BY C.clientName;

--6. ‘도서출판 강남'에서 출간된 도서 중 판매된 도서에 대하여 ‘총 매출액’ 출력
    SELECT  SUM(B.bookPrice * BS.bsQty) AS "총 매출액"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE P.pubName LIKE '도서출판 강남' ;

--7. ‘서울 출판사'에서 출간된 도서에 대하여 판매일, 출판사명, 도서명, 도서가격, 주문수량, 주문액 출력
    SELECT  BS.bsdate, p.pubName, B.bookName, B.bookPrice, bs.bsQty, (B.bookPrice*bs.bsQty )As "주문액"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE P.pubName LIKE '서울 출판사' ;

--8. 판매된 도서에 대하여 도서별로 도서번호, 도서명, 총 주문 수량 출력
    SELECT  B.bookNo, B.bookName,SUM( bs.bsQty) As "총 주문 수량"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    GROUP BY B.bookNo, bookName, bs.bsQty;
   
--9. 판매된 도서에 대하여 고객별로 고객명, 총구매액 출력 ( 총구매액이 100,000원 이상인 경우만 해당)
    SELECT  C.clientName, SUM(B.bookPrice*bs.bsQty)As "구매액"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
     GROUP BY  C.clientName, (B.bookPrice*bs.bsQty)
     HAVING SUM(B.bookPrice*bs.bsQty)>100000;



--10. 판매된 도서 중 ＇도서출판 강남'에서 출간한 도서에 대하여 고객명, 주문일, 도서명, 주문수량, 출판사명 출력 (고객명으로 오름차순 정렬)
    SELECT C.clientName, BS.bsdate, BS.bsQty, P.pubName
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
     WHERE P.pubName = '도서출판 강남'
     ORDER BY C.clientName;
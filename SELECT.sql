/*
    select 문 : 테이블에서 조건에 맞는 형 검색(반환)
    기본 형식
    SELECT 열이름      -   검색할 열 (리스트 ) 기술
    FROM 테이블명   
    [WHERE 조건]
    [GROUP BY 열이름]      - 그룹 질의를 기술할 때 사용 (특정 열로 그룹화한 후 각 그룹에 대해 결과 생성)
    [HAVING 검색 조건]      - GROUP BY 절에 의해 구성된 그룹에 대해 적용할 조건
    [ORDER BY 열이름 [ASC | DESC]]     - 특정 열의 값을 기준으로 질의 결과 정렬
                                                ASC : 오름차순 정렬 | DESC : 내림차순 정렬
*/


-- 모든 여, 모든 웹 검색
    SELECT*FROM book;
    
    -- 도서 테이블에서 모든 행을 검색하여 도서명과 가격만 출력
    
    SELECT bookname, bookPrice FROM book;
    
    --도서 테이블에서 도서 가격이 30000이상인 도서만 도서의 도서명과 가격 출력
    SELECT bookName, bookPrice
    FROM book
    WHERE bookPrice>=30000;
    
    
    /*
        book, publisher client, bookSale
        새 사용자 생성 : YSJUSER2
        새 접속 생성 : SQLDB2
        
        4개의 텍스트 파일 IMPORT 해서 테이블 생성
        주의 ! 순서 주의(기본키, 외래키 제약 조건 설정)
        
        데이터 타입 : 
        -숫자 : bookPrice, bookStock, bsQty
        -날짜 : bsDAta, clientBirth, bookDate
        
    */
    
    
    
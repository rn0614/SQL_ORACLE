-- 관리자에서 사용자를 만들고 해당 사용자로 SQLDB 만들기

--주석 사용 방법 (--) 사용
-- 제약조건

-- 기본키 prdNo, Not NULL
-- prdName : Not NULL
-- 대소문자는 구분하지 않음

-- CREATE TABLE product (
--    prdNO VARCHAR2(10) NOT NULL,
--    prdName VARCHAR2(30) NOT NULL,
--    prdPrice NUMBER(8),
--    prdCompany  VARCHAR2(30)
-- );
 
  CREATE TABLE product (
    prdNO VARCHAR2(10) NOT NULL,
    prdName VARCHAR2(30) NOT NULL,
    prdPrice NUMBER(8),
    prdCompany  VARCHAR2(30),
    CONSTRAINT PK_product_prdNo PRIMARY KEY(prdNo)
 );

--  출판사 테이블 생성 (출판사번호, 출판사명)
-- 제약조건
-- 기본키로 pubNo 지정, NOT NULL
-- pubName : NOT NULL로 설정
 
    CREATE TABLE publisher(
        pubNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        pubName VARCHAR2(30) NOT NULL
    );
    
    
    --도서 테이블 생성(도서번호, 도서명, 가격, 발행일, 출판사 번호)
    -- 제약조건
    -- 기본키 설정 : bookNo, NOT NULL
    -- 외래키 설정 : pubNo (참조 테이블과 기본키 지정)
    -- 출판사 테이블 (publisher) 참조
    -- bookPrice를 기본값으로 10000 설정, 1000보다는 크게 설정
    
    
    CREATE TABLE book(
        bookNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        BookName VARCHAR2(3),
        bookPrice NUMBER(8) DEFAULT 10000 CHECK(bookPrice >1000),
        bookDate DATE,
        pubNo VARCHAR2(10) NOT NULL,
        CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
    );
    
    
    
    
    -- 테이블 생성 순서 : (1) publisher (2) book
    -- 데이터 입력 순서 : (1)
    
    
    CREATE TABLE department(
        dptNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        dptName VARCHAR2(30) NOT NULL,
        dptTel VARCHAR2(13)
    );
    
    CREATE TABLE student(
        stdNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        stdName VARCHAR2(30) NOT NULL,
        stdYear NUMBER(1) DEFAULT 4 CHECK(stdYear >=1 AND stdYear<=4),
        stdAddress VARCHAR2(50),
        stdBirthday DATE,
        dptNo VARCHAR2(10) NOT NULL,
        CONSTRAINT FK_student_dapartment FOREIGN KEY (dptNo) REFERENCES department (dptNo)
    );
    
    
    CREATE TABLE course(
        courseid VARCHAR2(10) NOT NULL PRIMARY KEY,
        courseTitle VARCHAR2(30) NOT NULL,
        courseCredit NUMBER(10),
        profId VARCHAR2(10),
        CONSTRAINT FK_course_professor FOREIGN KEY (profId) REFERENCES professor (profId)
    );
    
    

    
       CREATE TABLE professor(
        profId VARCHAR2(10) NOT NULL PRIMARY KEY,
        profName VARCHAR2(30),
        profPosition VARCHAR2(20),
        profTel VARCHAR2(13) ,
        dptNo VARCHAR2(10) NOT NULL,
        CONSTRAINT FK_professor_dapartment FOREIGN KEY (dptNo) REFERENCES department (dptNo)
    );
    
    
    
    CREATE TABLE scores(
        stdNo VARCHAR2(10) NOT NULL,
        courseid VARCHAR2(10) NOT NULL,
        score NUMBER(3),
        frade VARCHAR2(2),
        CONSTRAINT PK_scores_stdNo_courseid PRIMARY KEY (stdNo, courseid),
        CONSTRAINT FK_scores_student FOREIGN KEY (stdNo) REFERENCES student (stdNo),
        CONSTRAINT FK_scores_course FOREIGN KEY (courseid)REFERENCES course (courseid)
    
    );
    
    
    DROP TABLE department;
    
    ---department 테이블 삭제
    -- 외래키 관계 무시하고 기준 테이블 강제 삭제
    DROP TABLE department CASCADE CONSTRAINTS;
    
    --product 테이블 삭제
    DROP TABLE product;
    
    
    
    
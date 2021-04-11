    /*
        데이터 조작의 (DML: Data Manupulation Language)
        -데이터 입력, 삭제, 수정, 검색
        -insert문
        -delete 문
        -update 문
        -select 문
    
    */
    
    /*
        INSERT 문 : 테이블에 새로운 해를 삽입하는 명령어
        형식 : INSERT INTO 테이블명 (열, 이름, 리스트) VALUES (값 리스트);
        예 : INSERT INTO student (stdNo, stdName, stdYear, dptNo)
            VALUES ('2020001','홍길동',3,1)
    */
    
    SELECT * FROM book;
    
    -- BOOK 테이블에 데이터 입력
    INSERT INTO book(bookNo, bookName, bookPrice, bookDate, pubNo)
        VALUES('1003','데이터베이스', '23000', '2019/02/01','1');
        
        
        
     SELECT * FROM student; 
     
     INSERT ALL
       INTO student VALUES ('2021022', '이수룡','4','1985-12-12','2')
       INTO student VALUES ('2021033', '김몽룡','3','1975-12-11','1')
       INTO student VALUES ('2021004', '양몽룡','2','1945-12-11','1')
       INTO student VALUES ('2021005', '준몽룡','1','1995-12-11','1')
       SELECT*FROM dual;
     
        
        /*
            시퀀스 (sequence)
            -데이터베이스 객체로 유일한 값으로 일련번호 생성
            -저장된 수치로 증가하거나 감소
            -기본기 값을 일련번호 자동 생성할 때 사용
            -테이블과 독립적으로 저장되고 생성
            -하나의 시퀀스를 여러 테이블에서 이용 가능
        */
        
        -- 시퀀스 생성
        CREATE SEQUENCE NO_SEQ
        START WITH 1
        INCREMENT BY 1
        MAXVALUE 10000
        MINVALUE 1
        NOCYCLE;
        
        --시퀀스를 적용할 테이블 생성
        CREATE TABLE board(
            bNo NUMBER PRIMARY KEY,
            bSubject VARCHAR2(30) NOT NULL,
            bName VARCHAR2(20) NOT NULL
        );
        
        --데이터 추가
        INSERT INTO board values (NO_SEQ.NEXTVAL,'추석','홍길동');
        INSERT INTO board values (NO_SEQ.NEXTVAL,'미세먼지','이몽룡');
        INSERT INTO board values (NO_SEQ.NEXTVAL,'휴가','성춘향');
        
        SELECT*FROM board;
        
        --현재 시퀀스의 값 검색
        SELECT NO_SEQ.CURRVAL FROM dual;
        
        /*
            dual 테이블
            - 오라클 자체에서 제공되는 테이블
            1개의 행과 1개의 열
        */
    SELECT SYSDATE FROM DUAL;
    SELECT CURRENT_DATE FROM DUAL;
    
    
    --PRODUCT  TABLE에 제약조건 추가
    ALTER TABLE product
        ADD CONSTRAINT PK_product_prdNo
        PRIMARY KEY (prdNo);
        
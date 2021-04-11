
/*
    (1) 테이블 생성 : CREATE 문
    (2) 테이블 수정 : AFTER 문
    
    ALTER TABLE ADD : 열 추가
                     DROP COLUMN : 열 삭제
                     DROP : 여러개의 열 삭제
                     RENAME COLUMN : 열 이름 변경
                     MODIFY : 열 데이터 형식 변경
                     DROP PRIMARY KEY: 기본 키 삭제
                     DROP CONSTRIANT : 제약조건 삭제
    
    테이블 수정
    ALTER 문


*/

    -- 열 추가 : STUDENT 테이블에 stdTel 열 추가
    ALTER TABLE student ADD stdTel VARCHAR2(13);
    
    -- 여러 열 추가 :
    ALTER TABLE student ADD (stdAge VARCHAR2(2), stdAddress2 VARCHAR2(50));
    
    -- 열의 데이터 형식 변경 : VRCHAR2 -> NUMBER
    ALTER TABLE student MODIFY stdAge NUMBER(3);
    
    -- 열의 제약조건 변경 : stdName을 NULL 허용으로 설정
    ALTER TABLE student MODIFY stdName VARCHAR2(20) NULL;
    
    -- 열 이름 변경 : stdTel에선 stdHP로 변경
    ALTER TABLE student RENAME COLUMN stdTel TO stdHP;
    
    -- 열 삭제 : stdHP 열 삭제
    ALTER TABLE student DROP COLUMN stdHp;
    
    -- 여러 열 삭제: 
    ALTER TABLE student DROP (stdAge, stdAddress, stdAddress2);
    
    
    /*
        테이블 ALTER 연습문제
        1. product 테이블에 숫자 값을 갖는 prdStock과 제조일을 나타내는 prdDate 열 추가
        2. product 테이블의 prdCompany 열을 NOT NULL로 변경
        3. Publisher 테이블에 pubPhone, pubAddress 열 추가
        4. publisher 테이블에서 pubPhone 열 삭제
        
    */
    ALTER TABLE product ADD(prdStock NUMBER(10),prdDate DATE);
    ALTER TABLE product MODIFY prdCompany VARCHAR2(30) NOT NULL;
    ALTER TABLE Publisher ADD(pubPhone VARCHAR2(30), pubAddres VARCHAR2(50) );
    ALTER TABLE Publisher DROP COLUMN pubPhone;
    
    
    
    /* 
    기본키/외래키 삭제
    주의! 외래키 제약 조건이 설정되어 있는 경우기본키를 삭제하면 에러 발생
    */
    
    --학과 테이블의 기본키인 학과코드를 삭제할 경우
    --학과 코드를 참조하고 있는 학생 테이블이 존재하기 때문에
    --삭제할 수 없다는 에러 발생
    ALTER TABLE department DROP PRIMARY KEY;
    
    --제약조건 무시하고 기본키 제약조건을 삭제
    ALTER TABLE department DROP PRIMARY KEY CASCADE;
    
    --외래키 제약조건 삭제
    ALTER TABLE student DROP CONSTRAINT FK_STUDENT_DEPARTMENT;
    
    --기본키 제약조건 추가
    ALTER TABLE department  ADD CONSTRAINT PK_department_dptNo PRIMARY KEY (dptNo);
    
    -- 외래키 제약조건 추가
    
    /*
        ON DELTE CASCADE 
        기준 테이블의 데이터가 삭제되었을 때
        외래키 테이블의 데이터도 자동삭제
        
    */
    
    
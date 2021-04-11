-- �����ڿ��� ����ڸ� ����� �ش� ����ڷ� SQLDB �����

--�ּ� ��� ��� (--) ���
-- ��������

-- �⺻Ű prdNo, Not NULL
-- prdName : Not NULL
-- ��ҹ��ڴ� �������� ����

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

--  ���ǻ� ���̺� ���� (���ǻ��ȣ, ���ǻ��)
-- ��������
-- �⺻Ű�� pubNo ����, NOT NULL
-- pubName : NOT NULL�� ����
 
    CREATE TABLE publisher(
        pubNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        pubName VARCHAR2(30) NOT NULL
    );
    
    
    --���� ���̺� ����(������ȣ, ������, ����, ������, ���ǻ� ��ȣ)
    -- ��������
    -- �⺻Ű ���� : bookNo, NOT NULL
    -- �ܷ�Ű ���� : pubNo (���� ���̺�� �⺻Ű ����)
    -- ���ǻ� ���̺� (publisher) ����
    -- bookPrice�� �⺻������ 10000 ����, 1000���ٴ� ũ�� ����
    
    
    CREATE TABLE book(
        bookNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        BookName VARCHAR2(3),
        bookPrice NUMBER(8) DEFAULT 10000 CHECK(bookPrice >1000),
        bookDate DATE,
        pubNo VARCHAR2(10) NOT NULL,
        CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)
    );
    
    
    
    
    -- ���̺� ���� ���� : (1) publisher (2) book
    -- ������ �Է� ���� : (1)
    
    
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
    
    ---department ���̺� ����
    -- �ܷ�Ű ���� �����ϰ� ���� ���̺� ���� ����
    DROP TABLE department CASCADE CONSTRAINTS;
    
    --product ���̺� ����
    DROP TABLE product;
    
    
    
    
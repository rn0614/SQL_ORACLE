    /*
        ������ ������ (DML: Data Manupulation Language)
        -������ �Է�, ����, ����, �˻�
        -insert��
        -delete ��
        -update ��
        -select ��
    
    */
    
    /*
        INSERT �� : ���̺� ���ο� �ظ� �����ϴ� ��ɾ�
        ���� : INSERT INTO ���̺�� (��, �̸�, ����Ʈ) VALUES (�� ����Ʈ);
        �� : INSERT INTO student (stdNo, stdName, stdYear, dptNo)
            VALUES ('2020001','ȫ�浿',3,1)
    */
    
    SELECT * FROM book;
    
    -- BOOK ���̺� ������ �Է�
    INSERT INTO book(bookNo, bookName, bookPrice, bookDate, pubNo)
        VALUES('1003','�����ͺ��̽�', '23000', '2019/02/01','1');
        
        
        
     SELECT * FROM student; 
     
     INSERT ALL
       INTO student VALUES ('2021022', '�̼���','4','1985-12-12','2')
       INTO student VALUES ('2021033', '�����','3','1975-12-11','1')
       INTO student VALUES ('2021004', '�����','2','1945-12-11','1')
       INTO student VALUES ('2021005', '�ظ���','1','1995-12-11','1')
       SELECT*FROM dual;
     
        
        /*
            ������ (sequence)
            -�����ͺ��̽� ��ü�� ������ ������ �Ϸù�ȣ ����
            -����� ��ġ�� �����ϰų� ����
            -�⺻�� ���� �Ϸù�ȣ �ڵ� ������ �� ���
            -���̺�� ���������� ����ǰ� ����
            -�ϳ��� �������� ���� ���̺��� �̿� ����
        */
        
        -- ������ ����
        CREATE SEQUENCE NO_SEQ
        START WITH 1
        INCREMENT BY 1
        MAXVALUE 10000
        MINVALUE 1
        NOCYCLE;
        
        --�������� ������ ���̺� ����
        CREATE TABLE board(
            bNo NUMBER PRIMARY KEY,
            bSubject VARCHAR2(30) NOT NULL,
            bName VARCHAR2(20) NOT NULL
        );
        
        --������ �߰�
        INSERT INTO board values (NO_SEQ.NEXTVAL,'�߼�','ȫ�浿');
        INSERT INTO board values (NO_SEQ.NEXTVAL,'�̼�����','�̸���');
        INSERT INTO board values (NO_SEQ.NEXTVAL,'�ް�','������');
        
        SELECT*FROM board;
        
        --���� �������� �� �˻�
        SELECT NO_SEQ.CURRVAL FROM dual;
        
        /*
            dual ���̺�
            - ����Ŭ ��ü���� �����Ǵ� ���̺�
            1���� ��� 1���� ��
        */
    SELECT SYSDATE FROM DUAL;
    SELECT CURRENT_DATE FROM DUAL;
    
    
    --PRODUCT  TABLE�� �������� �߰�
    ALTER TABLE product
        ADD CONSTRAINT PK_product_prdNo
        PRIMARY KEY (prdNo);
        
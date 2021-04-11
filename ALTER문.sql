
/*
    (1) ���̺� ���� : CREATE ��
    (2) ���̺� ���� : AFTER ��
    
    ALTER TABLE ADD : �� �߰�
                     DROP COLUMN : �� ����
                     DROP : �������� �� ����
                     RENAME COLUMN : �� �̸� ����
                     MODIFY : �� ������ ���� ����
                     DROP PRIMARY KEY: �⺻ Ű ����
                     DROP CONSTRIANT : �������� ����
    
    ���̺� ����
    ALTER ��


*/

    -- �� �߰� : STUDENT ���̺� stdTel �� �߰�
    ALTER TABLE student ADD stdTel VARCHAR2(13);
    
    -- ���� �� �߰� :
    ALTER TABLE student ADD (stdAge VARCHAR2(2), stdAddress2 VARCHAR2(50));
    
    -- ���� ������ ���� ���� : VRCHAR2 -> NUMBER
    ALTER TABLE student MODIFY stdAge NUMBER(3);
    
    -- ���� �������� ���� : stdName�� NULL ������� ����
    ALTER TABLE student MODIFY stdName VARCHAR2(20) NULL;
    
    -- �� �̸� ���� : stdTel���� stdHP�� ����
    ALTER TABLE student RENAME COLUMN stdTel TO stdHP;
    
    -- �� ���� : stdHP �� ����
    ALTER TABLE student DROP COLUMN stdHp;
    
    -- ���� �� ����: 
    ALTER TABLE student DROP (stdAge, stdAddress, stdAddress2);
    
    
    /*
        ���̺� ALTER ��������
        1. product ���̺� ���� ���� ���� prdStock�� �������� ��Ÿ���� prdDate �� �߰�
        2. product ���̺��� prdCompany ���� NOT NULL�� ����
        3. Publisher ���̺� pubPhone, pubAddress �� �߰�
        4. publisher ���̺��� pubPhone �� ����
        
    */
    ALTER TABLE product ADD(prdStock NUMBER(10),prdDate DATE);
    ALTER TABLE product MODIFY prdCompany VARCHAR2(30) NOT NULL;
    ALTER TABLE Publisher ADD(pubPhone VARCHAR2(30), pubAddres VARCHAR2(50) );
    ALTER TABLE Publisher DROP COLUMN pubPhone;
    
    
    
    /* 
    �⺻Ű/�ܷ�Ű ����
    ����! �ܷ�Ű ���� ������ �����Ǿ� �ִ� ���⺻Ű�� �����ϸ� ���� �߻�
    */
    
    --�а� ���̺��� �⺻Ű�� �а��ڵ带 ������ ���
    --�а� �ڵ带 �����ϰ� �ִ� �л� ���̺��� �����ϱ� ������
    --������ �� ���ٴ� ���� �߻�
    ALTER TABLE department DROP PRIMARY KEY;
    
    --�������� �����ϰ� �⺻Ű ���������� ����
    ALTER TABLE department DROP PRIMARY KEY CASCADE;
    
    --�ܷ�Ű �������� ����
    ALTER TABLE student DROP CONSTRAINT FK_STUDENT_DEPARTMENT;
    
    --�⺻Ű �������� �߰�
    ALTER TABLE department  ADD CONSTRAINT PK_department_dptNo PRIMARY KEY (dptNo);
    
    -- �ܷ�Ű �������� �߰�
    
    /*
        ON DELTE CASCADE 
        ���� ���̺��� �����Ͱ� �����Ǿ��� ��
        �ܷ�Ű ���̺��� �����͵� �ڵ�����
        
    */
    
    
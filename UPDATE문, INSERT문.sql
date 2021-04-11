
/*
    UPDATE ��
    -Ư�� ���� ���� �����ϴ� ��ɾ�
    -���ǿ� �´� ���� ã�Ƽ� ���� �� ����
    -���� : WHERE
    
    ���� : UPDATE ���̺�� SET �� = �� WHERE ����;

    �� : ��ǰ��ȣ�� 5�� ���� ��ǰ�� 'UHD TV'�� ����
    UPDATE product SET prdName = 'UHD TV' WHERE prdNo ='5';
*/
    --��ǰ ���̺� ��ȸ
    SELECT*FROM product;
    SELECT prdName,prdPrice FROM product;
    
    --�� : ��ǰ��ȣ�� 5�� ���� ��ǰ�� 'UHD TV'�� ����
    UPDATE product SET prdName = 'UHD TV' WHERE prdNo ='5';

    -- ��ǰ�� �״ø� ��Ʈ �ΰ��� ���� 50000������ ����    
    UPDATE product SET prdPrice =50000 WHERE prdName = '�״ø� ��Ʈ';
    
    /*
        delete ��
        - ���̺� �ִ� ���� ���� ����
        
        ���� : delete from ���̺�� where ����;
        
        DELETE FROM product WHERE prdName='�״ø� ��Ʈ';
    */
    --��ǰ�� '�״ø� ��Ʈ'�� �� ����
    DELETE FROM product WHERE prdName='�״ø� ��Ʈ';
    
    /*
         ��������
         (1) book ���̺� ������ ���� �� ����
          6 JAVA ���α׷��� 33000  2021-02-10 ���� ���ǻ�
          7 ���̽�             24000   2019-10-10  �������� ����
          
          
          (2)book ���̺��� �������� '������ ���̽�' �� ���� ������ 22000���� ����
    */
    SELECT*FROM book;
    
    
    -- ��������
    --1. �� ���̺� (COSTIMER) ����
    CREATE TABLE customer(
        custNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        custName VARCHAR2(30),
        custPhone VARCHAR2(13),
        custAddress VARCHAR2(50)
    );
    
    --2. �ֹ����̺� ����(������ PRODUCT ���̺� ���� �ֹ�)
    --�ֹ���ȣ, �ֹ���, �ֹ�����, ����ȣ, ��ǰ��ȣ
    CREATE TABLE orderProduct(
        ordNo VARCHAR2(10) NOT NULL PRIMARY KEY,
        orderDate Date,
        orderQty NUMBER(3), 
        custNo VARCHAR2(10) NOT NULL,
        prdNo VARCHAR2(4) NOT NULL,
        CONSTRAINT FK_orderProduct_customer FOREIGN KEY (custNo) REFERENCES customer (custNo),
        CONSTRAINT FK_orderProduct_product FOREIGN KEY (prdNo) REFERENCES product (prdNo)
    );
    
    -- 3. �� ���̺��� ��ȭ��ȣ �� not null ����
    ALTER TABLE customer MODIFY custPhone VARCHAR2(13) NOT NULL;
    
    --4. �� ���̺� '����', '����' �� �߰�
    ALTER TABLE customer ADD(custGender VARCHAR2(3), custAge NUMBER(3));
    
    --5. �� �ֹ� ���̺� ������ ����
    INSERT INTO customer VALUES('1001','�̸�','��ȭ��ȣ','��ġ','��',25);
    INSERT INTO customer VALUES('1002','�̸�2','��ȭ��ȣ2','��ġ2','��',24);
    INSERT INTO customer VALUES('1003','�̸�3','��ȭ��ȣ3','��ġ3','��',22);
  
    SELECT*FROM customer ;
    SELECT*FROM orderproduct ;
    
    INSERT INTO orderProduct VALUES('1','2021-02-10',3,'1003','10');
    INSERT INTO orderProduct VALUES('2','2021-02-11',20,'1001','5');
    INSERT INTO orderProduct VALUES('3','2021-02-12',5,'1002','17');
    INSERT INTO orderProduct VALUES('4','2021-02-10',1,'1003','2');
    

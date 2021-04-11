
-- �����Լ�
/*
    �����Լ�
    - REPLACE() : ���ڿ� ġȯ
    - LENGTH() : ���� �� ��ȯ
    - LENGTHB() : ����Ʈ ����ȯ
    - SUBSTR() : ������ ���̸�ŭ ���ڿ� ��ȯ

*/

-- REPLACE() : ���ڿ� ġȯ
    SELECT REPLACE('�ڹ� ���α׷��� �ڹ� ', '�ڹ�','���̽�') FROM dual;
    --'�ڹ�' ��ü�� '���̽�'���� ġȯ
    
--TRANCSLATE()
    SELECT TRANSLATE('apple airplane apart', 'ap', '*^') FROM dual;
    -- 'ap'�� '*^'�� ġȯ
    -- ù ��° ���� a �� *�� ġȯ.
    -- �� ��° ���� p �� ^�� ġȯ.
    
    --�ȵ���̵带 ����� 
    SELECT bookNo, REPLACE(bookName, '�ȵ���̵�', 'Android') bookName, bookAuthor, bookPrice
    FROM book
    WHERE bookName LIKE '%�ȵ���̵�%'
    --���� ���̺��� �Ⱥ���
    
    SELECT*FROM BOOK;
    
-- LENGTH() : ���� �� ��ȯ
-- LENGTHB() : ����Ʈ ����ȯ
    --'���� ���ǻ�'���� �Ⱓ�� ������ ������� �������� ���ڼ�, ����Ʈ �� , ���ǻ�� ���
    SELECT B.bookName AS "������", LENGTH(bookName) AS "����",
                            LENGTHB(bookName) AS "����Ʈ", P.pubName AS "���ǻ�"
    FROM book B
        INNER JOIN publisher P ON B.pubNo = P.pubNo
    WHERE P.pubName = '���� ���ǻ�';    
    
    --�ѱ� : 3����Ʈ /����,����,�����̽� : 1����Ʈ

-- SUBSTR(��ü ���ڿ�, �����ε���, ����) : ������ ���̸�ŭ ���ڿ� ��ȯ

-- ���� ���̺� : ���� �̸����� ������ ���
    SELECT SUBSTR(bookAuthor, 1, 1 ) AS "��"
    FROM book;

-- �������̺� : �̸��� ���
    SELECT SUBSTR(bookAuthor, 2, 2 ) AS "�̸�"
    FROM book;

-- ���� �վ�
    SELECT bookAuthor
    FROM book
    WHERE SUBSTR(bookAuthor, 1, 1 )= '��'
    
-- ���� �̸����� ���� ���� ���?
    SELECT SUBSTR(bookAuthor, 1, 1) AS "��", COUNT(*) AS "�ο���"
    FROM book
    GROUP BY SUBSTR(bookAuthor, 1, 1);
    
-- CONCAT() : ���ڿ� �����Լ�
-- || : ���ڿ� ���� ������

    SELECT CONCAT('���ڿ�', '������1'), '���ڿ�'||''||'������2' FROM dual;
    
    SELECT CONCAT(bookAuthor, ' : ', bookname, ' : ' , bookPrice) FROM book;
    SELECT '���ڿ�1' || ' : ' || '���ڿ�2' || ':' || '���ڿ�3' FROM dual;
    
    SELECT bookAuthor || ' : ' || bookName ||' : '|| bookPrice
    FROM book;
    
    -- INSTR(���� ���ڿ�, ������ ���ڿ�, ã�� ���� ��ġ, ������ġ) : ��ġ ��ȯ
    -- ���ڿ�(string) ���� ������ ���ڿ� (substring)�� ã�Ƽ� ��ġ ��ȯ
    -- ������ ���ڿ��� ù ��° �����ϴ� ��ġ ��ȯ
    SELECT INSTR('�ʵ��л� ����л� ���л�','�л�',1,1) FROM dual; --3
    
    -- 5��° ���ں��� ã�Ƽ� �� ��° ������ ��ġ
    SELECT INSTR('�ʵ��л� ���л� ����л� ���л� �л�', '�л�', 5, 2) FROM dual;
    
    -- LOWER() / UPPER() / INITCAP()  ù���ڸ� �빮�ڷ� ��ȯ
    SELECT LOWER('java Programming'), UPPER('java Programming'), INITCAP('java Programming')
    FROM dual;
    
    --LPAD(���ڿ�, ����, ä�� ���ڿ�) : ���ʺ��� ä��
    --RPAD(���ڿ�, ����, ä�� ���ڿ�) : �����ʺ��� ä��
    SELECT LPAD('������ ���̽�', 20, '*') FROM dual;
    SELECT RPAD('������ ���̽�', 20, '*') FROM dual;
    
    --TRIM(������ ���� FROM ���ڿ�) : ���ڿ� �� �� ���� ����
    -- ������ ���� : LEADING(��) BOTH(����) TRAILING (��)
    SELECT TRIM('    ����    ') FROM dual;
    SELECT TRIM(LEADING '* 'FROM '***�����ͺ��̽�***)'FROM dual;
    SELECT TRIM(TRAILING '*' FROM '***�����ͺ��̽�***')FROM dual;
    SELECT TRIM(BOTH '*'FROM '***�����ͺ��̽�***')FROM dual;
    
    -- ���� ��� �Լ�
    -- RANK() /DENSE_RANK() / ROW_NUMBER()
    --RANK() : ���� ���� ��ȯ (���� ���� ������ŭ ����)
    -- DENSE_RANK() : ���� ���� ��ȯ(���� ���� ��� ���� 1 ����)
    -- ROW_NUMBER() : ���� ���� ��ȯ
    SELECT bookPrice,
            RANK() OVER (ORDER BY bookPrice DESC) "RANK",
            DENSE_RANK() OVER (ORDER BY bookPrice DESC) "DENS_RANK",
            ROW_NUMBER() OVER (ORDER BY bookPrice DESC) "ROW_NUMBER"
    FROM book;
    
    -- TOP N ��� : ROWNUM ���
    -- �������� ���� 1~5 �� ���
    SELECT ROWNUM , bookPrice
    FROM (select bookPrice from book order by bookPrice desc)book
    WHERE ROWNUM BETWEEN 1 AND 5
    ORDER BY bookPrice DESC;
    
    SELECT bookPrice
    FROM book
    ORDER BY bookPrice;
    
    -- �׷��� �Ұ�� �Ѱ� ���
    -- ROLLUP() /CUBE() /GROUPING SET()
    --ROLLUP()
        -- �׷��� �Ұ�� �Ѱ� ����
        -- ������ �߿�, �� �տ� ���� �Ϳ� �Ұ� ����
    -- CUBE()
        -- �� �׷��� ��� ����� ���� ���� �Ұ�� �Ѱ� ����
        -- �׸�鰣 ���������� �Ұ踦 ���
    --GROUPING SETS()
        -- Ư�� �׸� ���� �Ұ� ����
        
    CREATE TABLE cubeTBL(
     prdName VARCHAR2(10),
     color VARCHAR2(6),
     amount NUMBER(2)
    );
    
    INSERT INTO cubeTBL VALUES('��ǻ��','����', 11);
    INSERT INTO cubeTBL VALUES('��ǻ��','�Ķ�', 22);
    INSERT INTO cubeTBL VALUES('�����','����', 33);
    INSERT INTO cubeTBL VALUES('�����','�Ķ�', 44);
    INSERT INTO cubeTBL VALUES('���콺','����', 55);
    INSERT INTO cubeTBL VALUES('���콺','�Ķ�', 66);
    
    SELECT*FROM cubeTBL;
    
    --CUBE() �Լ� : �� �׷��� ��� ����� ���� ���� �Ұ�� �Ѱ踦 ����
    -- �׸�� �� ������ �Ұ� ���
    
    SELECT prdName, color, SUM(amount) AS "�����հ�"
    FROM cubeTBL
    GROUP BY CUBE(color, prdName) -- ���� �����ص� ��� ����
    ORDER BY prdName, color;
    
    
    --ROLLUP()  : �׷��� �Ұ踦 ����. prdName �켱(���� �߿�)
    SELECT prdName, color, SUM(amount) AS "�����հ�"
    FROM cubeTBL
    GROUP BY ROLLUP(prdName, color)
    ORDER BY prdName, color;    
    
    
    SELECT prdName, color, SUM(amount) AS "�����հ�"
    FROM cubeTBL
    GROUP BY ROLLUP(color, prdName) --�� ó���� �ִ� color�� ���ؼ��� �Ұ�
    ORDER BY prdName, color; 
    
    
    --GROUPING SET()
    --�׸� �Ұ踸 ���(������ ���� ��°��� ������ �ٸ�.)
    SELECT prdName, color, SUM(amount) AS "�����"
    FROM cubeTBL
    GROUP BY GROUPING SETS(prdName, color); -- ���� �׸��� ���� ���
    
    -- ROLLUP() /CUBE() /GROUPING SET() ���� 2
    
    CREATE TABLE sales(
        prdName VARCHAR2(20),
        salesDate VARCHAR2(10),
        prdCompany VARCHAR2(10),
        salesAmount NUMBER(8)
    );
    
    INSERT INTO sales VALUES ('��Ʈ��', '2021.01','�Ｚ',10000);
    INSERT INTO sales VALUES ('��Ʈ��', '2021.03','�Ｚ',20000);
    INSERT INTO sales VALUES ('�����', '2021.01','�Ｚ',12000);
    INSERT INTO sales VALUES ('�����', '2021.03','�Ｚ',12000);
    INSERT INTO sales VALUES ('������', '2021.01','�Ｚ',3000);
    INSERT INTO sales VALUES ('������', '2021.03','�Ｚ',1000);
    
    SELECT*FROM sales;
    
    -- CUBE()  �Լ� ����ؼ� �Ұ� �� �Ѱ� ���
    
    SELECT prdName,salesDate,prdCompany, sum(salesAmount) AS "�����"
    FROM sales
    GROUP BY CUBE(prdName,salesDate,prdCompany)
    ORDER BY prdName,salesDate,prdCompany;
    
    
    -- ��ǰ�� �Ұ踸 ���, �Ѱ� ���
    SELECT prdName,salesDate,prdCompany, sum(salesAmount) AS "�����"
    FROM sales
    GROUP BY ROLLUP(prdName,salesDate,prdCompany)
    ORDER BY prdName,salesDate,prdCompany;
    
    SELECT prdName,salesDate,prdCompany, sum(salesAmount) AS "�����"
    FROM sales
    GROUP BY GROUPING SETS(prdName,salesDate,prdCompany)
    ORDER BY prdName,salesDate,prdCompany;
    
    
    --��¥ ���� �Լ�
    --EXTRACT() /ADD_MONTHS()
    -- �� ��ȯ �Լ� : TO_CHAR()
    
    SELECT SYSDATE FROM dual; -- ����
    SELECT CURRENT_DATE FROM dual;
    SELECT SYSDATE +1 FROM dual; --����
    SELECT SYSDATE -1 FROM dual;
        
    SELECT ADD_MONTHS(SYSDATE,-1) FROM dual;
    
    SELECT ADD_MONTHS(SYSDATE, -12) FROM dual;
    
    --EXTRACT() : ���� ��¥���� ��, ��, ��, ����
    
    SELECT EXTRACT(YEAR FROM SYSDATE) ��,
              EXTRACT(MONTH FROM SYSDATE) ��,
              EXTRACT(DAY FROM SYSDATE) ��
    FROM dual;
    
    --�۳�, ����, ����
    SELECT EXTRACT(YEAR FROM SYSDATE ) -1 �۳�,
              EXTRACT(YEAR FROM SYSDATE ) ����,
              EXTRACT(YEAR FROM SYSDATE ) +1 ����
    FROM dual;
    
    -- (1) �����ֹ� ���̺��� �ֹ��Ͽ� 7�� ���� ���� ����Ϸ� ���
    SELECT bsdate �ֹ���,bsDate+7 AS "�����"
    FROM booksale;
    
    -- (2) ���� ���̺��� ������� ���ǿ��� ���
    SELECT bookName ������, EXTRACT(YEAR FROM bookdate) ���ǳ⵵
    FROM book;
    
    
    SELECT CURRENT_TIMESTAMP FROM dual;
    
    SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') FROM dual;
    
    
    SELECT TO_CHAR(SYSDATE, 'HH24') ��,
              TO_CHAR(SYSDATE, 'MI') ��,
              TO_CHAR(SYSDATE, 'SS') ��
    FROM dual;
    
    --��¥ ���� : ��, ��, ��
    SELECT TO_CHAR(SYSDATE ,'YYYY') ��,
              TO_CHAR(SYSDATE ,'MM') ��,
              TO_CHAR(SYSDATE ,'DD') ��
    FROM dual;
    

    SELECT TO_CHAR(BSDATE,'MM') ��
    FROM BOOKSALE;
    
    
    UPDATE client SET clientHobby= '����'
    WHERE NVL2(clientHobby,'Y', 'N')='N' OR clientHobby =' ';
    
    SELECT clientHobby FROM client;
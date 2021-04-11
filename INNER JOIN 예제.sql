/*R
    ����(JOIN)
    - ���� ���� ���̺��� �����Ͽ� ���ǿ� �´� �� �˻�
    
    ������ ����
    - INNER JOIN (���� ����)
        -����Ǵ� ��(�Ӽ�)�� ������ ���
        -���� �Ӽ��� �Ӽ� ���� ������ Ʃ�ø� ��ȯ
        - ��: ��ǰ�� �ֹ��� ���� �ִ� �� ��ȸ
        
    - OUTTER JOIN (�ܺ� ����)
        -����Ǵ� ��(�Ӽ�)�� ���� �� ���
        -����� �Ӽ��� �Ű��� �ϴ� ������ ������ ������ �ʰ�
         ������ ����� �����̼ǿ� ǥ��
        -�� : �ֹ����� ���� ���� ��ȸ 
*/

-- �ѹ��̶� ������ �ֹ��� ���� �ִ� �� ��ȸ
SELECT*
FROM client
    INNER JOIN bookSale
    ON client.clientNo = bookSale.clientNo;
    
    
    --�ʿ��� ���� ����
    --���̺�� ��� ��Ī (Alias) ���
    --�� ���̶� ������ �ֹ��� ���� �ִ� ����
    --����ȣ�� ���� ���
    SELECT C.clientNo, C.clientName
    FROM client C
        INNER JOIN bookSale BS
        ON C.clientNo = BS.clientNo;
        
    --�� ���̶� ������ �ֹ��� ���� �ִ� ����
    --����ȣ�� ���� ���
    --�ߺ��Ǵ� ���� �� ���� ���
    --����ȣ�� �������� �������� ����
    
    SELECT UNIQUE C.clientNo, C.clientName
    FROM client C
        INNER JOIN bookSale BS
        ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo ASC;
    /*
        3���� ���̺� ���� : �⺻Ű = �ܷ�Ű ������ 2�� ����
        book (bookNo)
        client (clientNo)
        bookSale (bsNo, bookNo, clientNo)
        
    */ 
    
    -- �ֹ��� ������ ���Ͽ� ������ �ֹ��� ����� �������� ���
    --������ 2���� �������(�����)
    SELECT C.clientName, b.bookName
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.clientNo
        INNER JOIN book B On B.bookNo = BS.bookNo;
        
        
    SELECT BS.bsNo, BS.bookNo, C.clientno, C.clientName, B.bookName,Bs.bsQty
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.clientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
    ORDER BY BS.bsNo;
    
    -- ������ �� �ֹ����� ���
    -- ����ȣ, ����, ���ֹ� ���� ���
    -- �Ѻι����� ���� �������� ����
    
    SELECT C.clientNo, C.clientName, SUM(BS.bsQty) AS "�� �ֹ�����"
    FROM bookSale BS
        INNER JOIN client C ON C.CLIENTnO = bs.ClientNo
    GROUP BY C.clientNo, C.clientName  -- ���� �ٸ� ���ε� ���� �׷����� ���� ������.(�ݵ�� �Ѵ� �� ��)
    ORDER BY "�� �ֹ�����" DESC;
    
    --�ֹ��� ������ �ֹ���, ����, ������, ��������, �ֹ�����, �ֹ��� ����ؼ� ���
    --�ֹ��� ���� ��������
    
    SELECT BS.bsDate, C.clientName, B.BookName, B.bookPrice, BS.bsQty, (BS.bsQty*B.bookPrice) AS "�ֹ���"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = bs.ClientNo
        INNER JOIN book B ON B.bookNo = bs.bookNo
    ORDER BY "�ֹ���" DESC ;
    
    -- WHERE �� �߰�
    -- 2018 ~  ������� �Ǹŵ� �������� �ֹ��� ,
    SELECT BS.bsDate, C.clientName, B.BookName, B.bookPrice, BS.bsQty, (BS.bsQty*B.bookPrice) AS "�ֹ���"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = bs.ClientNo
        INNER JOIN book B ON B.bookNo = bs.bookNo
    WHERE BS.bsDate >='2019-01-01' 
    ORDER BY "�ֹ���" DESC ;
    -- 19�� �� �ֹ� �Ⱥ���.
    
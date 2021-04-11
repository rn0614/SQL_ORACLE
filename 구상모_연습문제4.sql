--1. ��� ������ ���Ͽ� ������ ������ȣ, ������, ���ǻ�� ���
SELECT B.bookNo, B.bookName, P.pubName
FROM book B
    INNER JOIN publisher P ON P.pubNo = b.pubNo;
    
--2. ������ ���ǻ�'���� �Ⱓ�� ������ ������, ���ڸ�, ���ǻ�� ��� (���ǻ�� ���)
    SELECT B.bookName, B.bookAuthor, P.pubName AS "���ǻ��"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE P.pubName= '���� ���ǻ�' ;

--3. '�������ǻ�'���� �Ⱓ�� ���� �� �Ǹŵ� ������ ������ ��� (�ߺ��� ��� �� ���� ���) (���ǻ�� ���)
    SELECT UNIQUE B.bookName
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE P.pubName= '�������ǻ�' ;

--4. ���������� 30,000�� �̻��� ������ �ֹ��� ���� ����, ������, ��������, �ֹ����� ���
    SELECT C.clientName, B.bookName,B.bookPrice,Bs.bsQty
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE B.bookPrice>=30000 ;

--5. '�ȵ���̵� ���α׷���' ������ ������ ���� ���Ͽ� ������, ����, ����, �ּ� ��� (�������� �������� ����)
    SELECT B.bookName, C.clientName, C.Clientgender, C.clientaddress
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE B.bookName LIKE '�ȵ���̵� ���α׷���' 
    ORDER BY C.clientName;

--6. ���������� ����'���� �Ⱓ�� ���� �� �Ǹŵ� ������ ���Ͽ� ���� ����ס� ���
    SELECT  SUM(B.bookPrice * BS.bsQty) AS "�� �����"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE P.pubName LIKE '�������� ����' ;

--7. ������ ���ǻ�'���� �Ⱓ�� ������ ���Ͽ� �Ǹ���, ���ǻ��, ������, ��������, �ֹ�����, �ֹ��� ���
    SELECT  BS.bsdate, p.pubName, B.bookName, B.bookPrice, bs.bsQty, (B.bookPrice*bs.bsQty )As "�ֹ���"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    WHERE P.pubName LIKE '���� ���ǻ�' ;

--8. �Ǹŵ� ������ ���Ͽ� �������� ������ȣ, ������, �� �ֹ� ���� ���
    SELECT  B.bookNo, B.bookName,SUM( bs.bsQty) As "�� �ֹ� ����"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
    GROUP BY B.bookNo, bookName, bs.bsQty;
   
--9. �Ǹŵ� ������ ���Ͽ� ������ ����, �ѱ��ž� ��� ( �ѱ��ž��� 100,000�� �̻��� ��츸 �ش�)
    SELECT  C.clientName, SUM(B.bookPrice*bs.bsQty)As "���ž�"
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
     GROUP BY  C.clientName, (B.bookPrice*bs.bsQty)
     HAVING SUM(B.bookPrice*bs.bsQty)>100000;



--10. �Ǹŵ� ���� �� ���������� ����'���� �Ⱓ�� ������ ���Ͽ� ����, �ֹ���, ������, �ֹ�����, ���ǻ�� ��� (�������� �������� ����)
    SELECT C.clientName, BS.bsdate, BS.bsQty, P.pubName
    FROM bookSale BS
        INNER JOIN client C ON C.clientNo = BS.ClientNo
        INNER JOIN book B ON B.bookNo = BS.bookNo
        INNER JOIN publisher P ON P.pubNo = B.pubNo
     WHERE P.pubName = '�������� ����'
     ORDER BY C.clientName;
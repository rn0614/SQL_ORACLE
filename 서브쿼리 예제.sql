 -- �� ȣ������ �ֹ����� ��ȸ
 -- 1. client ���̺��� 'ȣ����'�� clientNo�� ã�Ƽ�
 -- 2. bookSale ���̺��� �� clientno�� �ش�Ǵ� ������ ����
 -- 3. �ֹ���, �ֹ����� ���
 
 
 SELECT bsDate, bsQty
 FROM bookSale
 WHERE clientNo = (SELECT clientNo
                            FROM client
                            WHERE clientName ='ȣ����');
                            
                            
--�� ȣ���ΰ� �ֹ��� �� �ֹ� ����
 SELECT sum(bsQty) AS "�� �ֹ� ����"
 FROM bookSale
 WHERE clientNo = (SELECT clientNo
                            FROM client
                            WHERE clientName ='ȣ����');
                            
                            
-- ���� ��� ������ ������� ���� ���
SELECT bookName, bookPrice
 FROM book
 WHERE bookPrice = (SELECT MAX(bookPrice)
                            FROM book);
                            
--������ ��� ���ݺ��� ��� ������ ������, ���� ���

SELECT bookName, bookPrice
 FROM book
 WHERE bookPrice > (SELECT AVG(bookPrice) AS "��� ���� ����"
                            FROM book);
                            
                            
-- �������ǻ翡�� �Ⱓ�� ������ ������ ���� �ִ� ���� ���
SELECT clientName
 FROM client
 WHERE clientNo IN  (SELECT clientNo
                            FROM booksale
                            WHERE bookNo IN(SELECT bookNo
                                                    FROM book
                                                    WHERE pubNo in (SELECT pubNo
                                                                        FROM publisher
                                                                        WHERE pubName ='�������ǻ�')));

-- �� ���� �ֹ��� ���� ���� ���� ����ȣ, ���� ���
SELECT clientNo, clientName
FROM client
WHERE clientNo NOT IN (SELECT clientNo
                                FROM bookSale);
                                
SELECT clientNo, clientName
FROM client
WHERE NOT EXISTS (SELECT clientNo
                           FROM bookSale
                           WHERE client.clientno = bookSale.clientNo); -- ���� ��찡 ���� �� (NULL���� ������� ���� )
                           
                           
-- NULL �� ��� IN�� EXISTS ����
SELECT clientHobby FROM client;

--EXISTS : ���� ���� ����� NULL �� ����

-- NULL �� �����Ͽ� ��� clientNo ���(exists �� nul�����ؼ� 9�� in�� 6��)
 SELECT clientNo
 FROM client
 WHERE EXISTS (SELECT clientHobby
                      FROM client);
                      
                      
SELECT clientNo
 FROM client
 WHERE clientHobby IN (SELECT clientHobby
                                 FROM client);
                                 
-- ALL : ��� ������ ���� ������ ����� ��� ���� �����ϸ� ���� �Ǵ� ������
-- ���� > ALL (���� ���� ���)
-- 2�� ���� �ֹ��� ������ �ְ� �ֹ��������� �� ���� ������ ������ ��
-- 2�� ���� �ֹ��� ��� �ֹ����� �߻��� �ֹ��������� �� ���� ������ ������ ��
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ALL (SELECT BsQty
                            FROM bookSale
                            WHERE clientNo ='2');

--Any                            
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ANY (SELECT BsQty
                            FROM bookSale
                            WHERE clientNo ='2');
                            
SELECT * FROM BookSale ;


/*
    ���� ���� ����
    - ��Į�� ���� ���� : SELECT �� ��ġ / ���� �� ��ȯ
    - �ζ��� �� : FROM �� ��ġ / ����� ��(���� ���̺� )���·� ��ȯ�� ��
    - ��ø ���� ���� : WHERE �� ��ġ
    
*/

 -- ��Į�� ���� ���� : SELECT ������ ���
 -- ��� ���� ���� ���� ��Į�� ������ ��ȯ
 -- ������ �� �ֹ� ���� ���
 SELECT clientNo,(SELECT clientName
                        FROM client
                        WHERE client.clientNo = bookSale.clientNo) AS "����", SUM(bsQty)
                        
FROM bookSale
GROUP BY clientNo;

--�ζ��� �� : FROM ������ ���
-- ����� ��(���� ���̺�) ���·� ��ȯ
SELECT bookName, bookPrice, SUM(bsQty) AS "���Ǹż���", SUM(bookPrice*bsQty) AS "���Ǹž�"
FROM(SELECT bookNo, bookName, bookPrice
        FROM book
        WHERE bookPrice >= 25000), bookSale
WHERE book.bookNo = bookSale.bookNo
GROUP BY book.bookNo, bookName, bookPrice
ORDER BY "���Ǹž�" DESC;
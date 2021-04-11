/*
    select �� : ���̺��� ���ǿ� �´� �� �˻�(��ȯ)
    �⺻ ����
    SELECT ���̸�      -   �˻��� �� (����Ʈ ) ���
    FROM ���̺��   
    [WHERE ����]
    [GROUP BY ���̸�]      - �׷� ���Ǹ� ����� �� ��� (Ư�� ���� �׷�ȭ�� �� �� �׷쿡 ���� ��� ����)
    [HAVING �˻� ����]      - GROUP BY ���� ���� ������ �׷쿡 ���� ������ ����
    [ORDER BY ���̸� [ASC | DESC]]     - Ư�� ���� ���� �������� ���� ��� ����
                                                ASC : �������� ���� | DESC : �������� ����
*/


-- ��� ��, ��� �� �˻�
    SELECT*FROM book;
    
    -- ���� ���̺��� ��� ���� �˻��Ͽ� ������� ���ݸ� ���
    
    SELECT bookname, bookPrice FROM book;
    
    --���� ���̺��� ���� ������ 30000�̻��� ������ ������ ������� ���� ���
    SELECT bookName, bookPrice
    FROM book
    WHERE bookPrice>=30000;
    
    
    /*
        book, publisher client, bookSale
        �� ����� ���� : YSJUSER2
        �� ���� ���� : SQLDB2
        
        4���� �ؽ�Ʈ ���� IMPORT �ؼ� ���̺� ����
        ���� ! ���� ����(�⺻Ű, �ܷ�Ű ���� ���� ����)
        
        ������ Ÿ�� : 
        -���� : bookPrice, bookStock, bsQty
        -��¥ : bsDAta, clientBirth, bookDate
        
    */
    
    
    
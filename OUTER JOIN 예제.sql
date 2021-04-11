-- ���� (LEFT) ����
SELECT *
FROM client C
    LEFT OUTER JOIN bookSale BS ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo;
    
SELECT*FROM CLIENT

-- ������(RIGHT) ����
SELECT *
FROM client C
    RIGHT OUTER JOIN bookSale BS ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo;
    
    
-- FULL OUTER JOIN
SELECT *
FROM client C
    FULL OUTER JOIN bookSale BS ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo;
    
    
    -- ����Ŭ�� OUTER ����
    --(+) �����ڷ� ���� �ÿ� ���� ���� ���� ���� ��ġ
    SELECT *
FROM client C, bookSale SB
    FULL OUTER JOIN bookSale BS ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo;
    
    
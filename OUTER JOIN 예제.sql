-- 왼쪽 (LEFT) 기준
SELECT *
FROM client C
    LEFT OUTER JOIN bookSale BS ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo;
    
SELECT*FROM CLIENT

-- 오른쪽(RIGHT) 기준
SELECT *
FROM client C
    RIGHT OUTER JOIN bookSale BS ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo;
    
    
-- FULL OUTER JOIN
SELECT *
FROM client C
    FULL OUTER JOIN bookSale BS ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo;
    
    
    -- 오라클의 OUTER 조인
    --(+) 연산자로 조인 시에 값이 없는 조인 측에 위치
    SELECT *
FROM client C, bookSale SB
    FULL OUTER JOIN bookSale BS ON C.clientNo = BS.clientNo
    ORDER BY C.clientNo;
    
    
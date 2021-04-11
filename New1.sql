CREATE TABLE member (
    id VARCHAR2(10) NOT NULL PRIMARY KEY,
    pwd VARCHAR2(10),
    name VARCHAR2(50),
    email VARCHAR2(50),
    joinDate DATE DEFAULT SYSDATE
);

INSERT INTO member VALUES('hkd', '1234', 'ȫ�浿', 'hkd@naver.com', SYSDATE);
INSERT INTO member(id, pwd, name, email) VALUES('lee', '1234', '�̸���', 'lee@naver.com');
INSERT INTO member(id, pwd, name, email) VALUES('sch', '1234', '������', 'sch@abc.com');
COMMIT;

SELECT * FROM member;
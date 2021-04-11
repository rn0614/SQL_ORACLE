CREATE TABLE Student(
    No int PRIMARY KEY NOT NULL,
    name char(10),
    det char(20),
    addr char(80),
    tel char(20)
);

INSERT INTO Student VALUES(1,'홍길동','국문학과','서울','010-1111-1111');
INSERT INTO Student VALUES(2,'고길동','수학과','인천','010-2222-2222');
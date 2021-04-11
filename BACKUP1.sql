-- 도구 /데이터베이스 익스포트
-- 접속지정
-- 저장할 파일명 지정 익스포트.sql
-- 백업할 테이블 선택

--데이터 손실 가정
-- back 계정의 테이블 모두 삭제

-- 복구
-- 익스포트 1.sql로 부터 테이블 복구
-- 백업한 사용자 계정이 존재해야함(동일 계정이 생성되어 있어야함.)
-- table space 가 있어야함.

-- 익스포트 1. sql 파일 열고 스크립트 실행
--테이블 복구 확인

--오라클 설치하면 dba 롤이 부여된 sys, sytem 계정 생성
--sys 계정
--oracle db 관리자로 super user
--oracle 시스템을 유지, 관리 생성하기 위한 모든 권한 갖는 계정
-- db 생성/삭제 가능
-- sysdba 권한을 갖음

--system 계정
--생성된 db를 운영, 관리하기 위한 관리자 계정
--sys와 유사한 권한을 가지고 있지만 db 생성과 삭제는 불가
--sysoper 권한(운영)

--명령 프롬프트 창에서 sql command line 실행
-- 명령어 : sqlplus system/1234
-- sqlplus 계정명/ 비밀번호;
-- SYS 계정으로 로그인 sqlplus / as sysdba
-- show user
--exit

-- 연결 변경 : SQL > conn newuser/1234
-- 테이블 조회 : select tablename from tabs;
-- select*from tab;
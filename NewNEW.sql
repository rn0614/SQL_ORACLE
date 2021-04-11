
--사용자에게 부여된 롤 조회
SELECT*FROM USER_ROLE_PRIVS;

SELECT grantee, granted_role FROM DBA_ROLE_PRIVS;
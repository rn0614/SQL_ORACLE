
--���� ���
--���� ����
    --����� ���� ���� / ��ȸ/ ����
    -- ���� ���/ �������
-- ���� ���� : ���� �� �� �ο�/ ����
-- ��� �� ����
-- SQL PLUS ����
    -- ����
    -- ���̺� ��ȸ
    -- ���/ ����
    -- �� ��Ʈ ����
    
    --����� ���� ����
    CREATE USER newUser IDENTIFIED BY "1234"
        DEFAULT TABLESPACE USERS
        TEMPORARY TABLESPACE TEMP;
    
    -- ����ڿ��� �� �ο�
    -- CONNETC,RESOURCE 2����
    GRANT connect, resource TO newUser;
    
    -- ����� ���� ������ ���̺����̽� �Ҵ緮 ����
    ALTER USER newUser QUOTA unlimited ON USERS;
    
    --�Ҵ緮 50M ����
    ALTER USER newUser QUOTA 50M ON USERS;
    
    --����� ���� ������ �� ���̺� �����̽� �Ҵ緮 ����
    CREATE USER newUser2 IDENTIFIED BY 1234
        DEFAULT TABLESPACE USERS
        TEMPORARY TABLESPACE TEMP
        QUOTA 10M ON USERS;
        
    --NEWUSER2 ���� CONNECT,RESOURCE 2���� �� �ο�
    GRANT connect, resource To newUser2;
        
        
    -- ����� ���� ���� ����
    --��й�ȣ 1111 ����
     ALTER USER newUser QUOTA 50M ON USERS;
     
     
     -- ����� ���� ��ȸ
     SHOW USER;
     
     -- ���� �����Ǿ� �ִ� ���� ��ȸ
     SELECT*FROM DBA_USERS;
     -- DBA ���Ѻ��� ���� ��� ����� �������� ��� ��ȸ
     SELECT*FROM ALL_USERS;
     
     --���� ����� �������� ��ȸ (���� ����ڸ� ��ȸ)
      SELECT*FROM USER_USERS;
      
      -- DBA �������� DB ��ü�� ��� ��ü�� ���� ���� ��ȸ
      SELECT*FROM DBA_TABLES;
      
      -- ���� ����� �ڽ��� ������ ��ü�� �ٸ� ����ڰ� ���� ��ü��
      -- �ڽſ��� �ο��� �������� �� �� �ִ� ���� ��ȸ
      SELECT*FROM ALL_TABLES;
    
      SELECT*FROM USER_TABLES;
      
      
      -- ����� ���� ����
      DROP USER newUser;
      DROP USER newUser2; -- ���� �����ϰ� �ִ� ����� ������ ���� �Ұ�

    DROP USER newUser2 CASCADE; --�������Ǳ��� ����(�������̸� �Ұ�)
    
    
    -- ����� ���� ���
    -- HR ���� ���
    ALTER USER HR ACCOUNT LOCK; -- ��׸� ����
    
    -- HR ���� ��� ����
    ALTER USER HR ACCOUNT UNLOCK;
    
    -- NEWUSER�� �����ؼ� �ٸ� ����� �������� HR ������ ���̺��� ��������
-- ��ȸ ������ ���� ���� �Ұ�

-- ��ü ���� �ο�
-- NEWUSER���� HR ������ employees ���̺��� ��ȸ�� �� �մ� ���� �ο�
-- GRANT �������� ON ��Ű��.���̺� TO �����
    GRANT SELECT ON HR.employees TO newUser; 
    -- select ���Ѹ� �༭ ���̺� ������ �Ұ�(������ update����)

-- update ������ �ο��ؾ߸� ������ ���� ����

-- newUser ���� HR ������ empolyees ���̺��� ������ �� �ִ� ���� �ο�
    GRANT UPDATE ON HR.employees TO newUser;

-- SELECT ���� ����
    REVOKE SELECT ON HR.employees FROM newUser;
    
--emplyees ���̺��� (���� ���� �� ���̸�)���̱�� ������ �����ʹ� ��ȸ �Ұ�

-- newUser�κ��� connect,resource �� ����
REVOKE connect, resource FROM newUser;

-- newUser���� connect, resource, dba �� �ο�
GRANT connect, resource, dba TO newUser;

--��� ����ڿ��� �ο��� �� ��ȸ :������ �������� ��ȸ
SELECT grantee, granted_role FROM DBA_ROLE_PRIVS;

SELECT*FROM DBA_SYS_PRIVS WHERE GRANTEE ='CONNECT';
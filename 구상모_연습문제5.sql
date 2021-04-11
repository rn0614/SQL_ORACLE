--1. �� �μ��� ��� �������� ���� ���Ϻμ� �ٹ�������� LAST_NAME, ����, �μ���ȣ �� �ش� �μ��� ��� ���� ��ȸ.����� �μ��� ������ �������� ����
SELECT E.LAST_NAME, E.SALARY, D.DEPARTMENT_ID,AVG(SALARY);


--2. ���� �̸��� T �� �����ϴ� ������ ��� ������� ���, LAST_NAME �� �μ� ��ȣ�� ��ȸ
--3. ���� ID �� SA_MAN �� ������� �ִ� ���� ���� ���� �޴� ������� LAST_NAME, JOB_ID �� ������ ��ȸ
--4. Ŀ�̼��� ���� ������� �μ��� ������ ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ
--5. ������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID ��ȸ
--6. ��ġ�� �μ��� �ִ� ���� ID �� ���� �̸��� ��ȸ
--7. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ
--8. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME ��ȸ
--9. ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME ��ȸ
--10. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥ ��ȸ. ��������� Zlotkey�� ����
--11. �μ� ��, ��ġ ID, �� �μ� �� ��� �� ��, �� �μ� �� ��� ���� ��ȸ. ��� ������ �Ҽ��� 2 �ڸ������� ǥ��
SELECT DEPARTMENT_NAME , LOCATION_ID , COUNT()

--12. �Ŵ����� ��� �� �� �Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ���� ��ȸ. �Ŵ����� ���� ������� ����. �ּ� ������ 6000 �̸��� ��� ����. ���� ���� �������� ��ȸ.
SELECT MANAGER_ID ,MIN(SALARY)
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
HAVING MIN(SALARY)>6000
ORDER BY MIN(SALARY);

--13. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ
SELECT MAX(SALARY)- MIN(SALARY) AS "������ ����"
FROM EMPLOYEES;

--14. �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ���� ��ȸ.
SELECT JOB_ID, MAX(E.SALARY), MIN(E.SALARY), SUM(E.SALARY),AVG(E.SALARY)
FROM EMPLOYEES E
GROUP BY E.JOB_ID;

--15. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ���� ��ȸ.
SELECT MAX(E.SALARY), MIN(E.SALARY), SUM(E.SALARY),AVG(E.SALARY)
FROM EMPLOYEES E;


--16. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� LAST_NAME �� HIRE_DATE ��ȸ
SELECT E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E
WHERE E.HIRE_DATE>=(SELECT E.HIRE_DATE
                              FROM EMPLOYEES E
                              WHERE E.LAST_NAME = 'DAVIES');


--17. �þ�Ʋ�� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���ø� ��ȸ
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE L.LOCATION_ID =(SELECT LOCATION_ID
                                FROM LOCATIONS
                                WHERE CITY='Seattle')

--18. �Ŵ����� �ִ� ������� LAST_NAME �� JOB_ID ��ȸ
SELECT LAST_NAME, JOB_ID,MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;


--19. 1994�⵵�� ���� ��� ������� LAST_NAME �� ����� ��ȸ
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '1994%';


--20. 20 �� �� 50 �� �μ��� �ٹ��ϸ�, ������ 5000 ~ 12,000 ������ ������� LAST_NAME �� ���� ��ȸ
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20,50) AND SALARY BETWEEN 5000 AND 12000;

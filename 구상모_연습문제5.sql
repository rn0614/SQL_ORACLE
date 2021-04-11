--1. 각 부서별 평균 연봉보다 높은 동일부서 근무사원들의 LAST_NAME, 연봉, 부서번호 및 해당 부서의 평균 연봉 조회.결과는 부서별 연봉을 기준으로 정렬
SELECT E.LAST_NAME, E.SALARY, D.DEPARTMENT_ID,AVG(SALARY);


--2. 도시 이름이 T 로 시작하는 지역에 사는 사원들의 사번, LAST_NAME 및 부서 번호를 조회
--3. 직업 ID 가 SA_MAN 인 사원들의 최대 연봉 보다 높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회
--4. 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회
--5. 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 조회
--6. 위치한 부서가 있는 국가 ID 및 국가 이름을 조회
--7. 위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회
--8. LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 조회
--9. 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 조회
--10. LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜 조회. 결과값에서 Zlotkey는 제외
--11. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉 조회. 평균 연봉은 소수점 2 자리까지만 표현
SELECT DEPARTMENT_NAME , LOCATION_ID , COUNT()

--12. 매니저의 사번 및 그 매니저 밑 사원들 중 최소 연봉을 받는 사원의 연봉 조회. 매니저가 없는 사람들은 제외. 최소 연봉이 6000 미만인 경우 제외. 연봉 기준 역순으로 조회.
SELECT MANAGER_ID ,MIN(SALARY)
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
HAVING MIN(SALARY)>6000
ORDER BY MIN(SALARY);

--13. 사내의 최대 연봉 및 최소 연봉의 차이를 조회
SELECT MAX(SALARY)- MIN(SALARY) AS "연봉의 차이"
FROM EMPLOYEES;

--14. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉 조회.
SELECT JOB_ID, MAX(E.SALARY), MIN(E.SALARY), SUM(E.SALARY),AVG(E.SALARY)
FROM EMPLOYEES E
GROUP BY E.JOB_ID;

--15. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉 조회.
SELECT MAX(E.SALARY), MIN(E.SALARY), SUM(E.SALARY),AVG(E.SALARY)
FROM EMPLOYEES E;


--16. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 조회
SELECT E.LAST_NAME, E.HIRE_DATE
FROM EMPLOYEES E
WHERE E.HIRE_DATE>=(SELECT E.HIRE_DATE
                              FROM EMPLOYEES E
                              WHERE E.LAST_NAME = 'DAVIES');


--17. 시애틀에 사는 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시명 조회
SELECT E.LAST_NAME, D.DEPARTMENT_NAME, L.LOCATION_ID, L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE L.LOCATION_ID =(SELECT LOCATION_ID
                                FROM LOCATIONS
                                WHERE CITY='Seattle')

--18. 매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 조회
SELECT LAST_NAME, JOB_ID,MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;


--19. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일 조회
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '1994%';


--20. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉 조회
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20,50) AND SALARY BETWEEN 5000 AND 12000;

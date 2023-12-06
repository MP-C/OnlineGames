/* HackerRank SQL Intermediate Results */
/*********************************************************************
43)  Advanced SelectNew Companies
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers,
total number of senior managers, total number of managers, and total number of employees.
Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
*/

SELECT C.COMPANY_CODE, C.FOUNDER, COUNT(DISTINCT C1.LEAD_MANAGER_CODE), COUNT(DISTINCT C2.SENIOR_MANAGER_CODE), COUNT(DISTINCT C3.MANAGER_CODE), COUNT(DISTINCT C4.EMPLOYEE_CODE) FROM COMPANY AS C
    JOIN LEAD_MANAGER AS C1 ON C.COMPANY_CODE=C1.COMPANY_CODE
    JOIN SENIOR_MANAGER AS C2 ON C.COMPANY_CODE=C2.COMPANY_CODE
    JOIN MANAGER AS C3 ON C.COMPANY_CODE=C3.COMPANY_CODE
    JOIN EMPLOYEE AS C4 ON C.COMPANY_CODE=C4.COMPANY_CODE
    GROUP BY C.COMPANY_CODE, C.FOUNDER
    ORDER BY COMPANY_CODE;
/*
OUTPUT
C1 Angela 1 2 5 13 
C10 Earl 1 1 2 3 
C100 Aaron 1 2 4 10 
C11 Robert 1 1 1 1 
C12 Amy 1 2 6 14 
C13 Pamela 1 2 5 14 
C14 Maria 1 1 3 5 
C15 Joe 1 1 2 3 
C16 Linda 1 1 3 5 
....
C94 Joyce 1 2 5 13 
C95 Patricia 1 1 3 5 
C96 Gregory 1 1 2 2 
C97 Brian 1 1 1 1
*/

/*Not Working*/
SELECT C.COMPANY_CODE, C.FOUNDER, COUNT(C1.LEAD_MANAGER_CODE), COUNT(C2.SENIOR_MANAGER_CODE), COUNT(C3.MANAGER_CODE), COUNT(C4.EMPLOYEE_CODE) FROM COMPANY AS C
    JOIN LEAD_MANAGER AS C1 ON C.COMPANY_CODE=C1.COMPANY_CODE
    JOIN SENIOR_MANAGER AS C2 ON C.COMPANY_CODE=C2.COMPANY_CODE
    JOIN MANAGER AS C3 ON C.COMPANY_CODE=C3.COMPANY_CODE
    JOIN EMPLOYEE AS C4 ON C.COMPANY_CODE=C4.COMPANY_CODE
    GROUP BY C.COMPANY_CODE, C.FOUNDER
    ORDER BY COMPANY_CODE;

=> Result:
C1 Angela 6890 6890 6890 6890 
C10 Earl 78 78 78 78 
C100 Aaron 2000 2000 2000 2000 
C11 Robert 3 3 3 3 
C12 Amy 7392 7392 7392 7392 
C13 Pamela 8400 8400 8400 8400 
C14 Maria 225 225 225 225 
C15 Joe 48 48 48 48 
C16 Linda 225 225 225 225 
C17 Melissa 1260 1260 1260 1260 
C18 Carol 1260 1260 1260 1260 
C19 Paula 1288 1288 1288 1288 
C2 Frank 45 45 45 45 

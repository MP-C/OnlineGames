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



/*********************************************************************
44)  Alternative QueriesPrint Prime Numbers
Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).
For example, the output for all prime numbers =< 10 would be:
*/
WITH RECURSIVE prime(n) AS
    (SELECT 2 
        UNION ALL
        SELECT n+1 FROM prime WHERE n<1000)
        SELECT GROUP_CONCAT(prime.n SEPARATOR '&') FROM prime WHERE NOT EXISTS 
            (SELECT n FROM prime AS c  WHERE c.n > 1 AND c.n < prime.n AND prime.n % c.n = 0);

/* OUTPUT */
2&3&5&7&11&13&17&19&23&29&31&37&41&43&47&53&59&61&67&71&73&79&83&89&97&
101&103&107&109&113&127&131&137&139&149&151&157&163&167&173&179&181&191&193&197&199&
211&223&227&229&233&239&241&251&257&263&269&271&277&281&283&293&
307&311&313&317&331&337&347&349&353&359&367&373&379&383&389&397&
401&409&419&421&431&433&439&443&449&457&461&463&467&479&487&491&499&
503&509&521&523&541&547&557&563&569&571&577&587&593&599&
601&607&613&617&619&631&641&643&647&653&659&661&673&677&683&691&
701&709&719&727&733&739&743&751&757&761&769&773&787&797&
809&811&821&823&827&829&839&853&857&859&863&877&881&883&887&
907&911&919&929&937&941&947&953&967&971&977&983&991&997

/*Not Working*/
SELECT x 
    FROM 
        (SELECT LEVEL x FROM dual CONNECT BY LEVEL <= 10),
        (SELECT LEVEL Y FROM dual CONNECT BY LEVEL <= 10),
    GROUP BY x
    HAVING count(CASE x/y WHEN trunc(x/y) THEN 1 END) = 2
    ORDER BY x;


WITH RECURSIVE cte AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM cte WHERE n < 10
)
SELECT n FROM cte;

    
WITH RECURSIVE(odd_numbers(n)) AS (
    SELECT 3
    UNION ALL
    SELECT n+2 FROM odd_numbers(3) WHERE n<1000)
SELECT 
    CONCAT('2&', GROUP_CONCAT(n SEPARATOR '&'))
FROM odd_numbers AS list1
WHERE NOT EXISTS (SELECT *
    FROM odd_numbers AS list2
    WHERE list2.n < list1.n AND list1.n % list2.n = 0
);


/*********************************************************************
45) Alternative QueriesDraw The Triangle 1
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
Write a query to print the pattern P(20) */

WITH RECURSIVE triangle(n) AS (select 40 UNION ALL SELECT n - 2 FROM triangle WHERE n - 2 >= 2) SELECT lpad(' ', triangle.n, '* ') From triangle;

/* OUTPUT */
* * * * * 
* * * * 
* * * 
* * 
*

/*Not Working*/
WITH RECURSIVE triangle(start(x), end(x)) AS SELECT triangle(start - 1, end), '*') WHERE start <= fim;
WITH RECURSIVE triangle(start(x), end=1) AS SELECT Concat(triangle(start(20-end), end), '*') WHERE start <= fim;

WITH RECURSIVE triangle(n) as (select 20 union all select n - 1 from triangle where n - 1 >= 2) select Concat(' ', triangle.n, '* ') from triangle;


/*********************************************************************
46) Alternative QueriesDraw The Triangle 2
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5): */
WITH RECURSIVE triangle(n) AS (select 1 UNION ALL SELECT n +2 FROM triangle WHERE n + 2 >= n AND n+2 < 40) SELECT lpad('', triangle.n, '* ') From triangle;

/* OUTPUT */
*
* *
* * *
* * * *
* * * * *
* * * * * *
* * * * * * *
* * * * * * * *
* * * * * * * * *
* * * * * * * * * *
* * * * * * * * * * *
* * * * * * * * * * * *
* * * * * * * * * * * * *
* * * * * * * * * * * * * *
* * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * * *
* * * * * * * * * * * * * * * * * * * *

/*Not Working*/
WITH RECURSIVE triangle(n) AS (select 40 UNION ALL SELECT n - 2 FROM triangle WHERE n - 2 >= 2) SELECT lpad(' ', triangle.n, '* ') From triangle ASC;
WITH RECURSIVE triangle(n) AS (select 1 UNION ALL SELECT n +1 FROM triangle WHERE n + 1 >= n AND n+1 < 21) SELECT lpad(' ', triangle.n, '* ') From triangle;
WITH RECURSIVE triangle(n) AS (select 1 UNION ALL SELECT n +2 FROM triangle WHERE n + 2 >= n AND n+2 < 40) SELECT lpad(' ', triangle.n, '* ') From triangle;
WITH RECURSIVE triangle(n) AS (select 2 UNION ALL SELECT n +2 FROM triangle WHERE n + 2 >= n AND n+2 < 44) SELECT lpad(' ', triangle.n, '* ') From triangle;



/*********************************************************************
47) Basic JoinContest Leaderboard
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.

Input Format

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.*/
SELECT hacker_id, name, SUM(total_score) AS total
    FROM (SELECT s.hacker_id, name, challenge_id, MAX(score) AS total_score
        FROM Hackers h JOIN Submissions s ON h.hacker_id = s.hacker_id
        WHERE score<>0 GROUP BY s.hacker_id, challenge_id, name
        ) AS subq
    GROUP BY hacker_id, name
    ORDER BY total DESC, hacker_id;

/* OUTPUT */


/*Not Working*/

SELECT Hackers.hacker_id, submissions.score FROM Hackers, Submissions WHERE Hackers.hacker_id = submissions.hacker_id;

SELECT Submissions.hacker_id, Submissions.score FROM Submissions ORDER BY Submissions.hacker_id;

SELECT DISTINCT hackers.hacker_id, hackers.hacker_id.name, 
    SUM(SELECT submissions.score FROM Submissions WHERE submissions.hacker_id GROUP BY hacker_id) 
    FROM hackers, submissions 
    WHERE hackers.hacker_id = submissions.hacker_id ORDER BY submissions.score DES GROUP BY hackers.hacker_id ASC;

SELECT h.hacker_id, h.name, MAX(s.score) AS total_score FROM Hackers h
    JOIN Submissions s ON h.hacker_id = s.hacker_id
    GROUP BY h.hacker_id, h.name
    HAVING MAX(s.score) > 0
    ORDER BY total_score DESC, h.hacker_id ASC;

SELECT DISTINCT h.hacker_id, h.name, MAX(s.score) AS total_score FROM Hackers h
    JOIN Submissions s ON h.hacker_id = s.hacker_id
    GROUP BY h.hacker_id, h.name
    HAVING MAX(s.score) > 0
    ORDER BY total_score DESC, h.hacker_id ASC;
    

SELECT DISTINCT h.hacker_id, h.name, SUM(total_score) AS total_score FROM 
    (SELECT s.hacker_id, challenge_id, MAX(score) AS table_score FROM Hackers h JOIN Submissions s ON h.hacker_id = s.hacker_id
    WHERE score <> 0 GROUP BY s.hacker_id, s.challenge_id)
    GROUP BY h.hacker_id ASC,
    ORDER BY total_score DESC; 

SELECT DISTINCT h.hacker_id, h.name, SUM(total_score) AS total_score FROM (SELECT s.hacker_id, challenge_id, MAX(score) AS table_score FROM Hackers h JOIN Submissions s ON h.hacker_id = s.hacker_id
    WHERE score <> 0 GROUP BY s.hacker_id, s.challenge_id)
    GROUP BY h.hacker_id ASC,
    ORDER BY total_score DESC, hacker_id;

SELECT h.hacker_id, h.name, SUM(total_score) AS total_score
FROM (SELECT s.hacker_id, challenge_id, MAX(score) AS table_score FROM Hackers h JOIN Submissions s ON h.hacker_id = s.hacker_id
    WHERE score>0 GROUP BY s.hacker_id, s.challenge_id)
    GROUP BY h.hacker_id
    ORDER BY total_score DESC, hacker_id;

SELECT h.hacker_id, h.name, SUM(total_score) AS total_score FROM (SELECT s.hacker_id, challenge_id, MAX(score) AS table_score
    FROM Hackers h JOIN Submissions s ON h.hacker_id = s.hacker_id
    WHERE score>0 GROUP BY s.hacker_id, s.challenge_id)
    GROUP BY h.hacker_id
    ORDER BY total_score DESC, h.hacker_id;

SELECT h.hacker_id, h.name, SUM(total_score) AS total_score FROM (SELECT s.hacker_id, name, challenge_id, MAX(score) AS table_score
    FROM Hackers h JOIN Submissions s ON h.hacker_id = s.hacker_id
    WHERE score>0 GROUP BY s.hacker_id, s.challenge_id, name)
    GROUP BY h.hacker_id, name
    ORDER BY total_score DESC, h.hacker_id;

SELECT hacker_id, name, SUM(total_score) AS total_score
    FROM (SELECT s.hacker_id, name, challenge_id, MAX(score) AS total_score
        FROM Hackers h JOIN Submissions s ON h.hacker_id = s.hacker_id
        WHERE score > 0 GROUP BY s.hacker_id, challenge_id, name
        )
    GROUP BY hacker_id, name
    ORDER BY total_score DESC, hacker_id;
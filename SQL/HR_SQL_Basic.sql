/* HackerRank SQL Basic Results */
/* 1) RevisingTheSelectQueryI
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
The CITY table is described as follows */

Select * from CITY WHERE COUNTRYCODE ='USA' AND POPULATION > 100000;

/* OUTPUT
3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549  */


/*********************************************************************
2) RevisingTheSelectQueryII
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA
The CITY table is described as follows */
Select NAME from CITY WHERE COUNTRYCODE ='USA' AND POPULATION > 120000;
/* OUTPUT
Scottsdale
Corona
Concord
Cedar Rapids */


/*********************************************************************
3) Select All
Query all columns (attributes) for every row in the CITY table */
Select * from CITY;
/* OUTPUT
6 Rotterdam NLD Zuid-Holland 593321 
3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549 
4054 Fairfield USA California 92256 
4058 Boulder USA Colorado 91238 
4061 Fall River USA Massachusetts 90555 */


/*********************************************************************
4) Query all columns for a city in CITY with the ID 1661. */
Select * from CITY WHERE ID ='1661';
/* OUTPUT
1661 Sayama JPN Saitama 162472*/

/*********************************************************************
5) Select by Id
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. */
Select * from CITY WHERE COUNTRYCODE='JPN';
/* OUTPUT
1613 Neyagawa JPN Osaka 257315
1630 Ageo JPN Saitama 209442
1661 Sayama JPN Saitama 162472
1681 Omuta JPN Fukuoka 142889
1739 Tokuyama JPN Yamaguchi 107078 */


/*********************************************************************
6) Japanese Cities Attributes
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.*/
Select name from CITY WHERE COUNTRYCODE='JPN';
/* OUTPUT
Neyagawa
Ageo
Sayama
Omuta
Tokuyama
*/


/*********************************************************************
7) Weather Observation Station 1
Japanese Cities Names Query a list of CITY and STATE from the STATION table. */
Select CITY, STATE from STATION;
/* OUTPUT
Kissee Mills MO
Loma Mar CA
Sandy Hook CT
Tipton IN
Arlington CO
Turner AR
....
Mid Florida FL
Acme LA
Gorham KS
*/



/*********************************************************************
8) Weather Observation Station 3
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer*/
SELECT DISTINCT CITY FROM STATION WHERE MOD(ID,2)=0;
/* OUTPUT
Kissee Mills
Loma Mar
Tipton
Glencoe
Chignik Lagoon
Albany
...
Mid Florida
Gorham
Bass Harbor
*/



/*********************************************************************
9) Weather Observation Station 4 Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.*/
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) FROM STATION;
/* OUTPUT
13
*/



/*********************************************************************
10) Weather Observation Station 5 
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.*/
SELECT CITY, length(CITY) FROM STATION ORDER BY length(CITY) DESC, CITY ASC fetch first row only;
SELECT CITY, length(CITY) FROM STATION ORDER BY length(CITY) ASC, CITY ASC fetch first row only;
/* OUTPUT
Amo 3
Marine On Saint Croix 21
*/



/*********************************************************************
11) Weather Observation Station 6
Query the list of CITY names starting with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%';
/* OUTPUT

*/


/*********************************************************************
12) Weather Observation Station 7 
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';

/* OUTPUT
Acme 
Aguanga 
Alba 
Aliso Viejo 
Alpine 
Amazonia 
....
Yellville 
Yuma 
Zionsville 
*/


/*********************************************************************
13) Weather Observation Station 8 
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u') ;

/* OUTPUT
Acme 
Aguanga 
Alba 
Aliso Viejo 
Alpine 
Eriline 
Ermine 
Eskridge {-truncated-}
*/


/*********************************************************************
14) Weather Observation Station 9 
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE (CITY NOT IN (SELECT CITY FROM STATION WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%'));

/* OUTPUT
Baileyville 
Bainbridge 
Baker
...
Blue River {-truncated-}
*/



/*********************************************************************
15) Weather Observation Station 10 
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY FROM STATION WHERE (CITY NOT IN (SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u'));
/* OUTPUT
Addison 
Agency 
Alanson 
Albany 
Albion 
...
Winter Park 
Woodbury 
Woodstock Valley 
Yazoo City 
*/


/*********************************************************************
16) Weather Observation Station 11
	Submissions	Leaderboard	Discussions
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY FROM STATION WHERE (CITY NOT IN (SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u')) OR (CITY NOT IN (SELECT CITY FROM STATION WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%'));

/* OUTPUT
Addison 
Agency 
Alanson 
Albany 
Albion
...
Bainbridge 
Baker 
Baldwin 
Barrigada 
Bass Harbor
*/

/*********************************************************************
17) Weather Observation Station 12 
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
*/
SELECT DISTINCT CITY FROM STATION WHERE (CITY NOT IN (SELECT CITY FROM STATION WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%')) AND (CITY NOT IN (SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u'));
/* OUTPUT
Baker 
Baldwin 
Bass Harbor 
Beaufort 
Beaver Island 
Benedict 
...
Yazoo City 
Yoder 
Zachary
*/


/*********************************************************************
18) Higher than 75 marks
Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/
SELECT NAME FROM STUDENTS WHERE MARKS > 75 ORDER BY RIGHT(Name, 3), ID;
/* OUTPUT
Stuart 
Kristeen 
Christene 
Amina
...
Belvet 
Devil 
Evil
*/

/*********************************************************************
19) Employee Names
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/
SELECT NAME FROM EMPLOYEE ORDER BY NAME ASC;
/* OUTPUT
Alan 
Amy 
Andrew 
Andrew 
Angela
...
Todd 
Victor 
Walter 
Willie
*/

/*********************************************************************
20) Employee SALARIES 
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
*/
SELECT NAME FROM EMLPOYEE WHERE SALARY > 2000 AND MONTHS < 10 ORDER BY EMPLOYEE_ID ASC;
/* OUTPUT
Rose 
Patrick 
Lisa 
Amy 
Pamela
...
Louise 
Evelyn 
Emily 
Jonathan {-truncated-}
*/

/*********************************************************************
21) Weather Observation Station 14
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to  decimal places.
*/
SELECT SUBSTR(ROUND(MAX(LAT_N), 4), 1, 8) FROM STATION WHERE LAT_N < 137.2345;

/* OUTPUT
137.0193 
*/

/* NOT WORKING */
SELECT ROUND(LAT_N, 0) FROM STATION WHERE LAT_N < 137.2345;
SELECT ROUND(MAX(LAT_N), 4) FROM STATION WHERE LAT_N < 137.2345;
SELECT RIGHT(MAX(LAT_N), 4) AS LAT_N FROM STATION WHERE LAT_N < 137.23450000;
SELECT MAX(LAT_N) AS greatest_lat_n FROM STATION WHERE LAT_N < 137.2345 CAST(FORMAT(greatest_lat_n, '0.0000') AS DECIMAL(10,4));

/*********************************************************************
22) Weather Observation Station 15
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to  decimal places.
*/
SELECT SUBSTR(ROUND(MAX(LONG_W), 4), 1, 8) FROM STATION WHERE LAT_N  = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

/* OUTPUT */
137.0193

/* NOT WORKING but need to understand*/
SELECT SUBSTRING(ROUND((LONG_W), 4),1,8) FROM STATION WHERE LAT_N  =
    (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);                    => ambigous
SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345;                          => 137.01930790
SELECT MAX(LAT_N), FROM STATION WHERE LAT_N < 137.2345;                         => 164.87604770
SELECT SUBSTR(ROUND(MAX(LONG_W), 4), 1, 8) FROM STATION WHERE LAT_N < 137.2345; => 164.8760


/*********************************************************************
23) Weather Observation Station 16
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to  decimal places.  */
SELECT SUBSTR(ROUND(MIN(LAT_N),4),1,7) FROM STATION WHERE LAT_N > 38.7780;

/* OUTPUT */
38.8526

/*Not Working*/
SELECT ROUND(MIN(LAT_N),4) FROM STATION WHERE LAT_N > 38.7780; => 38.85260000 


/*********************************************************************
24)  Weather Observation Station 17
Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.*/
SELECT SUBSTR(ROUND(LONG_W,4), 1, 7) FROM STATION WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780);

/* OUTPUT */
70.1378

/*Not Working*/
SELECT SUBSTR(LONG_W, 1, 7) FROM STATION WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780); => 70.1378 (but no ROUND() ex: Round(70.13786354) = 70.13780000)
SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N < 38.7780); => 154.06430000
SELECT SUBSTR(ROUND(LONG_W,4), 1, 8) FROM STATION WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N < 38.7780); => 154.0643


/*********************************************************************
25) Weather Observation Station 18 
Consider P1(a, b) and P2(c, d) to be two points on a 2D plane.

- a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
- b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
- c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
- d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

EXTRA: The distance between two points measured along axes at right angles. In a plane with p1 at (x1, y1) and p2 at (x2, y2), it is |x1 - x2| + |y1 - y2|.

Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.
*/
SELECT SUBSTR(ROUND(ABS((MIN(LAT_N) - MAX(LAT_N)) + (MIN(LONG_W) - MAX(LONG_W))), 4),1,8) FROM STATION;
/* OUTPUT */
259.6859

/*Not Working*/
SELECT LAT_N, LONG_W FROM STATION WHERE CITY = 'Manhattan';                                     => not existe
SELECT LAT_N, LONG_W FROM STATION WHERE CITY = 'Arlington';                                     => 75.17993079 92.94615894
SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N) + MIN(LONG_W) - MAX(LONG_W)), 4) FROM STATION;         => 259.68590000 
SELECT ROUND(ABS((MIN(LAT_N) - MAX(LAT_N))) + ABS((MIN(LONG_W) - MAX(LONG_W))), 4) FROM STATION;=> 259.68590000 



/*********************************************************************
26) Weather Observation Station 19
Consider  P1(a, b) and P2(c, d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

EXTRA: Deriving the Euclidean distance between two data points involves computing the square root of the sum of the squares of the differences between corresponding values.
d = √((x2-x1)2 + (y2-y1)2)
*/
SELECT ROUND((SQRT(POWER((MAX(LAT_N) - MIN(LAT_N)),2) + POWER((MAX(LONG_W) - MIN(LONG_W)),2))),4) FROM STATION;  
/* OUTPUT */
184.1616

/* Others possibilities */
SELECT SUBSTR(ABS(ROUND(SQRT((POWER((MAX(LAT_N) - MIN(LAT_N)),2)) + (POWER((MAX(LONG_W) - MIN(LONG_W)),2))),4)), 1,8) FROM STATION; => 1.841616
SELECT SUBSTR(ROUND(SQRT(POWER((MAX(LAT_N) - MIN(LAT_N)),2) + POWER((MAX(LONG_W) - MIN(LONG_W)),2)),6), 1,8)*100 FROM STATION;=> 184.161600 
SELECT SUBSTR(ROUND(SQRT(POWER((MAX(LAT_N) - MIN(LAT_N)),2) +POWER((MAX(LONG_W) - MIN(LONG_W)),2)),6),1,6)*100 FROM STATION;  => 184.1600 
SELECT ROUND((SQRT(POWER((MAX(LAT_N) - MIN(LAT_N)),2) + POWER((MAX(LONG_W) - MIN(LONG_W)),2))),4) FROM STATION;               => +1.84161600000000E+002 
SELECT ROUND(SQRT(POWER((MAX(LAT_N) - MIN(LAT_N)),2) + (POWER(MAX(LONG_W) - MIN(LONG_W),2))), 4) FROM STATION;                => +1.84161600000000E+002 
SELECT ROUND(SQRT(POWER((MIN(LAT_N) - MIN(LONG_W)),2) + (POWER(MAX(LAT_N) - MAX(LONG_W),2))), 4) FROM STATION;                => +1.98870000000000E+001 
/*Not Working*/
SELECT SUBSTR(ROUND(CBRT(POW((MIN(LAT_N) - MIN(LONG_W)),2) + POW(MAX(LAT_N) - MAX(LONG_W), 2)), 4), 1, 8) FROM STATION;       => error, should be SQRT
select max(LAT_N), min(LAT_N), max(LONG_W), min(LONG_W) FROM STATION;                                                         => 144.98906270 25.07352606 164.87604770 25.10565434 

/*********************************************************************
27) Weather Observation Station 20 
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places. */
SELECT SUBSTR(ROUND(S.LAT_N, 4),1,7) FROM STATION as S WHERE (SELECT count(LAT_N) FROM STATION WHERE LAT_N < S.LAT_N) = (SELECT count(LAT_N) FROM STATION WHERE LAT_N > S.LAT_N); 
/* OUTPUT */
83.8913
/*Not Working*/
SELECT SUBSTR(ROUND(AVG(LAT_N), 4),1,7) FROM STATION; => 85.8718


/*********************************************************************
28) Revising Aggregations - The Count Function 
Query a count of the number of cities in CITY having a Population larger than 1000,000.*/
SELECT COUNT(*) FROM CITY WHERE POPULATION > '100000'; 
/* OUTPUT */
6

/*********************************************************************
29) Revising Aggregations - The Sum Function 
Query the total population of all cities in CITY where District is California. */
SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT='California';
/* OUTPUT */
339002

/*********************************************************************
30) Revising Aggregations - Averages
Query the average population of all cities in CITY where District is California.*/
SELECT AVG(Population) FROM CITY WHERE DISTRICT='California';
/* OUTPUT */
113000.667


/*********************************************************************
31) Average Population
Query the average population for all cities in CITY, rounded down to the nearest integer. */
SELECT FLOOR(AVG(Population)) FROM CITY;
/* OUTPUT */
454250

/*********************************************************************
32)  Japan Population
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.*/
SELECT SUM(Population) FROM CITY WHERE COUNTRYCODE = 'JPN';
/* OUTPUT */
879196

/*********************************************************************
33) Population Density Difference 
Query the difference between the maximum and minimum populations in CITY. */
SELECT MAX(POPULATION)-MIN(POPULATION) FROM CITY;
/* OUTPUT */
4695354


/*********************************************************************
34) The Blunder
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
*/
SELECT CEIL(AVG(SALARY) - AVG(REPLACE(SALARY, '0', ''))) from EMPLOYEES; /* Works but is not like what it says or shows */
/* OUTPUT */
2253

/*Not Working*/
SELECT AVG(SALARY*12) FROM EMPLOYEES;
SELECT SALARY*12 FROM EMPLOYEES WHERE ID='1';
SELECT ROUND((AVG(A.SALARY) - (M.SALARY)),4) FROM EMPLOYEES WHERE A.SALARY = (SELECT (SALARY*12) FROM EMPLOYEES) AND M.SALARY = (SELECT (replace(salary,'0','')) FROM EMPLOYEES); => ~ no response on stdout ~
SELECT CEIL(AVG(SALARY*12) - AVG(replace(SALARY, 0, ''))) FROM EMPLOYEES; => 46767


/*********************************************************************
35) Top Earners
We define an employee's total earnings to be their monthly salary X months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
 */
SELECT (SELECT MAX(MONTHS * SALARY) FROM EMPLOYEE),  COUNT(*) FROM EMPLOYEE WHERE (MONTHS * SALARY) = (SELECT MAX(MONTHS * SALARY) FROM EMPLOYEE);

/* OUTPUT */
108064 7

/*Not Working*/
SELECT MAX(SALARY * MONTHS) FROM EMPLOYEE;                                       => 108064
SELECT COUNT(NAME) FROM EMPLOYEE WHERE (SALARY * MONTHS) = MAX(SALARY * MONTHS); => error
SELECT MAX(SALARY * MONTHS),' ', COUNT(EMPLOYEE_ID) FROM EMPLOYEE WHERE (SALARY * MONTHS) = MAX(SALARY * MONTHS);
SELECT (SELECT MAX(SALARY * MONTHS) FROM EMPLOYEE), (SELECT COUNT(*) FROM EMPLOYEE WHERE (SALARY * MONTHS) = MAX(SALARY * MONTHS));
SELECT (SELECT MAX(SALARY * MONTHS) FROM EMPLOYEE),  COUNT(*) FROM EMPLOYEE WHERE (SALARY * MONTHS) = MAX(SALARY * MONTHS);
SELECT (SELECT max(SALARY * MONTHS) FROM Employee),  COUNT(*) FROM EMPLOYEE WHERE (SALARY * MONTHS); => 106
SELECT (SELECT MAX(SALARY * MONTHS) FROM EMPLOYEE),  COUNT(*) FROM EMPLOYEE WHERE (SALARY * MONTHS) = SELECT MAX(SALARY * MONTHS) FROM EMPLOYEE);


/*********************************************************************
36) Weather Observation Station 2 
Query the following two values from the STATION table:
1.The sum of all values in LAT_N rounded to a scale of  decimal 2 places.
2.The sum of all values in LONG_W rounded to a scale of  decimal 2 places.*/
SELECT SUBSTR(ROUND(SUM(LAT_N),2), 1, 8), SUBSTR(ROUND(SUM(LONG_W), 2), 1, 8) FROM STATION;
/* OUTPUT */
42850.04 47381.48
/*Not Working*/


/*********************************************************************
37) Weather Observation Station 13 
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880  and less than 137.2345.
Truncate your answer to 4 decimal places.*/
SELECT SUBSTR(ROUND(SUM(LAT_N),4), 1, 10) FROM STATION WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;
/* OUTPUT */
36354.8135 
/*Not Working*/


/*********************************************************************
38) Basic Join - Population Census 
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */
SELECT SUM(CITY.POPULATION) FROM CITY, COUNTRY WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND COUNTRY.CONTINENT= 'Asia';
/* OUTPUT */
27028484
/*Not Working*/



/*********************************************************************
39) Basic Join - African Cities 
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */

SELECT CITY.NAME FROM CITY, COUNTRY WHERE CITY.COUNTRYCODE = COUNTRY.CODE AND COUNTRY.CONTINENT= 'Africa';

/* OUTPUT */
Qina
Warraq al-Arab
Kempton Park
Alberton
Klerksdorp
Uitenhage
Brakpan
Libreville

/*Not Working*/


/*********************************************************************
39) Basic Join - Average Population of Each Continent 
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */

SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population)) FROM CITY, COUNTRY WHERE CITY.COUNTRYCODE = COUNTRY.CODE GROUP BY COUNTRY.Continent;

/* OUTPUT */
Asia 693038
Europe 175138
Oceania 109189
South America 147435
Africa 274439

/*Not Working*/
SELECT COUNTRY.Continent, CEIL(AVG(CITY.Population)) FROM CITY, COUNTRY WHERE CITY.COUNTRYCODE = COUNTRY.CODE GROUP BY COUNTRY.Continent;
Asia 693039
Europe 175139
Oceania 109190
South America 147436
Africa 274439


/*********************************************************************
40) Advanced SelectType of Triangle
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 1 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle. */
SELECT 
CASE 
WHEN A+B>C AND A+C>B AND B+C>A THEN 
 CASE 
   WHEN A=B AND B=C THEN 'Equilateral' 
   WHEN A=B OR B=C OR A=C THEN 'Isosceles' 
   ELSE 'Scalene'
 END
 ELSE 'Not A Triangle'
END FROM TRIANGLES;

/* OUTPUT */
Equilateral 
Equilateral 
Isosceles 
Equilateral 
Isosceles 
Equilateral 
Scalene 
Not A Triangle 
Scalene 
Scalene 
Scalene 
Not A Triangle

/*Not Working*/
SELECT 
CASE 
WHEN A+B>C AND A+C>B AND B+C>A THEN 
 CASE 
   WHEN A=B AND B=C THEN 'Equilateral' 
   WHEN A=B OR B=C THEN 'Isosceles' 
   ELSE 'Scalene'
 END
 ELSE 'Not A Triangle'
END FROM TRIANGLES;




/*********************************************************************
41) The PADS
Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.
*/
SELECT CONCAT(NAME, '(', UPPER(LEFT(OCCUPATION, 1)),')') FROM OCCUPATIONS ORDER BY NAME;
SELECT CONCAT('There are a total of ', COUNT(OCCUPATION),' ',LOWER(OCCUPATION),'s.') FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT(OCCUPATION) ASC, LOWER(OCCUPATION) ASC; =>was missing 's.'

/* OUTPUT
Aamina(D)
Ashley(P)
Belvet(P)
Britney(P)
Christeen(S)
Eve(A)
Jane(S)
Jennifer(A)
Jenny(S)
Julia(D)
Ketty(A)
Kristeen(S)
Maria(P)
Meera(P)
Naomi(P)
Priya(D)
Priyanka(P)
Samantha(A)
There are a total of 3 doctor.
There are a total of 4 actor.
There are a total of 4 singer.
There are a total of 7 professor.

/*Not Working*/
1) SELECT * FROM OCCUPATIONS ORDER BY NAME;
select concat(name, '(', substring(occupation, 1, 1), ')') as name from occupations order by name;      => ERROR
select concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.') as profession from occupations group by occupation order by profession;
SELECT NAME + '(' + UPPER(SUBSTR(OCCUPATION, 1)) +')' FROM OCCUPATIONS ORDER BY NAME;                   => ERROR
SELECT NAME + '(' + UPPER(LEFT(OCCUPATION, 1)) +')' FROM OCCUPATIONS ORDER BY NAME;                     => ERROR
SELECT CONCAT(NAME, '(', UPPER(LEFT(OCCUPATION, 1)),')') FROM OCCUPATIONS ORDER BY NAME;                => IT SHOULD WORK, BECAUSE GIVES THE result
SELECT CONCAT(NAME,'(',UPPER(substr(OCCUPATION, 1, 1)),')') FROM OCCUPATIONS ORDER BY NAME;             => IT SHOULD WORK, BECAUSE GIVES THE result

2) SELECT CONCAT('There are a total of ', COUNT(*),' ', OCCUPATION) FROM OCCUPATIONS GROUP BY OCCUPATION ;
SELECT CONCAT('There are a total of ', COUNT(*),' ', OCCUPATION,'.') FROM OCCUPATIONS GROUP BY OCCUPATION ;
SELECT CONCAT('There are a total of ', (COUNT(OCCUPATION) as total),' ', OCCUPATION) FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY total ASC, LOWER(OCCUPATION); => ERROR
SELECT CONCAT('There are a total of ', COUNT(OCCUPATION),' ', LOWER(OCCUPATION),'.') FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT(OCCUPATION) ASC, OCCUPATION ASC; => IT SHOULD WORK, BECAUSE GIVES THE result



/*//////////////////////SIMPLE TEST CERTIFICATION BASIC ///////////////////////////*/
/*********************************************************************
42) Advanced SelectOccupations
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation. */

/* OUTPUT */

/*Not Working*/
SELECT NAME, OCCUPATION FROM OCCUPATIONS ORDER BY NAME ASC GROUP BY OCCUPATION;

/*BASIC Certificate questions*/
1) SELECT employee_ID, name FROM employee_information, last_quarter_bonus WHERE employee_information.employee_ID =  last_quarter_bonus.employee_ID, employee_information = 'HR', last_quarter_bonus.bonus => '5000';

2) SELECT s.roll_number, s.name FROM student_information AS s JOIN faculty_information as f ON s.advisor = f.employee_ID WHERE (f.gender = 'M' AND f.salary >15000) OR (f.gender = 'F' AND f.salary >20000);


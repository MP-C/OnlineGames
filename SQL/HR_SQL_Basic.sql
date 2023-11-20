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


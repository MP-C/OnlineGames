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
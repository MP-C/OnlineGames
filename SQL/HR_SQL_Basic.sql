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
select city, length(city) from station order by length(city) DESC, city ASC fetch first row only;
select city, length(city) from station order by length(city) asc,city asc fetch first row only;

(
    SELECT 
        CITY,
        LENGTH(CITY)
    FROM STATION
    ORDER BY LENGTH(CITY), CITY ASC
    LIMIT 1
);
UNION
(
    SELECT 
        CITY,
        LENGTH(CITY)
    FROM STATION
    ORDER BY LENGTH(CITY) DESC, CITY ASC
    LIMIT 1
);

/* OUTPUT

*/



/*********************************************************************
11) Weather Observation Station 6
Query the list of CITY names starting with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.*/

/* OUTPUT

*/




/*********************************************************************
12) Weather Observation Station 7 */

/* OUTPUT

*/




/*********************************************************************
13) Weather Observation Station 8 */

/* OUTPUT

*/




/*********************************************************************
14) Weather Observation Station 9  */

/* OUTPUT

*/



/*********************************************************************
15) Weather Observation Station 10 */

/* OUTPUT

*/



/*********************************************************************
16) Weather Observation Station 11 */

/* OUTPUT

*/



/*********************************************************************
17) Weather Observation Station 12 */

/* OUTPUT

*/



/*********************************************************************
)  */

/* OUTPUT

*/



/*********************************************************************
)  */

/* OUTPUT

*/


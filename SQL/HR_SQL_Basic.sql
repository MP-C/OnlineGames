/*
1) RevisingTheSelectQueryI
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
The CITY table is described as follows
*/

Select * from CITY WHERE COUNTRYCODE ='USA' AND POPULATION > 100000;

/*
OUTPUT
3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549 
*/


/*********************************************************************
2) RevisingTheSelectQueryII
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA
The CITY table is described as follows
*/
Select NAME from CITY WHERE COUNTRYCODE ='USA' AND POPULATION > 120000;
/*
OUTPUT
Scottsdale
Corona
Concord
Cedar Rapids
*/


/*********************************************************************
3) Query all columns (attributes) for every row in the CITY table
*/
Select * from CITY;
/*
OUTPUT
6 Rotterdam NLD Zuid-Holland 593321 
3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549 
4054 Fairfield USA California 92256 
4058 Boulder USA Colorado 91238 
4061 Fall River USA Massachusetts 90555 
*/


/*********************************************************************
4) Query all columns for a city in CITY with the ID 1661.
*/
Query all columns for a city in CITY with the ID 1661
/*
OUTPUT
1661 Sayama JPN Saitama 162472
*/

/*********************************************************************
5) 
*/

/*
OUTPUT

*/
/*********************************************************************
) 
*/

/*
OUTPUT

*/


/*********************************************************************
) 
*/

/*
OUTPUT

*/
/*********************************************************************
) 
*/

/*
OUTPUT

*/
/*********************************************************************
) 
*/

/*
OUTPUT

*/
/*********************************************************************
) 
*/

/*
OUTPUT

*/
/*********************************************************************
) 
*/

/*
OUTPUT

*/
/*********************************************************************
) 
*/

/*
OUTPUT

*/

/*
Objective:
In this challenge, we learn about JavaScript Dates. Check out the attached tutorial for more details.

Task:
Given a date string, datastring, in the format MM/DD/YYYY, find and return the day name for that date. Each 
day name must be one of the following strings: Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday. For example, the day name for the date 12/07/2016 is Wednesday.

Input Format:
Locked stub code in the editor reads the following input from stdin:
The first line contains an integer, d, denoting the number of dates to check.
Each line i of the d subsequent lines contains a date in MM/DD/YYYY format; each date denotes some dateString
that is passed to the function.

Constraints:
It is guaranteed that the input only consists of valid dates
 */

// The days of the week are: "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
function getDayName(dateString) {
    let weekDays=["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    return weekDays[new Date(dateString).getDay()];
}
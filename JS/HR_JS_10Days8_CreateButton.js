/*
Objective
In this challenge, we practice creating buttons in JavaScript. Check out the attached tutorial
 for learning materials.

Task
Complete the code in the editor so that it creates a clickable button satisfying the following
 properties:
The button's id is btn.
The button's initial text label is . After each click, the button must increment by . Recall
 that the button's text label is the JS object's innerHTML property.
The button has the following style properties:A width of 96px.
A height of 48px.
The font-size attribute is 24px.
The .js and .css files are in different directories, so use the link tag to provide the CSS
 file path and the script tag to provide the JS file path:
*/

/* c://Folder/js/index.html */
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Button</title>
    </head>
    <body>
        <!DOCTYPE html>
        <button id="btn">0</button>        
        <script src="js/button.js" type="text/javascript"></script>
    </body>
</html>

/* c://Folder/js/button.css */
// Select the button using its ID
#btn {
    /* Set the required dimensions and font size */
    width: 96px;
    height: 48px;
    font-size: 24px;
}

/* c://Folder/js/button.js */
  // 1. Get a reference to the button using its ID
const button = document.getElementById('btn');

// 2. Initialize a counter variable (based on the button's initial label '0')
let count = 0;

// 3. Define the function to execute on click
function incrementCount() {
    // Increment the counter by 1
    count += 1;
    
    // Update the button's text label (innerHTML property)
    button.innerHTML = count;
}

// 4. Attach the incrementCount function to the button's click event
button.onclick = incrementCount;
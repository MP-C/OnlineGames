// HTML
<!-- Enter your HTML code here -->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Button</title>
        <link rel="stylesheet" href="css/button.css" type="text/css">
    </head>
    <body>
        <script src="js/button.js" type="text/javascript"></script>
    </body>
</html>


// CSS
#btn{
    width:96px;
    height:48px;
    font-size:24px; 
}

// JS
var newBtn = document.createElement('button');
newBtn.id = 'btn';
newBtn.innerHTML = 0;
document.body.appendChild(newBtn);

newBtn.onclick = function() {
    var count = parseInt(newBtn.innerHTML);
    if(count < 5){
        newBtn.innerHTML= count +1;
    } else{
        newBtn.innerHTML= 9;
    }
};
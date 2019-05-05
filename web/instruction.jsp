<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/instruction.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <title>Test</title>
    </head>
    <body oncontextmenu="return false;">

        <%
            //HERE WE GETTING THE ATTRIBUTE DECLARED IN LOGINACTION.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
            String uid = (String) session.getAttribute("candidate");
            if (uid == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div id="startWindow">
            <div class="modalBox">
                <h1>Welcome</h1>
                <h4>Instructions</h4>
                <p>1.Some design features are provided to change the text in italics,bold or increase the size of text,change the font-family.</p>
                <p>2.There is a timer which will start only when you start typing in the textbox given.</p>
                <p>3.Your typing speed will be calculated.</p>
                <p>4.Your accuracy level will be checked using mistyped words.</p>
                <p>5.You can submit the test anytime.</p>
                <p>6.After submitting the test the result will be displayed instantaneously.</p>
                <a class="startButton" href="test.jsp">Start Test</a>
            </div>
        </div> 
    </body>

</html>

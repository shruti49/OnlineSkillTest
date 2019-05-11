
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Test</title>
        <style>

            #closeWindow {
                background-color: #3b444b;
                height: 100%;
                width: 100%;
                position: absolute;
                padding-top: 50px;
            }

            .modalBox2 {
                margin: 0 auto;
                width: 560px;
                height: 150px;
                background: #fff;
                border-radius: 10px;
                padding: 20px;
            }

            .endButton {
                text-decoration: none;
                float: right;
                padding: 5px;
                border-style: none;
                cursor: pointer;
                font-size: 22px;
                border-radius: 5px;
                background: #22A7F0;
                border: 2px solid transparent;
                color: #fff;
            }

            .endButton:hover {
                background: #fff;
                border: 2px solid #22A7F0;
                color: #22A7F0;
                transition: 0.2s;
                text-decoration: none;
            }

            #newTestWindow {
                background: rgba(0, 0, 0, 0.7);
                height: 100%;
                width: 100%;
                top: 0;
                left: 0;
                position: absolute;
                padding-top: 100px;
                overflow: hidden;
                display: none;
            }

            .modalBox3 {
                margin: 0 auto;
                width: 260px;
                height: 120px;
                background: #fff;
                border-radius: 10px;
                padding: 20px;
            }

            .newTestButton {
                text-decoration: none;
                padding: 10px;
                float: right;
                border-style: none;
                cursor: pointer;
                font-size: 18px;
                border-radius: 5px;
                background: #22A7F0;
                border: 2px solid transparent;
                color: #fff;
                font-weight: 100;
            }

            .newTestButton:hover {
                text-decoration: none;
                background: #fff;
                border: 2px solid #22A7F0;
                color: #22A7F0;
                transition: 0.2s;
            }
        </style>
    </head>
    <body>
        <%  
            String uid = (String) session.getAttribute("candidate");
            if (uid == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div id="closeWindow">
            <div class="modalBox2">
                <h3>You have successfully submitted the test.</h3>
                <br>
                <a href="scorecard.jsp" class="endButton">Close</a>
            </div 
        </div>

        <div id="newTestWindow">
            <div class="modalBox3">
                <h3>Time's Up!</h3>
                <a href="scorecard.jsp" class="newTestButton">Close</a>
            </div>
        </div>
    </body>
</html>

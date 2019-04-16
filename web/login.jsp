
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Typing Test</title>
        <link href="css/login.css" rel="stylesheet" type="text/css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">        
    </head>
    
    <body>
        <%
            StringBuffer sb = new StringBuffer();
            for (int i = 1; i <= 5; i++) {
                sb.append((char) (int) (Math.random() * 5) + 1);
            }
            String cap = new String(sb);
        %>

        <nav class="navbar-expand-md  justify-content-between nav" >
            <h3 class="navbar-brand">Online Skill Test Portal</h3>
        </nav>

        <div class="signin-form">
            <form action="Loginaction" method="post" name="f1" onsubmit="return validation()">  
                <h2>Login</h2>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" class="form-control" name="userid" placeholder="User Id" required="required">
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                </div>

                <div class="input-group">
                    <div class="captchabox">
                        <div class="code"><h2><%=cap%></h2></div>
                        <input type="text" name="cap1" class="inputbox form-control"  value="" placeholder="Enter captcha code here">
                        <input type="hidden" name="cap2" value='<%=cap%>' readonly="readonly"/>
                    </div>
                </div>

                <div class="input-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block">LOGIN</button>
                </div>             
            </form>
        </div>  

        <script src="js/login.js"></script> 

    </body>
</html>

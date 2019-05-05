
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/login.css" rel="stylesheet" type="text/css">
        <link href="css/admin.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
        <title>Admin Panel</title>
    </head>
    <body oncontextmenu="return false;">
        <%
            //HERE WE GETTING THE ATTRIBUTE DECLARED IN LOGINACTION.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
            String uid = (String) session.getAttribute("adminp");
            if (uid == null) {
                response.sendRedirect("login.jsp");
            }
        %>

        <nav id="navbar"  class="navbar-expand-md">
            <h3 class="navbar-brand">Online Skill Test Portal</h3>
            <a  id="logout" href="login.jsp">Logout</a>      
        </nav>

        <main>
            <div class="container mt-1 mb-1">
                <div class="row">
                    <div class="col-sm-12">
                        <form action="Testdetails" method="post" id="myform">
                            <select  name="timer" class="custom-select custom-select-md mt-3" required>
                                <option value="">Set the timer for the test</option>
                                <option value="60">60</option>
                                <option value="120">120</option>
                                <option value="180">180</option>
                                <option value="240">240</option>
                                <option value="300">300</option>
                            </select>

                            <div class="input-group mt-3">
                                <input name="datetime" id="input" placeholder="Schedule the date and time for the test" required>
                            </div>

                            <div class="input-group mt-3">
                                <div class="custom-file">
                                    <input name="doc" aria-describedby="inputGroupFileAddon01" id="inputGroupFile01" type="file" class="custom-file-input" accept=".doc, .docx, text/plain , application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document" onchange="fileDisplay(this.files)" required>
                                    <label class="custom-file-label" for="inputGroupFile01" id="lbl">Choose file</label>
                                </div>
                            </div>
                            <div class="input-group mt-3">
                                <textarea class="input-box" name="input" readonly></textarea>  
                            </div>

                            <div class="input-group mt-3">
                                File size : <input id="size" readonly name="size">
                                File extension : <input id="ext" readonly name="ext">
                                Total no of characters :<input id="chars" readonly name="chars">
                            </div>

                            <button class="btn"  id="submit-btn" type="submit">Submit</button> 

                        </form>
                    </div>
                </div>
            </div>
        </main>

        <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
        <script src="js/filevalidation.js"></script>

    </body>
</html>
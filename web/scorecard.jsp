
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <link href="css/scorecard.css" rel="stylesheet" type="text/css">
        <title>Result</title>
    </head>

    <body>
        <%
            //HERE WE GETTING THE ATTRIBUTE DECLARED IN LOGINACTION.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
            String uid = (String) session.getAttribute("user");
            if (uid == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="container mt-3 rounded">
            <div class="row">
                <header class="m-3 text-center">
                    <h3 class="mt-4">Score Card</h3>
                </header>
            </div>
            <div class="main" id="main-form">
                <form class="mb-3">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for=appno>Application No</label>
                            <input type="text" class="form-control" id="appno">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="rollno">Test Slot</label>
                            <input type="text" class="form-control" id="rollno">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tchar">Total no of characters</label>
                            <input type="text" class="form-control" id="tchar">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="uchar">No of characters typed</label>
                            <input type="text" class="form-control" id="uchar">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="wpm">Words per minute</label>
                            <input type="text" class="form-control" id="wpm">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="accuracy">Accuracy</label>
                            <input type="number" class="form-control" id="accuracy">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="errors">Mistyped Words</label>
                            <input type="number" class="form-control" id="errors">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="time">Test completion time</label>
                            <input type="number" class="form-control" id="time">
                        </div>
                        <div class="form-group col-md-6 mt-5">
                            <label for="csign">Candidate signature</label>
                            <input type="number" class="form-control" id="csign">
                        </div>
                        <div class="form-group col-md-6 mt-5">
                            <label for="tsign">Test incharge signature</label>
                            <input type="number" class="form-control" id="isign">
                        </div>
                    </div>

                    <button  class="btn btn-success float-right ml-2" onclick="printPage()">Print</button>
                    <button class="btn btn-success float-right">Download</button>
                </form>
            </div>
        </div>
        <script>
            function printPage() {
                window.print();
            }
        </script>

    </body>

</html>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
            String uid = (String) session.getAttribute("candidate");
            if (uid == null) {
                response.sendRedirect("login.jsp");
            }
          
            Connection conn;
            PreparedStatement pst;
            ResultSet rs;
            String no = null;
            String id = null;
            String wpm = null;
            String acc = null;
            String err = null;
            String dur = null;
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String connectionUrl = "jdbc:sqlserver://localhost:1433;" + "databaseName=mydb;user=sa;password = admin1234";

            try {
                Class.forName(driverName);
                System.out.println("Connecting to database...");
                conn = DriverManager.getConnection(connectionUrl);
                pst = conn.prepareStatement("select * from dbo.Result where ApplicationNo=uid");
                rs = pst.executeQuery();

                while (rs.next()) {
                    no = rs.getString("ApplicationNo");
                    id = rs.getString("TestId");
                    wpm = rs.getString("wpm");
                    acc = rs.getString("accuracy");
                    err = rs.getString("error");
                    dur = rs.getString("TestDuration");
                }
            } catch (Exception e) {
                System.out.println("Exception is ;" + e);
            }
        %>
        <div class="container mt-3 rounded">
            <div class="row">
                <header class="m-3 text-center">
                    <h3 class="mt-4">Score Card</h3>
                </header>
            </div>
            <div class="main" id="main-form">
                <form class="mb-3" action="Fetchresult">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for=appno>Application No</label>
                            <input value="<%=no%>" class="form-control" id="appno" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="uchar">Test Id</label>
                            <input value="<%=id%>" class="form-control" id="uchar" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="wpm">Words per minute</label>
                            <input value="<%=wpm%>" class="form-control" id="wpm" readonly>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="accuracy">Accuracy</label>
                            <input value="<%=acc%>" class="form-control" id="accuracy" readonly>
                        </div>
                    </div>

                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label for="errors">Mistyped Words</label>
                            <input value="<%=err%>" class="form-control" id="errors" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="time">Test Duration</label>
                            <input value="<%=dur%>" class="form-control" id="time" readonly>
                        </div>
                        <div class="form-group col-md-6 mt-5">
                            <label for="csign">Candidate signature</label>
                            <input class="form-control" id="csign" readonly>
                        </div>
                        <div class="form-group col-md-6 mt-5">
                            <label for="tsign">Test incharge signature</label>
                            <input class="form-control" id="isign" readonly>
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

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/login.css" rel="stylesheet" type="text/css">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">        
        <title>Report</title>
    </head>
    <body>
        <%
            //HERE WE GETTING THE ATTRIBUTE DECLARED IN LOGINACTION.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
            String uid = (String) session.getAttribute("incharge");
            if (uid == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <nav class="navbar-expand-md  justify-content-between nav">
            <h3 class="navbar-brand">Online Skill Test Portal</h3>
        </nav>

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Application No</th>
                    <th scope="col">TestId</th>
                    <th scope="col">Wpm</th>
                    <th scope="col">Accuracy</th>
                    <th scope="col">Errors</th>
                    <th scop="col">Time Duration</th>
                </tr>
            </thead>
            <%
                Connection conn;
                PreparedStatement pst;
                ResultSet rs;
                String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
                String connectionUrl = "jdbc:sqlserver://localhost:1433;" + "databaseName=mydb;user=sa;password = admin1234";

                try {
                    Class.forName(driverName);
                    System.out.print("Connecting to dbo.Test_Detail database...");
                    conn = DriverManager.getConnection(connectionUrl);
                    pst = conn.prepareStatement("select * from dbo.result");
                    rs = pst.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("ApplicationNo")%></td>
                <td><%=rs.getString("TestId")%></td>
                <td><%=rs.getString("wpm")%></td>
                <td><%=rs.getString("accuracy")%></td>
                <td><%=rs.getString("error")%></td>
                <td><%= rs.getString("TestDuration")%></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    System.out.println("Exception is ;" + e);
                }
            %>
        </table>

    </body>
</html>

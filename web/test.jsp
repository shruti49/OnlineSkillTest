<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/test.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <title>Test</title>
    </head>
    <body oncontextmenu="return false;" onload="myfun()">

        <%
            String uid = (String) session.getAttribute("candidate");
            if (uid == null) {
                response.sendRedirect("login.jsp");
            }

            Connection conn;
            PreparedStatement pst;
            ResultSet rs;
            String content = null;
            String timer = null;
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String connectionUrl = "jdbc:sqlserver://localhost:1433;" + "databaseName=mydb;user=sa;password = admin1234";

            try {
                Class.forName(driverName);
                System.out.print("Connecting to dbo.Test_Detail database...");
                conn = DriverManager.getConnection(connectionUrl);
                pst = conn.prepareStatement("select testTimer,docContent from dbo.Test_Detail where schedule <= GETDATE()");
                rs = pst.executeQuery();
                while (rs.next()) {
                    content = rs.getString("docContent");
                    timer = rs.getString("testTimer");
                }
            } catch (Exception e) {
                System.out.println("Exception is ;" + e);
            }
        %>
        <nav id="navbar-design" class="d-flex">
            <div class="p-1 flex-fill text-center">
                <button class="bold" onclick="exeCmd('bold');"><i class="fas fa-bold"></i></button>
            </div>
            <div class="p-1 flex-fill text-center">
                <button class="italics" onclick="exeCmd('italic');"><i class="fas fa-italic"></i></button>
            </div>
            <div class="p-1 flex-fill text-center">
                <button class="underline" onclick="exeCmd('underline');"><i class="fas fa-underline"></i></button>
            </div>
            <div class="p-1 flex-fill text-center">
                <button class="ul" onclick="exeCmd('insertUnorderedList');"><i class="fas fa-list-ul"></i></button>
            </div>
            <div class="p-1 flex-fill text-center">
                <button class="ol" onclick="exeCmd('insertOrderedList');"><i class="fas fa-list-ol"></i></button>
            </div>
            <div class="p-1 flex-fill text-center">
                <button class="strike" onclick="exeCmd('strikethrough');"><i class="fas fa-strikethrough"></i></button>
            </div>
            <div class="p-1 flex-fill text-center">
                <select id="dropdown-size" onchange="fontEditor('fontSize', this.value)">
                    <option value="1">Font Size-1</option>
                    <option value="2">Font Size-2</option>
                    <option value="3">Font Size-3</option>
                    <option value="4">Font Size-4</option>
                    <option value="5">Font Size-5</option>
                    <option value="6">Font Size-6</option>
                </select>
            </div>
            <div class="p-1 flex-fill text-center">
                <select id="dropdown-font" onchange="fontEditor('fontName', this.value)">
                    <option value="Times New Roman">Times New Roman</option>
                    <option value="Comic Sans MS">Comic Sans MS</option>
                    <option value="Helvetica">Helvetica</option>
                    <option value="calibri">Calibri(Body)</option>
                    <option value="Arial">Arial</option>
                </select>
            </div>
            <div class="p-1 flex-fill text-center">
                <button id="submit-btn" onclick="store()">Submit</button>
            </div>
        </nav>

        <nav id="nav" class="d-flex">
            <div id="nav-item" class="flex-fill text-center">Time Left</div>
            <div id="nav-item" class="flex-fill text-center">No of chars</div>
            <div id="nav-item" class="flex-fill text-center">No of lines</div>
            <div id="nav-item" class="flex-fill text-center">No of paragraphs</div>
            <div id="nav-item" class="flex-fill text-center">Words Per Minute</div>
            <div id="nav-item" class="flex-fill text-center">Accuracy</div>
            <div id="nav-item" class="flex-fill text-center">Error</div>
        </nav>
        <!--<form action="Storeresult" method="post">-->
        <nav id="navbar" class="d-flex justify-content-between">
            <input type="hidden" id="xyz" value='<%=timer%>' >
            <input id="timer" value="00:00" class="text-right">
            <input id="char-count" value="0" class="text-center" readonly>
            <input id="line-count" value="0" class="text-center" readonly>
            <input id="para-count" value="0" class="text-center" readonly>
            <input id="wpm" value="0" class="text-right" readonly>
            <input id="accuracy" value="0" class="text-right" readonly>
            <input id="error" value="0" class="text-center" readonly>
        </nav>
        <!--</form>-->

        <div id="para-box" class="d-flex flex-column">
            <textarea id="hide" style="display:none;"><%=content%></textarea>
            <div class="input-box p-2 m-2"></div>
            <div class="output-box p-2 m-2" contenteditable></div>
        </div>

        <script src="js/test.js"></script>
    </body>

</html>


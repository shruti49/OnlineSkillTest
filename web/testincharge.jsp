
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
            <li class="nav-item">
                <select id="dropdown-font" onchange="fontEditor('fontName', this.value)">
                    <option value="Times New Roman">less than 35 wpm and accuracy</option>
                    <option value="Comic Sans MS">35 wpm and accuracy</option>
                    <option value="Helvetica">more than 35 wpm and accuracy</option>
                </select>
            </li>
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
                    <th scope="col">Completion Time</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td>@mdo</td>
                    <td>@mdo</td>

                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                     <td>the Bird</td>
                    <td>@twitter</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                </tr>
            </tbody>
        </table>

    </body>
</html>

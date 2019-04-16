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
    <body oncontextmenu="return false;">
        <%
            //HERE WE GETTING THE ATTRIBUTE DECLARED IN LOGINACTION.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
            String uid = (String) session.getAttribute("user");
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
                <button class="startButton">Start Test</button>
            </div>
        </div>

        <nav   id="navbar-design" class="navbar-expand">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <button class="bold" onclick="exeCmd('bold');"><i class="fas fa-bold"></i></button>
                </li>
                <li class="nav-item">
                    <button class="italics" onclick="exeCmd('italic');"><i class="fas fa-italic"></i></button>
                </li>  
                <li class="nav-item">
                    <button class="underline" onclick="exeCmd('underline');"><i class="fas fa-underline"></i></button>
                </li>
                <li class="nav-item">
                    <button class="ul" onclick="exeCmd('insertUnorderedList');"><i class="fas fa-list-ul"></i></button>
                </li>
                <li class="nav-item">
                    <button class="ol" onclick="exeCmd('insertOrderedList');"><i class="fas fa-list-ol"></i></button>
                </li>
                <li class="nav-item">
                    <button class="strike" onclick="exeCmd('strikethrough');"><i class="fas fa-strikethrough"></i></button>
                </li>
                <li class="nav-item">
                    <select  id="dropdown-size" onchange="fontEditor('fontSize', this.value)">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </li>
                <li class="nav-item">
                    <select id="dropdown-font" onchange="fontEditor('fontName', this.value)">
                        <option value="Times New Roman">Times New Roman</option>
                        <option value="Comic Sans MS">Comic Sans MS</option>
                        <option value="Helvetica">Helvetica</option>
                        <option value="calibri">Calibri(Body)</option>
                        <option value="Arial">Arial</option>
                    </select>
                </li>
                <button class="btn btn-sm"  id="submit-btn" type="submit"><strong>Submit</strong></button>
            </ul>
        </nav>

        <nav id="nav"  class="navbar navbar-expand-lg" >
            <ul class="navbar-nav">
                <li class="nav-item">            
                    <div id="timer"></div>
                </li>
                <li class="nav-item">           
                    <div id="char-count"></div>
                </li>
                <li class="nav-item">           
                    <div id="line-count"></div>
                </li>
                <li class="nav-item">           
                    <div id="para-count"></div>
                </li>
                <li class="nav-item">           
                    <div id="incorrect-words"></div>
                </li>
                <li class="nav-item">           
                    <div id="accuracy"></div>
                </li>
                <li class="nav-item">           
                    <div id="wpm"></div>
                </li>
            </ul>
        </nav>    

        <div id="para-box">
            <div class="input-box"></div>
            <div class="output-box" contenteditable></div>
        </div>

        <div id="closeWindow">
            <div class="modalBox2">
                <h3>You have successfully submitted the test.</h3>
                <br>
                <a href="scorecard.jsp" class="endButton">Close</a>
            </div>
        </div>

        <div id="newTestWindow">
            <div class="modalBox3">
                <h3>Time's Up!</h3>
                <a href="scorecard.jsp" class="newTestButton">Close</a>
            </div>
        </div>
        <script src="js/test.js"></script>
    </body>

</html>

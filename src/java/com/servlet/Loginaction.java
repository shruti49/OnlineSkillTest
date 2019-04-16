package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class Loginaction extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String id = request.getParameter("userid");
            String pass = request.getParameter("password");

            try {
                String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
                String connectionUrl = "jdbc:sqlserver://localhost:1433;" + "databaseName=mydb;user=sa;password = admin1234";

                Class.forName(driverName);
                System.out.println("Connecting to database...");
                Connection conn = DriverManager.getConnection(connectionUrl);
                PreparedStatement pst = conn.prepareStatement("select * from dbo.Candidate_List where Application_No  =  ? and Roll_No  =  ?");
                HttpSession session = request.getSession();
                pst.setString(1, id);
                pst.setString(2, pass);
                ResultSet rs = pst.executeQuery();
                int flag = 0;
                while (rs.next()) {
                    flag = 1;
                    String userNameDB = rs.getString("Application_No");
                    String passwordDB = rs.getString("Roll_No");
                    String roleDB = rs.getString("Role");

                    if (userNameDB.equals(id) && passwordDB.equals(pass) && roleDB.equals("user")) {
                        //if the user is valid, then this block executes and WE ARE KEEPING THE USER IN A SESSION
                        session.setAttribute("candidate", userNameDB);//THIS IS HOW WE DECLARE THE USER IN A SESSION
                        response.sendRedirect("test.jsp");
                    } else if (userNameDB.equals(id) && passwordDB.equals(pass) && roleDB.equals("testincharge")) {
                        session.setAttribute("incharge", userNameDB);
                        response.sendRedirect("testincharge.jsp");
                    } else if (userNameDB.equals(id) && passwordDB.equals(pass) && roleDB.equals("supertestincharge")) {
                        session.setAttribute("superIncharge", userNameDB);
                        response.sendRedirect("supertestincharge.jsp");
                    } else if (userNameDB.equals(id) && passwordDB.equals(pass) && roleDB.equals("admin")) {
                        session.setAttribute("adminp", userNameDB);
                        response.sendRedirect("admin_panel.jsp");
                    }
                }
                if (flag == 0) {
                    //IF THE USER IS NOT AUTHORISED THEN AGAIN HE WILL BE REDIRECTED TO THE SAME LOGIN PAGE
                    response.sendRedirect("login.jsp");
                }
            } catch (Exception e) {
                System.out.println("Exception is ;" + e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class Fetchresult extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.sendRedirect("scorecard.jsp");
           
            Connection conn;
            PreparedStatement pst;
            ResultSet rs;
            String content = null;
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String connectionUrl = "jdbc:sqlserver://localhost:1433;" + "databaseName=mydb;user=sa;password = admin1234";

            try {
                Class.forName(driverName);
                System.out.println("Connecting to database...");
                conn = DriverManager.getConnection(connectionUrl);
                pst = conn.prepareStatement("insert into dbo.result values(?,?,?,?)");
                int wpm = Integer.parseInt(request.getParameter("wpm"));
                int accuracy = Integer.parseInt(request.getParameter("accuracy"));
                int error = Integer.parseInt(request.getParameter("error"));
                System.out.println(wpm);
                System.out.println(accuracy);
                System.out.println(error);
                
            } catch (Exception e) {
                System.out.println("Exception is ;" + e);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}

package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class Testdetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String connectionUrl = "jdbc:sqlserver://localhost:1433;" + "databaseName=mydb;user=sa;password = admin1234";

            try {
                Class.forName(driverName);
                System.out.println("Connecting to database...");
                Connection conn = DriverManager.getConnection(connectionUrl);
                PreparedStatement pst = conn.prepareStatement("insert into dbo.Test_Detail values(?,?,?,?,?,?,?)");
                String docName = request.getParameter("doc");
                String docSize = request.getParameter("size");
                String Timer = request.getParameter("timer");
                int totalChars = Integer.parseInt(request.getParameter("chars"));
                String extension = request.getParameter("ext");
                String inputDoc = request.getParameter("input");
                String dt = request.getParameter("datetime");

                pst.setString(1, docName);
                pst.setString(2, docSize);
                pst.setString(3, Timer);
                pst.setInt(4, totalChars);
                pst.setString(5, extension);
                pst.setString(6, inputDoc);
                pst.setString(7, dt);

                // execute insert SQL stetement
                pst.executeUpdate();
                System.out.print("Record is inserted into table!");
                response.sendRedirect("login.jsp");

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

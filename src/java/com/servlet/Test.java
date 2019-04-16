package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.sql.*;

public class Test extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
                String connectionUrl = "jdbc:sqlserver://localhost:1433;" + "databaseName=mydb;user=sa;password = admin1234";

                Class.forName(driverName);
                System.out.println("Connecting to database...");
                Connection conn = DriverManager.getConnection(connectionUrl);
                PreparedStatement pst = conn.prepareStatement("select * from Test_Detail");
                //HttpSession session = request.getSession();
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String name = rs.getString(2);
                    int size = rs.getInt(3);
                    String timer = rs.getString(4);
                    int chars = rs.getInt(5);
                    String extnsn = rs.getString(6);
                    String con = rs.getString(7);
                    out.print(name + " " + size + " " + timer + " " + chars + " " + extnsn + " " + con);
                }

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

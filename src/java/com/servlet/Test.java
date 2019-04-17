package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class Test extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
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
                pst = conn.prepareStatement("select docContent from Test_Detail where docId=1");
                rs = pst.executeQuery();

                while (rs.next()) {
                    content = rs.getString("docContent");
                }
                out.print(content);
                request.setAttribute("data", content);
                request.getRequestDispatcher("test.jsp").forward(request, response);

            } catch (Exception e) {
                System.out.println("Exception is ;" + e);
            }
        }
    }

}

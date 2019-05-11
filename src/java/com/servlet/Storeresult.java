package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Storeresult extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Connection conn;
            PreparedStatement pst;
            ResultSet rs;
            PreparedStatement pst1;
            ResultSet rs1;
            int id = 0;
            String timer = null;
            String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String connectionUrl = "jdbc:sqlserver://localhost:1433;" + "databaseName=mydb;user=sa;password = admin1234";

            try {
                Class.forName(driverName);
                System.out.println("Connecting to dbo.Result database...");
                conn = DriverManager.getConnection(connectionUrl);
                pst1 = conn.prepareStatement("select docId,testTimer from dbo.Test_Detail where schedule <= GETDATE()");

                rs1 = pst1.executeQuery();
                while (rs1.next()) {
                    id = rs1.getInt("docId");
                    timer = rs1.getString("testTimer");
                }
                pst = conn.prepareStatement("insert into dbo.result values(?,?,?,?,?,?)");
                String no = (String) session.getAttribute("candidate");
                int wpm = Integer.parseInt(request.getParameter("value1"));
                String accuracy = request.getParameter("value2");
                int error = Integer.parseInt(request.getParameter("value3"));

                pst.setString(1, no);
                pst.setInt(2, id);
                pst.setInt(3, wpm);
                pst.setString(4, accuracy);
                pst.setInt(5, error);
                pst.setString(6, timer);

                pst.executeUpdate();
                System.out.print("Record is inserted into table!");
                response.sendRedirect("testsubmission.jsp");

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

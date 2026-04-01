<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Information</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        table { border-collapse: collapse; margin: 20px auto; width: 70%; }
        th, td { border: 1px solid #ddd; padding: 10px; }
        th { background-color: #4CAF50; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        tr:hover { background-color: #ddd; }
    </style>
</head>
<body>

    <h2>Student Information Details</h2>

    <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/student_db";
        String username = "root";
        String password = ""; // Change to your database password
        
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Open a connection
            con = DriverManager.getConnection(url, username, password);
            
            // Execute query
            stmt = con.createStatement();
            String query = "SELECT stud_id, stud_name, class, division, city FROM students_info";
            rs = stmt.executeQuery(query);
            
            // Present data in a table
    %>
            <table>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Class</th>
                    <th>Division</th>
                    <th>City</th>
                </tr>
                <% while(rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("stud_id") %></td>
                    <td><%= rs.getString("stud_name") %></td>
                    <td><%= rs.getString("class") %></td>
                    <td><%= rs.getString("division") %></td>
                    <td><%= rs.getString("city") %></td>
                </tr>
                <% } %>
            </table>
    <%
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error occurred: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            // Clean up resources
            try { if (rs != null) rs.close(); } catch (SQLException e) { }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { }
            try { if (con != null) con.close(); } catch (SQLException e) { }
        }
    %>

</body>
</html>

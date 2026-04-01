import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class EbookServlet extends HttpServlet {
    
    // Database credentials
    static final String DB_URL = "jdbc:mysql://localhost:3306/ebookshop";
    static final String USER = "root";
    static final String PASS = ""; // Change this if you have a different password

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String title = "E-Bookshop Database Content";
        
        out.println("<html>\n" +
                "<head><title>" + title + "</title>\n" +
                "<style>\n" +
                "  table { border-collapse: collapse; width: 60%; margin: 20px auto; }\n" +
                "  th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }\n" +
                "  th { background-color: #f2f2f2; }\n" +
                "  h2 { text-align: center; }\n" +
                "</style>\n" +
                "</head>\n" +
                "<body>\n" +
                "<h2>" + title + "</h2>");
                
        Connection conn = null;
        Statement stmt = null;
        
        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            // Execute SQL query
            stmt = conn.createStatement();
            String sql = "SELECT book_id, book_title, book_author, book_price, quantity FROM ebookshop";
            ResultSet rs = stmt.executeQuery(sql);
            
            // Generate HTML table
            out.println("<table>");
            out.println("<tr><th>Book ID</th><th>Title</th><th>Author</th><th>Price</th><th>Quantity</th></tr>");
            
            while (rs.next()) {
                int id = rs.getInt("book_id");
                String bTitle = rs.getString("book_title");
                String author = rs.getString("book_author");
                double price = rs.getDouble("book_price");
                int qty = rs.getInt("quantity");
                
                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + bTitle + "</td>");
                out.println("<td>" + author + "</td>");
                out.println("<td>$" + price + "</td>");
                out.println("<td>" + qty + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            
            // Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (SQLException se) {
            se.printStackTrace();
            out.println("<p style='color:red;'>SQL Error: " + se.getMessage() + "</p>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException se2) {}
            try {
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        
        out.println("</body></html>");
    }
}

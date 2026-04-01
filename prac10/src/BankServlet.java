import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BankServlet")
public class BankServlet extends HttpServlet {
    
    // Inject the EJB (Stateless Session Bean)
    @EJB(mappedName = "BankBean")
    private BankRemote bankBean;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String action = request.getParameter("action");
        String amtStr = request.getParameter("amount");
        double amount = 0;
        
        if (amtStr != null && !amtStr.isEmpty()) {
            try {
                amount = Double.parseDouble(amtStr);
            } catch (NumberFormatException e) {
                out.println("<h3>Invalid amount entered.</h3>");
                return;
            }
        }
        
        out.println("<html><head><title>Transaction Result</title></head>");
        out.println("<body>");
        out.println("<h2>Transaction Processing</h2>");
        
        if (bankBean != null) {
            if ("Deposit".equals(action)) {
                bankBean.deposit(amount);
                out.println("<p style='color:green;'>Successfully deposited: $" + amount + "</p>");
            } else if ("Withdraw".equals(action)) {
                double currentBal = bankBean.getBalance();
                if (amount > currentBal) {
                    out.println("<p style='color:red;'>Insufficient funds to withdraw: $" + amount + "</p>");
                } else {
                    bankBean.withdraw(amount);
                    out.println("<p style='color:green;'>Successfully withdrew: $" + amount + "</p>");
                }
            }
            out.println("<h3>Current Balance: $" + bankBean.getBalance() + "</h3>");
        } else {
            out.println("<p style='color:red;'>Error: EJB Injection Failed.</p>");
        }
        
        out.println("<br/><a href='index.jsp'>Go Back</a>");
        out.println("</body></html>");
    }
}

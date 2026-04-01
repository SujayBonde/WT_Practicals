import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

    private String name;
    private String mobile;
    private String email;

    // Getters and Setters
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    // Struts 2 Validate method
    @Override
    public void validate() {
        // Validation d: if no entered any value
        if (name == null || name.trim().isEmpty()) {
            addFieldError("name", "Name is required.");
        } else if (!name.matches("^[a-zA-Z\\s]+$")) { // Validation a: correct names
            addFieldError("name", "Name must contain only alphabets.");
        }

        if (mobile == null || mobile.trim().isEmpty()) {
            addFieldError("mobile", "Mobile number is required.");
        } else if (!mobile.matches("^[0-9]{10}$")) { // Validation b: mobile numbers (assuming 10 digits)
            addFieldError("mobile", "Mobile number must be exactly 10 digits.");
        }

        if (email == null || email.trim().isEmpty()) {
            addFieldError("email", "Email ID is required.");
        } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) { // Validation c: email id
            addFieldError("email", "Invalid Email Format.");
        }
    }

    // Execute method
    @Override
    public String execute() throws Exception {
        // If validation fails, Struts automatically returns "input"
        // and redisplays the login page with validation messages (Validation e).
        
        // If validation passes, we return SUCCESS to go to the welcome page (Validation f).
        return SUCCESS;
    }
}

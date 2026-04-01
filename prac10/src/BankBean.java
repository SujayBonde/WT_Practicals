import javax.ejb.Stateless;

@Stateless(mappedName = "BankBean")
public class BankBean implements BankRemote {

    // Simulating a balance since Stateless beans don't truly persist conversational state
    // In a real application, you would persist this in a DB
    private double balance = 5000.00; 

    @Override
    public double deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
        return balance;
    }

    @Override
    public double withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
        }
        return balance;
    }

    @Override
    public double getBalance() {
        return balance;
    }
}

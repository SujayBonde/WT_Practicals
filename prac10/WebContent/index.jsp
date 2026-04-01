<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bank EJB Web Client</title>
    <style>
        body { font-family: monospace, sans-serif; background-color: #f2f2f2; padding: 50px; }
        .form-box { background: #fff; border: 1px solid #ccc; padding: 30px; border-radius: 5px; width: 400px; margin: 0 auto; box-shadow: 2px 2px 10px rgba(0,0,0,0.1); text-align: center; }
        input[type="text"] { width: 90%; padding: 10px; margin-bottom: 20px; border: 1px solid #ccc; border-radius: 4px; }
        input[type="submit"] { padding: 10px 20px; font-weight: bold; border: none; cursor: pointer; border-radius: 4px; margin: 5px; }
        .btn-dep { background-color: #4CAF50; color: white; }
        .btn-with { background-color: #f44336; color: white; }
    </style>
</head>
<body>

    <div class="form-box">
        <h2>Enter Amount</h2>
        <form action="BankServlet" method="POST">
            <input type="text" name="amount" placeholder="e.g. 500.00" required />
            <br/>
            <input type="submit" name="action" value="Deposit" class="btn-dep" />
            <input type="submit" name="action" value="Withdraw" class="btn-with" />
        </form>
    </div>

</body>
</html>

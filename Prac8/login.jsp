<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; background-color: #f4f4f9; margin: 0; }
        .login-container { background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); width: 400px; }
        .login-container h2 { text-align: center; margin-bottom: 20px; color: #333; }
        .errorMessage { color: red; list-style-type: none; padding: 0; margin-bottom: 10px; font-size: 14px; }
    </style>
</head>
<body>

<div class="login-container">
    <h2>User Login</h2>
    
    <%-- Displaying Struts Validation Errors --%>
    <s:actionerror />
    <s:fielderror />
    
    <s:form action="login" method="post" theme="simple">
        <div style="margin-bottom: 15px;">
            <label for="name">Name:</label><br/>
            <s:textfield name="name" id="name" cssStyle="width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box;" />
        </div>
        
        <div style="margin-bottom: 15px;">
            <label for="mobile">Mobile Number:</label><br/>
            <s:textfield name="mobile" id="mobile" cssStyle="width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box;" />
        </div>
        
        <div style="margin-bottom: 15px;">
            <label for="email">Email ID:</label><br/>
            <s:textfield name="email" id="email" cssStyle="width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box;" />
        </div>
        
        <s:submit value="Login" cssStyle="width: 100%; padding: 10px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px;" />
    </s:form>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: #e8f5e9; padding-top: 50px; }
        .welcome-box { background: white; padding: 30px; display: inline-block; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        h1 { color: #2e7d32; }
        p { font-size: 18px; color: #555; }
    </style>
</head>
<body>

    <div class="welcome-box">
        <h1>Congratulations!</h1>
        <p>Welcome, <strong><s:property value="name"/></strong>.</p>
        <p>Your login was successful.</p>
        
        <p>Your Mobile: <s:property value="mobile"/></p>
        <p>Your Email: <s:property value="email"/></p>
        
        <br>
        <a href="login.jsp" style="text-decoration: none; padding: 10px 15px; background: #2196F3; color: white; border-radius: 4px;">Go Back</a>
    </div>

</body>
</html>

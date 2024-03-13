<%-- 
    Document   : Login
    Created on : Jan 23, 2024, 9:21:21 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
    </head>
    <body>
        <form action="LoginComServlet" method="post"> <table>
                <tbody>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="txtEmail" value="" /><br/></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="txtPassword" value="" /><br/> </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" name="btAction1" /></td>
                        <td><%
    // Check for the error message attribute
    String errorMessage = (String) request.getAttribute("errorMessage");

    if (errorMessage != null) {
        out.println("<p style='color: red;'>" + errorMessage + "</p>");
    }
                            %></td>
                    </tr>
                </tbody>
            </table>
        </form>
  <a href="index.html">Back to Home Page</a>
    </body>
</html>

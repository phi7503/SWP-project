<%-- 
    Document   : Signup
    Created on : Jan 23, 2024, 9:21:45 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    </head>
    <body>
        <form action="SignupServlet" method="post"> 
            <table >

                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="txtUsername" value="" required=""/><br/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="txtPassword" value="" required=""/><br/></td>
                </tr>
                <tr>
                    <td>Fullname:</td>
                    <td><input type="text" name="txtFullname" value="" /><br/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="txtEmail" value="" /><br/></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input type="number" name="txtPhone" value="" /><br/></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td> <input type="radio" name="gender" value="male" id="male" />
                        <label for="male">Male</label>

                        <input type="radio" name="gender" value="female" id="female" />
                        <label for="female">Female</label></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="txtAddress" value="" /><br/></td>
                </tr>
                <tr>
                    <td>DoB:</td>
                    <td><input type="date" name="txtDoB" value="" /><br/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Signup" name="btAction2" /></td>
                    <td><%
    // Check for the error message attribute
    String errorMessage = (String) request.getAttribute("errorMessage1");

    if (errorMessage != null) {
        out.println("<p style='color: red;'>" + errorMessage + "</p>");
    }        
                        
                            %></td>
                </tr>

            </table>
        </form>
        <a href="/Project_SWP/LoginServlet">Back to Login page</a><br/>
        <a href="/Project_SWP/HomeControllerServlet">Back to Home Page.</a>
    </body>
</html>

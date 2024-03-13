<%-- 
    Document   : AddCompany
    Created on : Feb 23, 2024, 9:49:21 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="AddCompanyServlet" method="POST">
            <table >
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtEmail" value=""required=""/><br/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="txtPassword" value="" required=""/><br/></td>
                </tr>
                <tr>
                    <td>Location:</td>
                    <td><input type="text" name="txtLocation" value="" required=""/><br/></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input type="number" name="txtPhone" value="" required=""/><br/></td>
                </tr>
                 <tr>
                    <td>Website:</td>
                    <td><input type="text" name="txtWebsite" value="" required=""/><br/></td>
                </tr>
                <tr>
                    <td>Company name:</td>
                    <td><input type="text" name="txtComName" value="" required=""/><br/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="AddCompany" name="btAction3" /></td>
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
        <a href="/views/HomePageJS.jsp">Back to Home Page</a>
    </body>
</html>

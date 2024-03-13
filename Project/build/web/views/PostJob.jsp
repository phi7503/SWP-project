<%-- 
    Document   : PostJob
    Created on : Jan 30, 2024, 3:27:29 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Job</title>
    </head>
    <body>
        <%
     String comID = (String) session.getAttribute("comID");
        %>
        <form action="JobPostServlet" method="POST">
            <table >
                <tr>
                    <td>Title</td>
                    <td><input type="text" name="txtTitle" value=""required=""/><br/></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><input type="text" name="txtDescription" value="" required=""/><br/></td>
                </tr>
                <tr>
                    <td>Salary:</td>
                    <td><input type="number" name="txtSalary" value="" required=""/><br/></td>
                </tr>
                <tr>
                    <td>Requirement:</td>
                    <td><input type="text" name="txtRequirement" value="" required=""/><br/></td>
                </tr>
                <tr>
                    <td>Select job:</td>
                    <td>
                        <select name="txtSelectJob" required="">
                            <option value="8">IT</option>
                            <option value="5">clean</option>
                            <option value="4">boss</option>
                        </select>
                        <br/>
                    </td>
                </tr>

                <td><input type="submit" value="PostJob" name="btAction3" /></td>
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
        <a href="/Project_SWP/LoginComServlet">Back to Home Page</a>
    </body>
</html>

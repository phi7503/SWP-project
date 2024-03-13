<%-- 
    Document   : ForgotPass
    Created on : Jan 23, 2024, 9:38:04 PM
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
        <table >
            <tbody>
               <tr>
                        <td>Username:</td>
                        <td><input type="text" name="txtUsername" value="" /><br/></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="email" name="txtPassword" value="" /><br/> </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Send Email" name="btAction4" /></td>
                        <td></td>
                    </tr>
            </tbody>
        </table>
        <a href="/Project_SWP/HomeControllerServlet">Back to Login page</a><br/>

    </body>
</html>

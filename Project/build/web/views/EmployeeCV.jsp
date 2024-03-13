<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create CV</title>
</head>
<body>

<h2>Create CV</h2>

<form action="SaveCvServlet" method="post">
    <table>
        
        <tr>
            <td>Your CV:</td>
            <td><textarea name="contactInformation" rows="3" cols="50"></textarea></td>
        </tr>
        

       
        <tr>
            <td><input type="submit" value="Save CV" name="btAction" /></td>
        </tr>
    </table>
</form>



</body>
</html>

<%-- 
    Document   : Success
    Created on : Jan 31, 2024, 3:17:34 AM
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
        <div style="text-align: center; margin-top: 20%;">
    <h2>Post job successfully</h2>
    <form action="/Project_SWP/LoginComServlet" method="post">
        <button type="submit">Back to Home</button>
    </form>
    <input type="hidden" id="comID" value="<%= session.getAttribute("comID") %>">
    <button onclick="viewMyJobPosts()">My Job Post</button>
    <script>
        function viewMyJobPosts() {
            var comID = document.getElementById('comID').value;
            window.location.href = 'JobListComServlet?comID=' + comID;
        }
    </script>
</div>
    </body>
</html>

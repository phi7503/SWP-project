<%-- 
    Document   : HomePage
    Created on : Jan 24, 2024, 1:10:08 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <%
     // Retrieve the fullname from the session
     String fullname = (String) session.getAttribute("fullname");

     if (fullname != null) {
         out.println("Welcome, " + fullname + " !");
     } 
    %>
    <button onclick="window.location.href = 'index.html'">
        Logout
    </button>
    <button onclick="window.location.href = '/Project_SWP/SearchServlet'">
        Search
    </button>
    <button onclick="window.location.href = '/Project_SWP/JobPostServlet'">
        Post
    </button>
    <input type="hidden" id="comID" value="<%= session.getAttribute("comID") %>">
    <button onclick="viewMyJobPosts()">My Job Post</button>
    <script>
        function viewMyJobPosts() {
            var comID = document.getElementById('comID').value;
            window.location.href = 'JobListComServlet?comID=' + comID;
        }
    </script>

    <button onclick="window.location.href = '/Project_SWP/JobPostList'">
        All Job Post
    </button>
</html>

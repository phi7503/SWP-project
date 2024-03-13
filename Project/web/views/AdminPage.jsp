    <%-- 
    Document   : AdminPage
    Created on : Feb 23, 2024, 9:10:32 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <button onclick="window.location.href = '/views/JobSearch.jsp'">
            View Job Seeker
        </button>
        <button onclick="window.location.href = '/views/CompanyListAdmin'">
            View Company
        </button>
        <button onclick="window.location.href = '/views/AddCompany.jsp'">
            Add Company
        </button>
    </body>
</html>

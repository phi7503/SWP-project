<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Company Controller</title>
        <style>
            .company-card {
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 10px;
                margin: 10px;
                display: flex;
                flex-direction: column;
                width: 200px;
                height: auto;
                position: relative; /* Để xác định vị trí tuyệt đối cho các nút */
            }
            .company-info {
                display: none;
                margin-top: 10px;
            }
            .company-actions {
                position: absolute;
                top: 10px;
                right: 10px;
            }
        </style>
    </head>
    <body>
        <h1>Company List</h1>
        <c:forEach items="${companies}" var="company">
            <div class="company-card">
                <a href="JobListComServlet?comID=${company.comID}">
                    <div>${company.comName}</div>
                </a>
                <div>${company.email}</div>
                <button class="more-info-btn">More Info</button>
                <div class="company-info">
                    <div>Phone: ${company.phone}</div>
                    <div>Location: ${company.location}</div>
                    <div>Website: ${company.website}</div>
                </div>
                <div class="company-actions">
                    <button class="delete-btn">Delete</button>
                    <button class="update-btn">Update</button>
                </div>
            </div>
        </c:forEach>


        <script>
            document.querySelectorAll('.more-info-btn').forEach(button => {
                button.addEventListener('click', function () {
                    const info = this.parentNode.querySelector('.company-info');
                    if (info.style.display === 'block') {
                        info.style.display = 'none';
                        this.textContent = 'More Info';
                    } else {
                        info.style.display = 'block';
                        this.textContent = 'Hide';
                    }
                });
            });
        </script>
    </body>
</html>

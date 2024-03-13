<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List, Model.*, DAL.*"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <style>
            .spacer {
                background-color: rgb(119, 151, 184);
            }

            .full-height {
                height: 100vh;
            }
        </style>

    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Kho?ng tr?ng bên trái -->
                <div class="col-1 spacer full-height"> ?? t?m sau chèn j thì chèn</div>
                <!-- ph?n 1 -->
                <div class="col-10">
                    <!-- ph?n 1.1 -->
                    <div class="row">
                        <div class="col" style="background: linear-gradient(to right, #0077FF, #87CEEB);">
                            <div class="row">
                                <div class="col-2 d-flex align-items-center justify-content-center">
                                    <!-- Ph?n 1.1 -->
                                    <a href="/Project_SWP/HomeControllerServlet"><img src="${pageContext.request.contextPath}/img/logo.png" alt="Home" style="height: 40px;"></a>
                                </div>
                                <div class="col-8 d-flex align-items-center justify-content-center">
                                    <!-- Ph?n gi?a -->
                                    <p class="text-center font-italic">olala</p> <!-- ?o?n gi?i thi?u -->
                                </div>
                                <div class="col-2 d-flex align-items-center justify-content-center">
                                    <!-- Ph?n 1.2 -->
                                    <button class="btn btn-outline-orange"> 
                                        <%
// Retrieve the fullname from the session
String fullname = (String) session.getAttribute("fullname");

// Check if the fullname is not null
if (fullname != null) {
out.println(fullname);
} 
                                        %>
                                    </button>
                                    <!-- Nút b?m ch?a bi?t ?? làm gì nh?ng c? ?? ?ó-->
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- ph?n 1.2 -->
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="/Project_SWP/HomeControllerServlet">Home</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCategory"
                                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Category
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownCategory">
                                            <c:forEach var="category" items="${categories}">
                                                <li><a class="dropdown-item" href="/Project_SWP/SearchServlet?category=${category.categoryName}">${category.categoryName}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </li>



                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownLocation"
                                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Location
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownLocation">
                                            <li><a class="dropdown-item" href="#">Location 1</a></li>
                                            <li><a class="dropdown-item" href="#">Location 2</a></li>
                                            <li><a class="dropdown-item" href="#">Location 3</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownExperiance"
                                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Experience
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownExperiance">
                                            <li><a class="dropdown-item" href="#">experience 1</a></li>
                                            <li><a class="dropdown-item" href="#">experience 2</a></li>
                                            <li><a class="dropdown-item" href="#">experience 3</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPosition"
                                           role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Position
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownPosition">
                                            <li><a class="dropdown-item" href="#">Position 1</a></li>
                                            <li><a class="dropdown-item" href="#">Position 2</a></li>
                                            <li><a class="dropdown-item" href="#">Position 3</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown" id="salaryDropdown">
                                        <a class="nav-link" href="#" id="navbarDropdownSalary" role="button"
                                           data-bs-toggle="modal" data-bs-target="#salaryModal">
                                            Salary
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="modal fade" id="salaryModal" tabindex="-1" aria-labelledby="salaryModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="salaryModalLabel">Set Salary Range</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="salaryRange">Salary Range:</label>
                                                <input type="range" class="form-range" id="salaryRange" min="0" max="100000" step="1000">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Apply</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </nav>
                    <div class="row" style="background: linear-gradient(to right, #7b00ff 5%, rgb(31, 69, 204) 50%, #7b00ff 95%); padding: 10px;">
                        <div class="col-3  align-items-center justify-content-end">
                            <p style="color: #ffffff; margin: 0;">?i tìm vc ?ê th?t nghiêp r mà c? ch?i</p>
                            <p style="color: #ffffff; margin: 0;">Nh?p t? khóa ?? tìm ki?m</p>
                            <p style="color: #ffffff; margin: 0;">Nh?p t? khóa ?? tìm ki?m</p>
                            <p style="color: #ffffff; margin: 0;">Nh?p t? khóa ?? tìm ki?m</p>
                        </div>
                        <div class="col-7 d-flex align-items-center rounded-start">
                            <input type="text" class="form-control form-control-dark" placeholder="Search..." id="jobNameInput">
                        </div>

                        <div class="col-1 d-flex align-items-center justify-content-center rounded-end">
                            <button class="btn btn-primary" id="searchByNameBtn">Search</button>
                        </div>
                    </div>



                    <div class="row">
                        <div class="card-container" id="jobPostsContainer">
                            <c:if test="${not empty jobPosts}">
                                <c:forEach var="jobPost" items="${jobPosts}">
                                    <div class="card">
                                        <h2>${jobPost.getTitle()}</h2>
                                        <p><em>Job Description:</em></p>
                                        <p>${jobPost.getDescription()}</p>

                                        <h3>Details</h3>
                                        <p><strong>Salary: </strong>${jobPost.getSalary()} $</p>
                                        <p><strong>Posted Date: </strong>${jobPost.getPostedDate()}</p>
                                        <p><strong>Posted by: </strong>${jobPost.companyName}</p>

                                        <h3>Requirements</h3>
                                        <ul>
                                            <li>${jobPost.getRequirements()}</li>
                                        </ul>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div class="row">
                        <div class="card-container" id="jobPostsContainer">
                            <c:if test="${not empty jobPosts}">
                                <c:forEach var="jobPost" items="${jobPosts}">
                                    <!-- Your job post card structure goes here -->
                                    <div class="card">
                                        <h2>${jobPost.getTitle()}</h2>
                                        <p><em>Job Description:</em></p>
                                        <p>${jobPost.getDescription()}</p>

                                        <h3>Details</h3>
                                        <p><strong>Salary: </strong>${jobPost.getSalary()} $</p>
                                        <p><strong>Posted Date: </strong>${jobPost.getPostedDate()}</p>
                                        <p><strong>Posted by: </strong>${jobPost.companyName}</p>

                                        <h3>Requirements</h3>
                                        <ul>
                                            <li>${jobPost.getRequirements()}</li>
                                        </ul>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
                <!-- Kho?ng tr?ng bên ph?i -->
                <div class="col-1 spacer full-height"></div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let dropdowns = document.querySelectorAll(".navbar-nav .dropdown");
                dropdowns.forEach(function (dropdown) {
                    dropdown.addEventListener("mouseover", function () {
                        let dropdownMenu = this.querySelector(".dropdown-menu");
                        dropdownMenu.style.display = "block";
                    });
                    dropdown.addEventListener("mouseout", function () {
                        let dropdownMenu = this.querySelector(".dropdown-menu");
                        dropdownMenu.style.display = "none";
                    });
                });
            });

            var salaryModal = new bootstrap.Modal(document.getElementById('salaryModal'));
            document.getElementById('salaryDropdown').addEventListener('click', function () {
                salaryModal.show();
            });

            $(document).ready(function () {
                $(".dropdown-item").click(function () {
                    var selectedCategory = $(this).text();
                    $.ajax({
                        type: "GET", // Sử dụng phương thức GET để lấy job posts
                        url: "SearchServlet", // URL của Servlet để xử lý yêu cầu AJAX
                        data: {category: category}, // Truyền category được chọn trong yêu cầu AJAX
                        dataType: "html", // Dữ liệu trả về từ Servlet là HTML
                        success: function (response) {
                            $("#jobPostsContainer").html(response); // Cập nhật nội dung của jobPostsContainer với kết quả từ yêu cầu AJAX
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                });
            });

            $(document).ready(function () {
            // Function to handle search by job name
            $("#searchByNameBtn").click(function () {
            var jobName = $("#jobNameInput").val();
                    // Make sure jobName is not empty
                    if (jobName.trim() !== "") {
            $.ajax({
            type: "GET",
                    url: "SearchServlet",
                    data: { jobName: jobName },
                    dataType: "html",
                    success: function (response) {
                    $("#jobPostsContainer").html(response);
                    },
                    error: function (xhr, status, error) {
                    console.error("Error: " + error);
                    }
            });
            } else {
            // Handle case where jobName is empty
            alert("Please enter a job name.");
            }
        </script>
        <style>
            .navbar-nav {
                display: flex;
                justify-content: center;
                width: 100%;
            }

            .navbar-nav .dropdown:hover .dropdown-menu {
                display: block;
            }

            .nav-link.dropdown-toggle.active,
            .nav-link.dropdown-toggle:hover {
                color: #0077FF !important;
                /* Màu xanh bi?n ??m khi di chu?t */
            }

            .dropdown-item.active,
            .dropdown-item:hover {
                background-color: #0077FF !important;
                /* Màu n?n xanh bi?n ??m khi di chu?t */
                color: #fff !important;
                /* Màu ch? tr?ng khi di chu?t */
            }
            .form-range {
                width: 100%;
            }

            /* Thi?t l?p màu c?a con tr? tr??t */
            .form-range::-webkit-slider-thumb {
                background-color: #0077FF;
            }

            /* Thi?t l?p màu xanh ??m cho ph?n ???c ch?n trên thanh tr??t */
            .form-range::-webkit-slider-runnable-track {
                background-color: rgba(0, 119, 255, 0.5);
            }
            .form-control-dark {
                background-color: #74a8db;
                color: #ffffff;
                border: none;
            }

            .form-control-dark:focus {
                box-shadow: none;
            }

            .btn-primary {
                background-color: #d97b00;
                border: none;
                border-radius: 20px;
            }
            .btn-secondary {
                background-color: #0077FF;
                border: none;
                border-radius: 20px;
            }
        </style>
        <script>
            $(document).ready(function () {
            $("#searchByNameBtn").click(function () {
            var jobName = $("#jobNameInput").val();
                    if (jobName.trim() !== "") {
            $.ajax({
            type: "GET",
                    url: "SearchServlet",
                    data: {jobName: jobName},
                    dataType: "html",
                    success: function (response) {
                    $("#jobPostsContainer").html(response);
                    },
                    error: function (xhr, status, error) {
                    console.error("Error: " + error);
                    }
            });
            } else {
            alert("Please enter a job name.");
            }
            });
            });
        </script>


    </body>

</html>
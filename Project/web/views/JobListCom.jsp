
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                    <!-- Phần 1.1 -->
                                    <a href="/Project_SWP/HomeControllerServlet">
                                        <img src="link_to_your_logo_image" alt="Logo" style="max-height: 100px;"> <!-- logo -->
                                    </a>
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
                    <div class="btn btn-outline-orange">
                        <form action="/Project_SWP/JobPostServlet" method="post">
                            <button type="submit">Post job</button>
                        </form>
                    </div>


                    <div class="row">
                        <div class="card-container">
                            <c:if test="${not empty jobPosts}">
                                <c:forEach var="jobPost" items="${jobPosts}">
                                    <div class="card">
                                        <a href="/Project_SWP/JobDetail?id=${jobPost.getJobPostID()}">
                                            <h2>${jobPost.getTitle()}</h2>
                                        </a>
                                        <p><strong>Salary: </strong>${jobPost.getSalary()} $</p>
                                        <p><strong>Posted Date: </strong>${jobPost.getPostedDate()}</p>
                                        <p><strong>Posted by: </strong>${jobPost.companyName}</p>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col">
                            Ph?n 3
                        </div>
                    </div>
                </div>
                <!-- Kho?ng tr?ng bên ph?i -->
                <div class="col-1 spacer full-height"></div>
            </div>
        </div>

        <!-- Script JS c?a Bootstrap (tùy ch?n, n?u b?n mu?n s? d?ng các tính n?ng JavaScript c?a Bootstrap) -->
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
                        type: "POST",
                        url: "SearchServlet",
                        data: {selectedCategory: selectedCategory},
                        dataType: "json",
                        success: function (response) {
                            // Clear existing job posts
                            $(".job-posts").empty();
                            // Append new job posts
                            $.each(response, function (index, jobPost) {
                                var html = "<div class='job-post'>";
                                html += "<h2>" + jobPost.title + "</h2>";
                                // Add other job details here
                                html += "</div>";
                                $(".job-posts").append(html);
                            });
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                });
            });

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
            .card-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }

            .card {
                border-radius: 20px;
                border: 1px solid #ccc;
                padding: 20px;
                flex-basis: calc(33.33% - 20px);
                box-sizing: border-box;
            }
        </style>



    </body>

</html>
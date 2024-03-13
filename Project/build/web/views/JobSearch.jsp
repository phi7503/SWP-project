<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List, Model.*, DAL.*"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Deerhost Template">
        <meta name="keywords" content="Deerhost, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <header class="header-section header-normal">
            <div class="header__info">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__info-right">
                                <ul>
                                    <li><a href="#"><span class="fa fa-user"></span> Login </a></li>
                                    <li><a href="#"><span class="fa fa-user"></span> Register </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="header__logo">
                            <a href="./index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="/Project_SWP/HomeControllerServlet">Home</a></li>
                                <li>
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

                                <li>
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownCategory" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Location
                                    </a>
                                    <ul class="dropdown-menu dropdown-black" aria-labelledby="navbarDropdownCategory">
                                        <c:forEach var="company" items="${companies}">
                                            <li><a class="dropdown-item" href="/Project_SWP/SearchServlet?location=${company.location}">${company.location}</a></li>
                                            </c:forEach>
                                    </ul>
                                </li>


                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="./pricing.html">Pricing</a></li>
                                        <li><a href="/Project_SWP/JobPostList">Job Post</a></li>
                                    </ul>
                                </li>
                                <li class="active"><a href="./blog.html">News</a></li>
                                <li><a href="./contact.html">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="canvas__open">
                    <span class="fa fa-bars"></span>
                </div>
            </div>
        </header>
        <!-- Header End -->

        <section class="register-domain spad">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="register__text">
                            <div class="section-title">
                                <h3>Search your job</h3>
                            </div>
                            <div class="register__form">
                                <form action="#">
                                    <input type="text" placeholder="ex: cloudhost">
                                    <button type="submit" class="site-btn">Search</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Blog Section Begin -->
        <section class="blog-section spad">
            <div class="container">
                <div class="row">
                    <c:if test="${not empty jobPosts}">
                        <c:forEach var="jobPost" items="${jobPosts}" varStatus="loop">
                            <c:if test="${loop.index % 4 == 0}">
                            </div><div class="row">
                            </c:if>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="card">
                                    <div class="blog__item">
                                        <div class="blog__pic set-bg" data-setbg="img/blog/blog-1.jpg">
                                            <div class="label">${jobPost.getTitle()}</div>
                                        </div>
                                        <div class="blog__text">
                                            <h5><a href="#">${jobPost.getTitle()}</a></h5>
                                            <ul>
                                                <li><i class="fa fa-user"></i> ${jobPost.companyName}</li>
                                                <li><i class="fa fa-clock-o"></i> ${jobPost.getPostedDate()}</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <p><strong>Salary: </strong>${jobPost.getSalary()} $</p>
                                </div>
                            </div>
                            <c:if test="${loop.last and loop.index % 4 != 0}">
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </section>

    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="footer__top">
            <div class="container">
                <div class="row">

                </div>
            </div>
        </div>
        <div class="footer__text set-bg" data-setbg="img/footer-bg.png">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="footer__text-about">
                            <div class="footer__logo">
                                <a href="./index.html"><img src="img/logo.png" alt=""></a>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida viverra maecen
                                lacus vel facilisis. </p>
                            <div class="footer__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="footer__text-widget">
                            <h5>Company</h5>
                            <ul>
                                <li><a href="#">Company</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Press & Media</a></li>
                                <li><a href="#">News / Blogs</a></li>
                                <li><a href="#">Careers</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 col-sm-6">
                        <div class="footer__text-widget">
                            <h5>Hosting</h5>
                            <ul>
                                <li><a href="#">Web Hosting</a></li>
                                <li><a href="#">Reseller Hosting</a></li>
                                <li><a href="#">VPS Hosting</a></li>
                                <li><a href="#">Dedicated Servers</a></li>
                                <li><a href="#">Cloud Hosting</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="footer__text-widget">
                            <h5>cONTACT US</h5>
                            <ul class="footer__widget-info">
                                <li><span class="fa fa-map-marker"></span> 500 South Main Street Los Angeles,<br />
                                    ZZ-96110 USA</li>
                                <li><span class="fa fa-mobile"></span> 125-711-811 | 125-668-886</li>
                                <li><span class="fa fa-headphones"></span> Support.hosting@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="footer__text-copyright">
                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

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
                                    data: {category: selectedCategory}, // Truyền category được chọn trong yêu cầu AJAX
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
    </script>


</body>

</html>
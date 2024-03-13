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
        <title>DEERHOST | Template</title>

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
        <header class="header-section">
            <div class="header__info">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__info-right">
                                <ul>
                                    <li><a href="#" onclick="showLoginOptions()"><span class="fa fa-user"></span>Login</a></li>
                                    <li><a href="/Project_SWP/SignUpController"><span class="fa fa-user"></span> Sign Up </a></li>
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
                                <li><a href="./about.html">Team</a></li>
                                <li><a href="/Project_SWP/SearchServlet">Search</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="./pricing.html">Pricing</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="/Project_SWP/JobPostList">Job Post</a></li>
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

        <!-- Hero Section Begin -->
        <section class="hero-section">
            <div class="hero__slider owl-carousel">
                <div class="hero__item set-bg" data-setbg="img/hero/hero-1.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="hero__text">
                                    <h5>Starting At Only $ 2.8/month</h5>
                                    <h2>Welcome to the best<br /> hosting company</h2>
                                    <a href="#" class="primary-btn">Get started now</a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="hero__img">
                                    <img src="img/hero/hero-right.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__item set-bg" data-setbg="img/hero/hero-1.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="hero__text">
                                    <h5>Starting At Only $ 2.8/month</h5>
                                    <h2>Welcome to the best<br /> hosting company</h2>
                                    <a href="#" class="primary-btn">Get started now</a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="hero__img">
                                    <img src="img/hero/hero-right.png" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Register Domain Section Begin -->
        <section class="register-domain spad">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="register__text">
                            <div class="section-title">
                                <h3>Register Your Domain Now!</h3>
                            </div>
                            <div class="register__form">
                                <form action="#">
                                    <input type="text" placeholder="ex: cloudhost">
                                    <div class="change__extension">
                                        categories
                                        <ul>
                                            <li>.net</li>
                                            <li>.org</li>
                                            <li>.me</li>
                                        </ul>
                                    </div>
                                    <button type="submit" class="site-btn">Search</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Register Domain Section End -->




        <!-- Choose Plan Section Begin -->
        <section class="choose-plan-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <img src="img/choose-plan.png" alt="">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="plan__text">
                            <h3>up to 70% discount with free domain name registration included!</h3>
                            <ul>
                                <li><span class="fa fa-check"></span> FREE Domain Name</li>
                                <li><span class="fa fa-check"></span> FREE Email Address</li>
                                <li><span class="fa fa-check"></span> Plently of disk space</li>
                                <li><span class="fa fa-check"></span> FREE Website Bullder</li>
                                <li><span class="fa fa-check"></span> FREE Marketing Tools</li>
                                <li><span class="fa fa-check"></span> 1-Click WordPress Install</li>
                            </ul>
                            <a href="#" class="primary-btn">Get start now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Choose Plan Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer-section">
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                                function showLoginOptions() {
                                    Swal.fire({
                                        title: 'You are ',
                                        showDenyButton: true,
                                        showCancelButton: false,
                                        confirmButtonText: `jobSeeker`,
                                        denyButtonText: `Company`,
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            window.location.href = "/Project_SWP/LoginServlet"; // Đăng nhập bằng jobseeker
                                        } else if (result.isDenied) {
                                            window.location.href = "/Project_SWP/LoginComServlet"; // Đăng nhập bằng company
                                        }
                                    });
                                }
        </script>
    </body>

</html>
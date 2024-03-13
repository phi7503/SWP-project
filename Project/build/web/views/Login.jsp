<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Log in</title>
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
                                    <img src="link_to_your_logo_image" alt="Logo" style="max-height: 100px;"> <!-- logo -->
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
                            <a class="navbar-brand" href="#">Home</a>
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
                                            <li><a class="dropdown-item" href="#">Category 1</a></li>
                                            <li><a class="dropdown-item" href="#">Category 2</a></li>
                                            <li><a class="dropdown-item" href="#">Category 3</a></li>
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
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-3">
                                                <label for="minSalary">Min Salary:</label>
                                                <input type="range" class="form-range" id="minSalary" min="0" max="100000"
                                                       step="1000">
                                            </div>
                                            <div class="mb-3">
                                                <label for="maxSalary">Max Salary:</label>
                                                <input type="range" class="form-range" id="maxSalary" min="0" max="100000"
                                                       step="1000">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
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
                            <input type="text" class="form-control form-control-dark" placeholder="Search...">
                        </div>

                        <div class="col-1 d-flex align-items-center justify-content-center rounded-end">
                            <button class="btn btn-primary">Search</button>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col">
                            <form action="LoginServlet" method="post"> <table>
                                    <tbody>
                                        <tr>
                                            <td>Username:</td>
                                            <td><input type="text" name="txtUsername" value="" /><br/></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input type="password" name="txtPassword" value="" /><br/> </td>
                                        </tr>
                                        <tr>
                                            <td><input type="submit" value="Login" name="btAction1" /></td>
                                            <td> <%
                        // Check for the error message attribute
                        String errorMessage = (String) request.getAttribute("errorMessage");

                        if (errorMessage != null) {
                            out.println("<p style='color: red;'>" + errorMessage + "</p>");
                        }
                                                %></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                            <a href="/Project_SWP/SignUpController">Don't have account?</a><br/>
                            <a href="/Project_SWP/ForgotPasswordController">Forgot password?</a><br/>
                            <a href="index.html">Back to Home Page.</a>

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



    </body>

</html>
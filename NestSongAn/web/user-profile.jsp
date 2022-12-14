<%-- 
    Document   : contact-us
    Created on : Sep 27, 2022, 12:42:20 PM
    Author     : thangbv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Profile</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">

        <link rel="stylesheet" href="css/sweetalertAccWarning.css">
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!-- Start Main Top -->
        <div class="main-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="custom-select-box">
                            <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
                                <option>$ VND</option>
                            </select>
                        </div>
                        <div class="right-phone-box">
                            <p>Hotline :- <a href="#"> +87378873548</a></p>
                        </div>
                        <c:set var="checkLogin" scope="session" value="${sessionScope.LOGIN_USER}"/>
                        <c:if test="${checkLogin != null}">
                            <div class="our-link">
                                <ul>
                                    <li><a href="my-account.jsp"><i class="fa fa-user s_color"></i> ${sessionScope.LOGIN_USER.fullName}</a></li>
                                    <li><a href="https://facebook.com/NestSongAnSWP" target="_blank"><i class="fas fa-headset"></i> Li??n h???</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="login-box">

                                <a href="MainController?btAction=Logout" style="color: #FFFFFF;font-size: 14px;font-weight: 700;text-transform: uppercase">Logout <i class="fas fa-sign-out-alt"></i></a>
                            </div>
                        </c:if>
                        <c:if test="${checkLogin == null}" >
                            <div class="our-link">
                                <ul>
                                    <li>
                                        <button id="swa" style="color: white; background-color: black; text-transform: uppercase; font-weight: bold">
                                            <i class="fa fa-user s_color"></i> 
                                            T??i kho???n
                                        </button>
                                    </li>
                                    <li><a href="https://facebook.com/NestSongAnSWP" target="_blank"><i class="fab fa-facebook"></i> Facebook</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="login-box" style="margin-right: 20px">
                                <a href="login.jsp" style="color: white;font-weight: bold">????ng nh???p/</a>
                                <a href="register.jsp" style="color: white; position: absolute;font-weight: bold">????ng k??</a>
                                <!--                            <select id="basic" class="selectpicker show-tick form-control" data-placeholder="Sign In">
                                                                <option>????ng k??</option>
                                                                <option>????ng nh???p</option>
                                                            </select>-->
                            </div>
                        </c:if>
                        <div class="text-slid-box">
                            <div id="offer-box" class="carouselTicker">
                                <ul class="offer-box">
                                    <li>
                                        <i class="fab fa-opencart"></i> Ch??o m???ng NestSongAn
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> ??? ????y ch??ng t??i c?? c??c lo???i y???n s??o
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Gi???m gi?? 10%! ?????i v???i y???n th??
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Gi???m gi?? 5%! ?????i v???i y???n d???ng l???
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Main Top -->

        <!-- Start Main Top -->
        <header class="main-header">
            <!-- Start Navigation -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
                <div class="container">
                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="index.jsp"><img src="images/logo.png" class="logo" alt=""></a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                            <li class="nav-item active"><a class="nav-link" href="index.jsp">Trang ch???</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.jsp">Gi???i thi???u</a></li>
                            <li class="dropdown">
                                <a href="ViewProductController" class="nav-link">S???n ph???m</a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="ViewListBlogController">Blog</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact-us.jsp">Li??n h???</a></li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->

                    <!-- Start Atribute Navigation -->
                    <div class="attr-nav">
                        <ul>
                            <li class="side-menu">
                                <a href="cart.jsp">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span class="badge">${sessionScope.QUANTITY_IN_CART}</span>
                                    <p>Gi??? h??ng</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- End Atribute Navigation -->
                </div>
                <!-- Start Side Menu -->
                <!--      <div class="side">
                          <a href="#" class="close-side"><i class="fa fa-times"></i></a>
                          <li class="cart-box">
                              <ul class="cart-list">
                                  <li>
                                      <a href="#" class="photo"><img src="images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
                                      <h6><a href="#">Delica omtantur </a></h6>
                                      <p>1x - <span class="price">$80.00</span></p>
                                  </li>
                                  <li>
                                      <a href="#" class="photo"><img src="images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
                                      <h6><a href="#">Omnes ocurreret</a></h6>
                                      <p>1x - <span class="price">$60.00</span></p>
                                  </li>
                                  <li>
                                      <a href="#" class="photo"><img src="images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
                                      <h6><a href="#">Agam facilisis</a></h6>
                                      <p>1x - <span class="price">$40.00</span></p>
                                  </li>
                                  <li class="total">
                                      <a href="#" class="btn btn-default hvr-hover btn-cart">Gi??? h??ng</a>
                                      <span class="float-right"><strong>Total</strong>: $180.00</span>
                                  </li>
                              </ul>
                          </li>
                      </div> -->
                <!-- End Side Menu -->
            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Main Top -->

        <!-- Start Top Search -->
        <!-- <div class="top-search">
             <div class="container">
                 <div class="input-group">
                     <span class="input-group-addon"><i class="fa fa-search"></i></span>
                     <input type="text" class="form-control" placeholder="Search">
                     <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                 </div>
             </div>
         </div> -->
        <!-- End Top Search -->

        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Th??ng tin t??i kho???n</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Trang ch???</a></li>
                            <li class="breadcrumb-item active"> Li??n h??? </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Contact Us  -->
        <div class="contact-box-main">
            <div class="container">
                <div class="row">

                    <div class="col-lg-8 col-sm-12">
                        <div class="contact-form-right">
                            <form action="MainController">
                                <c:set var="errors" value="${requestScope.INSERT_CONTACT_ERRORS}"/>
                                <c:set var="successMsg" value="${requestScope.INSERT_UPDATE_ACCOUNT_SUCCESS}"/>
                                <c:if test="${not empty successMsg}">
                                    <div id="msgSubmit" class="h3 text-center hidden">${successMsg}</div>
                                </c:if>
                                <div class="row">
                                    <c:if test="${checkLogin == null}">
                                        <div id="msgSubmit" class="h3 text-center hidden">B???n c???n ph???i ????ng nh???p ho???c ????ng k?? ????? s??? d???ng t??nh n??ng n??y</div>
                                    </c:if>

                                    <c:if test="${checkLogin != null}">
                                        <input id="userId" type="hidden" name="userId" value="${sessionScope.LOGIN_USER.userId}" />
                                        <input id="password" type="hidden" name="password" value="${sessionScope.LOGIN_USER.password}"/>
                                        <input id="userName" type="hidden" name="userName" value="${sessionScope.LOGIN_USER.userName}"/>
                                        <input id="roleId" type="hidden" name="roleId" value="${sessionScope.LOGIN_USER.roleId}"/>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <h2>Username: </h2>
                                                <input  class="form-control" id="username" type="text" name="userName" value="${sessionScope.LOGIN_USER.userName}" readonly/>
                                                <div class="help-block with-errors"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <h2> H??? v?? t??n: </h2>
                                                <input type="text" class="form-control" id="name" name="userFullName" placeholder="H??? T??n" value="${sessionScope.LOGIN_USER.fullName}" />
                                                <div class="help-block with-errors"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <h2>Email:</h2>
                                                <input type="email" placeholder="Email" id="email" value="${sessionScope.LOGIN_USER.email}" class="form-control" name="userEmail" />
                                                <div class="help-block with-errors"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <h2>S??? ??i???n tho???i:</h2>
                                                <input type="tel" class="form-control" id="phone" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" value="${sessionScope.LOGIN_USER.phone}" name="userPhone" placeholder="S??? ??i???n Tho???i" />
                                                <div class="help-block with-errors"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <h2>?????a ch??? giao h??ng:</h2>                                                
                                                <input type="text" class="form-control" id="address" value="${sessionScope.LOGIN_USER.address}" name="userAddress" placeholder="?????a ch??? giao h??ng" />
                                                <div class="help-block with-errors"></div>
                                            </div>
                                            <c:if test="${not empty errors.emailAndPhoneErr}">
                                                <div id="msgSubmit" class="h3 text-center hidden">${errors.emailAndPhoneErr}</div>
                                            </c:if>
                                            <c:if test="${not empty errors.nameErr}">
                                                <div id="msgSubmit" class="h3 text-center hidden">${errors.nameErr}</div>
                                            </c:if>


                                            <div class="submit-button text-center">                                               
                                                <button class="btn hvr-hover" id="submit" value="UpdateProfile" name="btAction" type="submit">C???p nh???t th??ng tin</button>
                                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </form>
                        </div>
                    </div>
                    <c:if test="${checkLogin != null}">
                        <div class="col-lg-4 col-sm-12">
                            <img class="rounded-circle border p-1" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRWyuu0DuWwHd1o25ckVO098q3TDZtGC7EP4MCRpIu7cZ83PeS5pey8jp2jD5x1jTs6EI&usqp=CAU" alt="Generic placeholder image">
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- End Cart -->


        <!-- Start Footer  -->
        <footer>
            <div class="footer-main">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-top-box">
                                <h3>Gi??? l??m vi???c</h3>
                                <ul class="list-time">
                                    <li>Th??? hai - Th??? S??u: 08.00am to 05.00pm</li> <li>Th??? b???y - Ch??? nh???t: 10.00am to 08.00pm</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-top-box">
                                <h3>Li??n h???</h3>
                                <form class="newsletter-box">
                                    <div class="form-group">
                                        <input class="" type="email" name="Email" placeholder="Email Address*" />
                                        <i class="fa fa-envelope"></i>
                                    </div>
                                    <button class="btn hvr-hover" type="submit">Nh???p</button>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-top-box">
                                <h3>M???ng x?? h???i</h3>
                                <p>C??c m???ng x?? h???i ch??ng t??i ??ang s??? d???ng</p>
                                <ul>
                                    <li><a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-widget">
                                <h4>TH??ng tin v??? NestSongAn</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> 
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> 							
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-link">
                                <h4>Information</h4>
                                <ul>
                                    <li><a href="#">Gi???i thi???u</a></li>
                                    <li><a href="#">H?????ng d???n mua h??ng</a></li>

                                    <li><a href="#">Ch??nh s??ch b???o m???t</a></li>
                                    <li><a href="#">Th??ng tin v???n chuy???n</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-link-contact">
                                <h4>Li??n h??? v???i ch??ng t??i</h4>
                                <ul>
                                    <li>
                                        <p><i class="fas fa-map-marker-alt"></i>Address: 90 Nguy???n T???t Th??nh <br>Ph?????ng 13, Qu???n 4,<br> TP. H??? Ch?? Minh </p>
                                    </li>
                                    <li>
                                        <p><i class="fas fa-phone-square"></i>??i???n tho???i: <a href="tel:+1-888705770">870378873548</a></p>
                                    </li>
                                    <li>
                                        <p><i class="fas fa-envelope"></i>Email: <a href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer  -->

        <!-- Start copyright  -->
        <div class="footer-copyright">
            <p class="footer-company">All Rights Reserved. &copy; 2022 <a href="#">NestSongAn</a> Design By :
                <a href="https://html.design/">Team1SWP</a></p>
        </div>
        <!-- End copyright  -->

        <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

        <!-- ALL JS FILES -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/jquery.superslides.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/inewsticker.js"></script>
        <script src="js/bootsnav.js."></script>
        <script src="js/images-loded.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/baguetteBox.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/sweetalert.min.js"></script>
        <script src="js/sweetalertAccWarning.js"></script>
    </body>

</html>

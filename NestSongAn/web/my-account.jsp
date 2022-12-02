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
        <title>Account</title>
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
                                    <li><a href="https://facebook.com/NestSongAnSWP" target="_blank"><i class="fas fa-headset"></i> Liên hệ</a></li>
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
                                            Tài khoản
                                        </button>
                                    </li>
                                    <li><a href="https://facebook.com/NestSongAnSWP" target="_blank"><i class="fab fa-facebook"></i> Facebook</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="login-box" style="margin-right: 20px">
                                <a href="login.jsp" style="color: white;font-weight: bold">Đăng nhập/</a>
                                <a href="register.jsp" style="color: white; position: absolute;font-weight: bold">Đăng ký</a>
                                <!--                            <select id="basic" class="selectpicker show-tick form-control" data-placeholder="Sign In">
                                                                <option>Đăng ký</option>
                                                                <option>Đăng nhập</option>
                                                            </select>-->
                            </div>
                        </c:if>
                        <div class="text-slid-box">
                            <div id="offer-box" class="carouselTicker">
                                <ul class="offer-box">
                                    <li>
                                        <i class="fab fa-opencart"></i> Chào mừng NestSongAn
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Ở đây chúng tôi có các loại yến sào
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Giảm giá 10%! đối với yến thô
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Giảm giá 5%! đối với yến dạng lọ
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
                            <li class="nav-item active"><a class="nav-link" href="index.jsp">Trang chủ</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.jsp">Giới thiệu</a></li>
                            <li class="dropdown">
                                <a href="ViewProductController" class="nav-link">Sản phẩm</a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="ViewListBlogController">Blog</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact-us.jsp">Liên hệ</a></li>
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
                                    <p>Giỏ hàng</p>
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
                                      <a href="#" class="btn btn-default hvr-hover btn-cart">Giỏ hàng</a>
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

        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->

        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Tài khoản</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Của hàng</a></li>
                            <li class="breadcrumb-item active">Tài khoản</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start My Account  -->
        <div class="my-account-box-main">
            <div class="container">
                <form action="MainController">   
                    <input id="userId" type="hidden" name="userId" value="${sessionScope.LOGIN_USER.userId}" />
                    <div class="my-account-page">
                        <div id="msgSubmit" class="h3 text-center hidden">Xin chào ${checkLogin.fullName}</div>
                        <div class="row">
                            <div class="col-lg-4 col-md-12">
                                <div class="account-box">
                                    <div class="service-box">                                    
                                        <div class="service-icon">    
                                                <a href="user-profile.jsp"><i class="fa fa-gift"></i></a>
                                        </div>
                                        <div class="service-desc">
                                              <a href="user-profile.jsp"><h4>Thông tin tài khoản</h4></a>
                                            <p>Tên, địa chỉ, email, số điện thoại.</p>
                                        </div>                                    
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="account-box">
                                    <div class="service-box">
                                        <div class="service-icon">
                                            <a href="change-password.jsp"><i class="fa fa-lock"></i> </a>
                                        </div>
                                        <div class="service-desc">
                                            <a href="change-password.jsp"> <h4>Đăng nhập &amp; bảo mật </h4></a>
                                            <p>Thay đổi mật khẩu</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-12">
                                <div class="account-box">
                                    <div class="service-box">
                                        <div class="service-icon">
                                            <a href="#"> <i class="fa fa-location-arrow"></i> </a>
                                        </div>
                                        <div class="service-desc">
                                            <h4>Địa chỉ</h4>
                                            <p>Cài đặt địa chỉ nhận hàng</p>
                                        </div>
                                    </div>
                                </div>
                            </div>                        
                            <div class="col-lg-4 col-md-12">
                                <div class="account-box">
                                    <div class="service-box">
                                        <div class="service-icon">
                                            <a href="#"> <i class="fa fa-credit-card"></i> </a>
                                        </div>
                                        <div class="service-desc">
                                            <h4>Phương thức thanh toán</h4>
                                            <p>Cài đặt và tuỳ chỉnh phương thức thanh toán</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--
                                                    <div class="col-lg-4 col-md-12">
                                                        <div class="account-box">
                                                            <div class="service-box">
                                                                <div class="service-icon">
                                                                    <a href="#"> <i class="fab fa-paypal"></i> </a>
                                                                </div>
                                                                <div class="service-desc">
                                                                    <h4>PayPal</h4>
                                                                    <p>Xem các lợi ích và cài đặt thanh toán</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-12">
                                                        <div class="account-box">
                                                            <div class="service-box">
                                                                <div class="service-icon">
                                                                    <a href="#"> <i class="fab fa-amazon"></i> </a>
                                                                </div>
                                                                <div class="service-desc">
                                                                    <h4>Amazon Pay balance</h4>
                                                                    <p>Nạp tiền vào số dứ</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>-->
                        </div>
                        <!--                    <div class="bottom-box">
                                                <div class="row">-->
                        <!--                            <div class="col-lg-4 col-md-12">
                                                        <div class="account-box">
                                                            <div class="service-box">
                                                                <div class="service-desc">
                                                                    <h4>Gold &amp; Diamond Jewellery</h4>
                                                                    <ul>
                                                                        <li> <a href="#">Apps and more</a> </li>
                                                                        <li> <a href="#">Content and devices</a> </li>
                                                                        <li> <a href="#">Music settings</a> </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>-->
                        <!--                            <div class="col-lg-4 col-md-12">
                                                        <div class="account-box">
                                                            <div class="service-box">
                                                                <div class="service-desc">
                                                                    <h4>Handloom &amp; Handicraft Store</h4>
                                                                    <ul>
                                                                        <li> <a href="#">Advertising preferences </a> </li>
                                                                        <li> <a href="#">Communication preferences</a> </li>
                                                                        <li> <a href="#">SMS alert preferences</a> </li>
                                                                        <li> <a href="#">Message center</a> </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>-->
                        <!--                            <div class="col-lg-4 col-md-12">
                                                        <div class="account-box">
                                                            <div class="service-box">
                                                                <div class="service-desc">
                                                                    <h4>The Designer Boutique</h4>
                                                                    <ul>
                                                                        <li> <a href="#">Amazon Pay</a> </li>
                                                                        <li> <a href="#">Bank accounts for refunds</a> </li>
                                                                        <li> <a href="#">Coupons</a> </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-12">
                                                        <div class="account-box">
                                                            <div class="service-box">
                                                                <div class="service-desc">
                                                                    <h4>Hộp quà tặng, Thẻ quà tặng, Thiệp chúc mừng</h4>
                                                                    <ul>
                                                                        <li> <a href="#">Phản hồi</a> </li>
                                                                        <li> <a href="#">Danh sách</a> </li>
                                                                        <li> <a href="#">Ảnh giấy tờ tuỳ thân</a> </li>
                                                                        <li> <a href="#">Hồ sơ</a> </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-12">
                                                        <div class="account-box">
                                                            <div class="service-box">
                                                                <div class="service-desc">
                                                                    <h4>Các tài khoản khác</h4>
                                                                    <ul>
                                                                        <li> <a href="#">Dịch vụ web của Amazon</a> </li>
                                                                        <li> <a href="#">Đăng nhập bằng Amazon</a> </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-12">
                                                        <div class="account-box">
                                                            <div class="service-box">
                                                                <div class="service-desc">
                                                                    <h4>Các chương trình mua sắm và cho thuê</h4>
                                                                    <ul>
                                                                        <li> <a href="#">Đăng ký theo dõi &amp; lưu</a> </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>-->
                        <!--                        </div>
                                            </div>-->
                    </div>
                </form>
            </div>
        </div>
        <!-- End My Account -->



        <!-- Start Footer  -->
        <footer>
            <div class="footer-main">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-top-box">
                                <h3>Giờ làm việc</h3>
                                <ul class="list-time">
                                    <li>Thứ hai - Thứ Sáu: 08.00am to 05.00pm</li> <li>Thứ bảy - Chủ nhật: 10.00am to 08.00pm</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-top-box">
                                <h3>Liên hệ</h3>
                                <form class="newsletter-box">
                                    <div class="form-group">
                                        <input class="" type="email" name="Email" placeholder="Email Address*" />
                                        <i class="fa fa-envelope"></i>
                                    </div>
                                    <button class="btn hvr-hover" type="submit">Nhập</button>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-top-box">
                                <h3>Mạng xã hội</h3>
                                <p>Các mạng xã hội chúng tôi đang sử dụng</p>
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
                                <h4>THông tin về NestSongAn</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> 
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> 							
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-link">
                                <h4>Information</h4>
                                <ul>
                                    <li><a href="#">Giới thiệu</a></li>
                                    <li><a href="#">Hướng dẫn mua hàng</a></li>

                                    <li><a href="#">Chính sách bảo mật</a></li>
                                    <li><a href="#">Thông tin vận chuyển</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-link-contact">
                                <h4>Liên hệ với chúng tôi</h4>
                                <ul>
                                    <li>
                                        <p><i class="fas fa-map-marker-alt"></i>Address: 90 Nguyễn Tất Thành <br>Phường 13, Quận 4,<br> TP. Hồ Chí Minh </p>
                                    </li>
                                    <li>
                                        <p><i class="fas fa-phone-square"></i>Điện thoại: <a href="tel:+1-888705770">870378873548</a></p>
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
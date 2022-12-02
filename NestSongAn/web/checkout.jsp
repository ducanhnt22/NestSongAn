<%-- 
    Document   : checkout
    Created on : Sep 27, 2022, 12:41:30 PM
    Author     : thangbv
--%>

<%@page import="product.ProductDTO"%>
<%@page import="order.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Check out</title>
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
        <style>
            .checkout-btn-swp{           
                margin-left: 434px;            
                border: none;
                background: #B0B435;
                color: #FFFFFF;
                font-size: 18px;
                padding: 8px 20px; 
                cursor: pointer
            }
            .checkout-btn-swp:hover{
                background: #000000;
            }
        </style>

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
                            <li class="nav-item"><a class="nav-link" href="index.jsp">TRANG CHỦ</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.jsp">GIỚI THIỆU</a></li>
                            <li class="dropdown active">
                                <a href="ViewProductController" class="nav-link">Sản phẩm</a>                               
                            </li>
                            <li class="nav-item"><a class="nav-link" href="ViewListBlogController">BLOG</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact-us.jsp">LIÊN HỆ</a></li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->

                    <!-- Start Atribute Navigation -->
                    <div class="attr-nav">
                        <ul>
                            <li class="side-menu"><a href="#">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span class="badge">${sessionScope.QUANTITY_IN_CART}</span>
                                    <p>Giỏ hàng</p>
                                </a></li>
                        </ul>
                    </div>
                    <!-- End Atribute Navigation -->
                </div>             
            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Main Top -->
        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Thanh Toán</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="ViewProductController">Cửa Hàng</a></li>
                            <li class="breadcrumb-item active">Thanh Toán</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Cart  -->
        <div class="cart-box-main">
            <div class="container">                
                <div class="row">
                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="checkout-address">
                            <div class="title-left">
                                <h3>Thông tin liên lạc</h3>
                            </div>
                            <form class="needs-validation" action="MainController">                               
                                <div class="mb-3">
                                    <label for="username">Họ và tên</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="username" name="name" value="${sessionScope.LOGIN_USER.fullName}" required>                                                
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="email">Địa chỉ</label>
                                    <input type="text" class="form-control" id="email" name="address" value="${sessionScope.LOGIN_USER.address}" required>                                  
                                </div>
                                <div class="mb-3">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${sessionScope.LOGIN_USER.email}" required>
                                </div>
                                <div class="mb-3">
                                    <label for="address">Số điện thoại</label>
                                    <input type="number" class="form-control" id="address" name="phone" value="${sessionScope.LOGIN_USER.phone}" required >                                 
                                </div>
                                <hr class="mb-4">

                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="save-info" name="save">
                                    <label class="custom-control-label" for="save-info">Lưu lại thông tin cho lần mua sau</label>
                                </div>    


                        </div>
                    </div>

                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="row">                                                   
                            <%
                                Cart cart = (Cart) session.getAttribute("CART");
                                if (cart != null) {
                            %>
                            <div class="col-md-12 col-lg-12">
                                <div class="odr-box">
                                    <div class="title-left">
                                        <h3>Giỏ Hàng</h3>
                                    </div>
                                    <%
                                        int total = 0;
                                        for (ProductDTO tea : cart.getCart().values()) {
                                            total += tea.getPrice() * tea.getQuantity();
                                    %>
                                    <div class="rounded p-2 bg-light" style="margin-top: -16px;">
                                        <div class="media mb-2 border-bottom">
                                            <div class="media-body"> <a href="shop-detail.jsp"><%= tea.getName()%></a>
                                                <div class="small text-muted">Price: 
                                                    <c:set var="pri" value="<%= tea.getPrice()%>"/>
                                                    <fmt:setLocale value="vi_VN"/>
                                                    <fmt:formatNumber value="${pri}" type="currency"/>
                                                    <span class="mx-2">|</span> Qty: <%= tea.getQuantity()%>
                                                    <span class="mx-2">|</span>
                                                    <c:set var="totalPri" value="<%= tea.getQuantity() * tea.getPrice()%>"/>
                                                    <fmt:setLocale value="vi_VN"/>
                                                    <fmt:formatNumber value="${totalPri}" type="currency"/></div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-12">
                                <div class="order-box">
                                    <div class="title-left">
                                        <h3>Hóa Đơn</h3>
                                    </div>                                 
                                    <div class="d-flex">
                                        <div class="font-weight-bold">Sản phẩm</div>
                                        <div class="ml-auto font-weight-bold">Tổng tiền</div>
                                    </div>
                                    <hr class="my-1">                                                                      

                                    <div class="d-flex gr-total">
                                        <h5>Tổng Cộng</h5>
                                        <div class="ml-auto h5">
                                            <c:set var="totalPri" value="<%= total%>"/>
                                            <fmt:setLocale value="vi_VN"/>
                                            <fmt:formatNumber value="${totalPri}" type="currency"/></div>
                                        <input type="hidden" name="total" value="<%= total%>">
                                    </div>
                                    <hr> </div>
                            </div>
                            <%
                                }
                            %>
                            <button type="submit" class="checkout-btn-swp" name="btAction" value="SaveInfo">Thanh Toán</button>
                            </form>
                        </div>
                    </div>
                </div>
                <!--<div class="col-12 d-flex shopping-box"> <a href="checkout2.jsp" class="ml-auto btn hvr-hover">Thanh Toán</a> </div>-->
            </div>
        </div>
        <!-- End Cart -->

        <!-- Start Instagram Feed  -->
        <div class="instagram-box">
            <div class="main-instagram owl-carousel owl-theme">
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-01.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-02.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-03.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-04.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-05.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-06.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-07.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-08.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-09.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="ins-inner-box">
                        <img src="images/instagram-img-05.jpg" alt="" />
                        <div class="hov-in">
                            <a href="#"><i class="fab fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Instagram Feed  -->


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
            <p class="footer-company">All Rights Reserved. &copy; 202   2 <a href="#">NestSongAn</a> Design By :
                <a href="#">Team1SWP</a></p>
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
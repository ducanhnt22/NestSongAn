<%-- 
    Document   : checkout
    Created on : Sep 27, 2022, 12:41:30 PM
    Author     : thangbv
--%>

<%@page import="product.ProductDTO"%>
<%@page import="order.Cart"%>
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
            .paypal-btn-action{
                display: none;
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
                            <li class="side-menu"><a href="checkout.jsp">
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
                            <div class="title" style="border-bottom: 3px solid #000000;
                                 ">
                                <h3 style="font-size:18px;color:#1F1F1F;font-weight:700">Phương thức thanh toán</h3>
                            </div>
                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked onchange="hidePayPal()" required>
                                    <label class="custom-control-label" for="credit">Thanh toán khi nhận hàng</label>
                                </div>
<!--                                <div class="custom-control custom-radio">
                                    <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" onchange="showPayPal()" required>
                                    <label class="custom-control-label" for="paypal">PayPal</label>
                                </div>-->
                            </div>
                            <div id="paypal-button-container" class="paypal-btn-action"></div>



                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-6 mb-3">
                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <div class="shipping-method-box">
                                    <div class="title-left">
                                        <h3>Phương thức vận chuyển</h3>
                                    </div>
                                    <div class="mb-4">
                                        <div class="custom-control custom-radio">
                                            <input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio" onchange="shippingFee()" value="free">
                                            <label class="custom-control-label" for="shippingOption1">Giao hàng truyền thống</label> <span class="float-right font-weight-bold" >FREE</span> 
                                        </div>
                                        <div class="ml-4 mb-2 small">(1-2 ngày)</div>
                                        <div class="custom-control custom-radio">
                                            <input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio" value="fee" onchange="shippingFee()" >
                                            <span style="float: right">VND</span>
                                            <label class="custom-control-label" for="shippingOption2">Giao hàng nhanh</label> <span class="float-right font-weight-bold" >${requestScope.SHIPPING_FEE}</span>

                                        </div>
                                        <div class="ml-4 mb-2 small">(Giao ngay trong ngày đặt hàng)</div>
                                    </div>
                                </div>
                            </div>       
                            <!--<button type="submit" style="position: relative;bottom: -390px; z-index: 1">Thanh Toán</button>-->
                            </form>
                            <%
                                Cart cart = (Cart) session.getAttribute("CART");
                                if (cart != null) {
                            %>
                            <!--                            <div class="col-md-12 col-lg-12">
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
                                        <div class="small text-muted">Price: <%= tea.getPrice()%> VND<span class="mx-2">|</span> Qty: <%= tea.getQuantity()%><span class="mx-2">|</span> <%= tea.getQuantity() * tea.getPrice()%> VND</div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>-->
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
                                    <div class="d-flex">
                                        <h4>Phí giao hàng</h4>
                                        <div class="ml-auto font-weight-bold"> Free </div>
                                    </div>
                                    <hr>
                                    <div class="d-flex gr-total">
                                        <h5>Tổng Cộng</h5>
                                        <div class="ml-auto h5" id="shipfee"> <%= total%> VND</div>
                                    </div>
                                    <hr> </div>
                            </div>
                            <form action="MainController">
                                <input type="hidden" name="phone" value="${sessionScope.LOGIN_USER.phone}">
                                <input type="hidden" name="name" value="${sessionScope.LOGIN_USER.fullName}">
                                <input type="hidden" name="total_money" id="total-money" value="<%= total%>">
                                <input type="hidden" name="shipping_fee" value="${requestScope.SHIPPING_FEE}">
                                <input type="hidden" name="total" value="<%= total%>">
                                <input type="hidden" name="userId" value="${sessionScope.LOGIN_USER.userId}">
                                <input type="hidden" name="address" value="${sessionScope.LOGIN_USER.address}">
                                <input type="hidden" name="status" value="Đang chuẩn bị hàng">
                                <div class="col-12 d-flex shopping-box">
                                    <button type="submit" name="btAction" value="Purchase" class="ml-auto btn hvr-hover" style="overflow: hidden; padding: 10px 20px; border: none; color: #ffffff; font-size: 18px;right: -423px;">Thanh toán</button>
                                </div>
                            </form>
                            <!--<div class="col-12 d-flex shopping-box"> <a href="PurchaseController" class="ml-auto btn hvr-hover">Thanh Toán</a> </div>-->
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--        <div>
                    <div class="notifi">
                        <h2>mua thanh cong</h2>
        
                    </div>
                </div>-->
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
        <!--<script src="https://www.paypal.com/sdk/js?client-id=AZ0BFLApbe72nrP6TuqCz63AR0Vg5CJqpJGz_v4qRtEhaIlfzyiXhXxFnxdgPHKN57QWs18IYiazKBnT" data-namespace="paypal_sdk"></script>-->
        <script>
//                                                const money = parseInt(document.getElementById('shipfee').textContent)*0.00004
//            console.log(money)
//                                               
//                                               const tien=1100
//                                                
//                                                paypal_sdk.Buttons({
//                                                    createOrder: function (data, actions) {
//                                                        return actions.order.create({
//                                                            purchase_units: [{"amount": {"currency_code": "USD", "value": money}}]
//                                                        }
//                                                        );
//                                                    },
//
//                                                    onApprove: function (data, actions) {
//                                                        return actions.order.capture().then(function (orderData) {
//
//                                                            // Full available details
////                                                            console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
//
//                                                            // Show a success message within this page, e.g.
////                                                            const element = document.getElementById('paypal-button-container');
////                                                            element.innerHTML = '';
////                                                            element.innerHTML = '<h3>Thank you for your payment!</h3>';
//
////                                                              actions.redirect('MainController?btAction=Purchase');
//                                                            window.location.replace("MainController");
//
//                                                        });
//                                                    },
//
////                                                    onError: function (err) {
////                                                        console.log(err);
////                                                    }
//                                                }).render('#paypal-button-container');
//
//                                                function showPayPal() {
//                                                    const paypal = document.getElementById('paypal')
//                                                    if (paypal.checked) {
//                                                        document.getElementById('paypal-button-container').style.display = 'block'
//                                                    }
//                                                }
//                                                function hidePayPal() {
//                                                    const credit = document.getElementById('credit')
//                                                    if (credit.checked) {
//                                                        document.getElementById('paypal-button-container').style.display = 'none'
//                                                    }
//                                                }

                                                function shippingFee() {
                                                    const shipFee = document.getElementById('shipfee').textContent;
                                                    if (document.getElementById('shippingOption2').checked) {
                                                        const fee = parseInt(shipFee) * 1.01
                                                        document.getElementById('shipfee').innerHTML = fee;
                                                        document.getElementById("total-money").value = fee;
                                                    } else {
                                                        const res = document.getElementById('shipfee').textContent;
                                                        const x = parseInt(res) / 1.01;
                                                        document.getElementById('shipfee').textContent = x;
                                                    }
                                                    if (document.getElementById('shippingOption1').checked) {
                                                        const a = parseInt(shipFee) / 1.01;

                                                        document.getElementById("total-money").value = a;
                                                    }
                                                }

        </script>
    </body>

</html>
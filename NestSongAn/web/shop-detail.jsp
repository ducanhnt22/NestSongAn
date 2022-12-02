<%-- 
Document   : shop-detail
Created on : Sep 27, 2022, 12:46:37 PM
Author     : thangbv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Product</title>
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
            .swp-btn{
                /*width: 94px;*/
                background: #b0b435;
                border: none;
                cursor: pointer;
                padding: 10px 20px;
                color: #ffffff;    
                font-weight: 700;
                outline: none;
            }
            .swp-btn:hover{
                background: #000000;
            }
            .swp-btn-cart{
                cursor: pointer;
                padding: 10px 20px;
                font-weight: 700;
                color: #ffffff;
                border: none;
                background: #b0b435;
                outline: none;
            }
            .swp-btn-cart:hover{
                background: #000000;
            }
            .buy-btn{
                border-radius: 50%;
                border: none;
                color: #FFFFFF;
                background: #b0b435;
                cursor: pointer;
                opacity: 0.8;
                width: 32px;
                height: 32px;
                opacity: 0.8;
            }           
            .buy-btn:hover{
                opacity: 1;
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
            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Main Top -->
        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Chi tiết sản phảm</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="ViewProductController">Cửa hàng</a></li>
                            <li class="breadcrumb-item active">Chi tiết sản phẩm</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Shop Detail  -->
        <div class="shop-detail-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-5 col-md-6">
                        <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active"> <img class="d-block w-100" src="${sessionScope.PRODUCT.image}" alt="First slide"> </div>
                                <!--                                <div class="carousel-item"> <img class="d-block w-100" src="images/big-img-02.jpg" alt="Second slide"> </div>
                                                                <div class="carousel-item"> <img class="d-block w-100" src="images/big-img-03.jpg" alt="Third slide"> </div>-->
                            </div>                         
                            <!--                            <ol class="carousel-indicators">
                                                            <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                                                                <img class="d-block w-100 img-fluid" src="images/smp-img-01.jpg" alt="" />
                                                            </li>
                                                            <li data-target="#carousel-example-1" data-slide-to="1">
                                                                <img class="d-block w-100 img-fluid" src="images/smp-img-02.jpg" alt="" />
                                                            </li>
                                                            <li data-target="#carousel-example-1" data-slide-to="2">
                                                                <img class="d-block w-100 img-fluid" src="images/smp-img-03.jpg" alt="" />
                                                            </li>
                                                        </ol>-->
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-7 col-md-6">
                        <div class="single-product-details">
                            <h2>${sessionScope.PRODUCT.name}</h2>
                            <h5>
                                <c:set var="pri" value="${sessionScope.PRODUCT.price}"/>
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${pri}" type="currency"/>
                            </h5>
                            <!--<del>$ 60.00</del>-->
                            <p class="available-stock"><span> More than ${sessionScope.PRODUCT.quantity} available<p>
                                    <h4>Mô tả:</h4>
                                    <p>${sessionScope.PRODUCT.description}</p>
                                    <form action="MainController" >

                                        <ul style="border: none; display: flex;align-items: center">
                                            <li style="width: auto;float: none;padding:0;margin-top: 20px;margin-right: 4px">
                                                <button type="button" class="buy-btn" onclick="subtract()"><i class="fa fa-minus"></i></button>
                                            </li>
                                            <li style="width: auto;float: none;padding:0">
                                                <div class="form-group quantity-box">
                                                    <label class="control-label">Số lượng</label>
                                                    <input class="form-control" value="1" min="1" type="number" name="buyQuantity" readonly="" id="increase">                                                     
                                                </div>
                                            </li>
        <!--                                    <li style="display: flex;height: 91.13px;text-align: center;"><h3 style="padding-bottom: 0px;margin: auto 0;color: red;display: inline">${requestScope.OVER_QUANTITY}</h3></li>-->
                                            <li style="width: auto;float: none;padding:0;margin-top: 20px;margin-left: 4px">
                                                <button type="button" class="buy-btn" onclick="add()"><i class="fa fa-plus" ></i></button>
                                            </li>
                                            <!--                                            <li>
                                                                                            <button type="submit" class="swp-btn" value="BuyNow" name="btAction">Mua Ngay</button> 
                                                                                        </li>-->
                                        </ul>

                                        <!--class="price-box-bar"-->
                                        <div>
                                            <div class="cart-and-bay-btn">
                                                <input type="hidden" name="id" value="${sessionScope.PRODUCT.productId}">
                                                <input type="hidden" name="name" value="${sessionScope.PRODUCT.name}">
                                                <input type="hidden" name="price" value="${sessionScope.PRODUCT.price}">
                                                <input type="hidden" name="img" value="${sessionScope.PRODUCT.image}">
                                                <input type="hidden" name="quantity" value="${sessionScope.PRODUCT.quantity}">
                                                <button type="submit" class="swp-btn" value="BuyNow" name="btAction">Mua Ngay</button>                                    
                                                <button type="submit" class="swp-btn-cart" value="AddToCart" name="btAction">Thêm vào giỏ hàng</button>
                                                <!--<a class="btn hvr-hover" data-fancybox-close="" href="#">Mua liền</a>-->
                                                <!--<a class="btn hvr-hover" data-fancybox-close="" href="#">Thêm vào giỏ hàng</a>-->
                                            </div>                              
                                        </div>
                                    </form>
                                    <!--                            <div class="add-to-btn">
                                                                    <div class="add-comp">
                                                                        <a class="btn hvr-hover" href="#"><i class="fas fa-heart"></i> Add to wishlist</a>
                                                                        <a class="btn hvr-hover" href="#"><i class="fas fa-sync-alt"></i> Add to Compare</a>
                                                                    </div>
                                                                    <div class="share-bar">
                                                                        <a class="btn hvr-hover" href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
                                                                        <a class="btn hvr-hover" href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a>
                                                                        <a class="btn hvr-hover" href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
                                                                        <a class="btn hvr-hover" href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a>
                                                                        <a class="btn hvr-hover" href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a>
                                                                    </div>
                                                                </div>-->
                        </div>
                    </div>
                </div>

                <div class="row my-5">
                    <div class="card card-outline-secondary my-4" style="width:100%">
                        <div class="card-header">
                            <h2>Bình luận về sản phẩm</h2>
                        </div>
                        <form action="MainController">                                 
                            <div class="card-body">    
                                <c:set var="cmt" scope="session" value="${sessionScope.COMMENT_RESULT}"/>
                                <c:if test="${cmt != null}">
                                    <c:forEach items="${cmt}" var="cmtdto">                                
                                        <div class="media mb-3">
                                            <div class="mr-2"> 
                                                <img style="width:74px;height: 74px;object-fit: cover;" class="rounded-circle border p-1" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRWyuu0DuWwHd1o25ckVO098q3TDZtGC7EP4MCRpIu7cZ83PeS5pey8jp2jD5x1jTs6EI&usqp=CAU" alt="Generic placeholder image">
                                            </div>
                                            <div class="media-body">
                                                <p>${cmtdto.comment}</p>
                                                <small class="text-muted">Posted by Anonymous</small>
                                            </div>
                                        </div>
                                        <hr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${cmt == null}">
                                    <p>   Hiện chưa có ai bình luận về sản phẩm này. Hãy là người đầu tiên bình luận</p>
                                    <hr>
                                </c:if>                           
                                <c:if test="${checkLogin != null}">                                
                                    <input type="hidden" name="userIdComment" value="${checkLogin.userId}"/>
                                    <input type="hidden" name="id" value="${sessionScope.PRODUCT.productId}">
                                    <textarea
                                        id="message"
                                        maxlength="500"
                                        name="txtComment"
                                        rows="4"
                                        style="width: -webkit-fill-available;"
                                        class="block p-4 w-full text-sm text-grey-darker bg-gray-200 rounded border border-gray-200 focus:ring-blue-500 focus:border-gray-600 focus:outline-none"
                                        placeholder="Bình luận của bạn..."
                                        required
                                        user            ></textarea>
                                </div>

                                <button class="swp-btn" type="submit" value="CreateComment" name="btAction" style="
                                        width: 140px;
                                        height: 47px;
                                        padding-bottom: -10;
                                        padding-bottom: -10;
                                        padding-bottom: 0px;
                                        border-bottom-width: 200px;
                                        margin-bottom: 20px;
                                        padding-top: 0px;
                                        margin-top: 0px;
                                        padding-left: 0px;
                                        padding-right: 0px;
                                        margin-left: 20px;
                                        margin-right: 0px;
                                        ">
                                    Để lại lời bình luận
                                </button>

                                <div>
                                    <c:if test="${not empty requestScope.COMMENT_SUCCESS}">
                                        <div id="msgSubmit" class="h3 text-center hidden" style="
                                             margin-bottom: 20px;
                                             ">${requestScope.COMMENT_SUCCESS}</div>
                                    </c:if>
                                </div> 
                            </c:if>

                        </form>
                        <div>
                            <c:if test="${checkLogin == null}">                                                            
                                <a  id="swa1" class="swp-btn">
                                    Để lại lời bình luận
                                </a>
                            </c:if>
                        </div>

                    </div>
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
            <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
                <a href="https://html.design/">html design</a></p>
        </div>
        <!-- End copyright  -->

        <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

        <!-- ALL JS FILES -->
        <script>
            document.getElementById('swa1').onclick =
                    function () {
                        swal({
                            title: "Lưu ý!!!",
                            text: "Bạn cần có tài khoản để sử dụng chức năng này!",
                            icon: "warning",
                            buttons: {
                                cancel: "Hủy",
                                login: {
                                    text: "Đăng Nhập",
                                    value: "login",
                                },
                                signup: {
                                    text: "Đăng Ký",
                                    value: "signup",
                                },
                            },
                        })
                                .then((login) => {
                                    switch (login) {

                                        case "login":
                                            window.location = "login.jsp";
                                            break;

                                        case "signup":
                                            window.location = "register.jsp";
                                            break;
                                    }
                                });
                    };
        </script>
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
        <script>
            function add() {
                const x = document.getElementById('increase').value;
                document.getElementById('increase').value = Number(x) + 1;
            }
            function subtract() {
                const x = document.getElementById('increase').value;
                if (x == 1) {
                } else {
                    document.getElementById('increase').value = Number(x) - 1;
                }
            }
        </script>
        <script src="js/sweetalert.min.js"></script>
        <script src="js/sweetalertAccWarning.js"></script>
    </body>

</html>
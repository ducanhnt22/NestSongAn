<%-- 
    Document   : order.jsp
    Created on : Oct 25, 2022, 2:11:18 PM
    Author     : thangbv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <!-- Css -->
        <link rel="stylesheet" href="./dist/styles.css" />
        <link rel="stylesheet" href="./dist/all.css" />
        <link
            href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i"
            rel="stylesheet"
            />
        <title>Admin</title>
        <style>
            @keyframes show-hide {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            .show {
                display: table-row;
            }
            .hide {
                display: none;
            }


            .handModal {
                position: fixed;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                z-index: 1050;
                overflow-x: hidden;
                overflow-y: auto;
                outline: 0;
                display: none;
            }

            .handModal .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: -1;
            }
            @keyframes modal {
                from {
                    transform: translateY(-30%);
                    opacity: 0;
                }
                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }
            .content-animation {
                animation: modal ease-out 0.2s;
            }
        </style>
    </head>

    <body>
        <!--Container -->
        <div class="mx-auto bg-grey-lightest">
            <!--Screen-->
            <div class="min-h-screen flex flex-col">
                <!--Header Section Starts Here-->
                <header class="bg-nav">
                    <div class="flex justify-between">
                        <div class="p-1 mx-3 inline-flex items-center cursor-pointer">
                            <i
                                class="fas fa-bars pr-2 text-white"
                                onclick="sidebarToggle()"
                                ></i>
                            <h1 class="text-white p-2">NestSongAn</h1>
                        </div>
                        <div class="p-1 flex flex-row items-center">
                            <!--              <img
                                            class="inline-block h-8 w-8 rounded-full"
                                            src="https://avatars0.githubusercontent.com/u/4323180?s=460&v=4"
                                            alt=""
                                          />-->
                        </div>
                    </div>
                </header>
                <!--/Header-->

                <div class="flex flex-1">
                    <!--Sidebar-->
                    <aside
                        id="sidebar"
                        class="bg-side-nav w-1/2 md:w-1/6 lg:w-1/6 border-r border-side-nav hidden md:block lg:block"
                        >
                        <div class="flex"></div>
                        <ul class="list-reset flex flex-col">
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a
                                    href="admin.jsp"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fas fa-tachometer-alt float-left mx-2"></i>
                                    Dashboard
                                    <span><i class="fas fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a
                                    href="product.jsp"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                    Sản phẩm
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li
                                class="w-full h-full py-3 px-2 border-b border-light-border bg-white"
                                >
                                <a
                                    href="order.jsp"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fas fa-grip-horizontal float-left mx-2"></i>
                                    Đơn hàng
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a
                                    href="#"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fas fa-table float-left mx-2"></i>
                                    Bình luận
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a
                                    href="GetContact"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fab fa-uikit float-left mx-2"></i>
                                    Liện hệ
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-300-border">
                                <a
                                    href="MainController?btAction=Logout"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fas fa-square-full float-left mx-2"></i>
                                    Đăng xuất
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                        </ul>
                    </aside>
                    <!--/Sidebar-->
                    <!--Main-->
                    <main class="bg-white-500 flex-1 p-3 overflow-hidden">
                        <div class="flex flex-col">
                            <div class="flex flex-1 flex-col md:flex-row lg:flex-row mx-2">
                                <div
                                    class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full"
                                    >
                                    <div
                                        class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b flex justify-between items-center"
                                        >
                                        Chi Tiết Đơn Hàng
                                        <form action="MainController">
                                            <input type="hidden" name="orderId" value="${ID}"/>
                                            <button type="submit" name="btAction" value="ChangeOrderStatusAdminManager" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-2 rounded">Xác nhận đơn hàng</button>
                                        </form>
                                    </div>
                                    <div class="p-3">
                                        <table
                                            class="table-responsive w-full rounded"
                                            style="text-align: center"
                                            >
                                            <thead>
                                                <tr>
                                                    <th class="border w-3/4 px-4 py-2">Tên sản phẩm</th>
                                                    <th class="border w-fit px-4 py-2">Số lượng</th>
                                                    <th class="border w-1/5 px-4 py-2">Giá</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${VIEW_ORDER_DETAIL}" var="o">
                                                    <tr class="row-info" id="order" >
                                                        <td class="border w-3/4 py-2">${o.productName}</td>
                                                        <td class="border w-fit py-2">${o.quantity}</td>
                                                        <td class="border w-1/5 py-2">
                                                            <c:set var="price" value="${o.price}"/>
                                                            <fmt:setLocale value="vi_VN"/>
                                                            <fmt:formatNumber value="${price}" type="currency"/></td>
                                                    </tr>
                                                </c:forEach>
                                                <!--  -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!--/Grid Form-->
                        </div>
                    </main>
                    <!--/Main-->
                </div>
                <!--Footer-->
                <footer class="bg-grey-darkest text-white p-2">
                    <div class="flex flex-1 mx-auto">Nest SongAn</div>
                </footer>
                <!--/footer-->
            </div>
        </div>
        <!--  -->

        <!-- modal -->

        <script src="./main.js"></script>
        <script>

        </script>
    </body>
</html>
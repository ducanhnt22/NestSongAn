<%-- 
    Document   : order.jsp
    Created on : Oct 25, 2022, 2:11:18 PM
    Author     : thangbv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
        <title>Tables | Tailwind Admin</title>
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

            .row-info:hover {
                background-color: rgb(226 232 240);
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
            #add_product_swp:hover{
                background-color: rgb(161 161 170) !important;
                color: #FFFFFF;
            }

            .show-swp{
                display: block;
            }
            .show-swp-icon{
                transform: rotate(90deg)
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
                            <h1 class="text-white p-2">Giao Hàng - NestSongAn</h1>
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

                    <!--Main-->
                    <main class="bg-white-500 flex-1 p-3 overflow-hidden">
                        <div class="flex flex-col">
                            <div class="flex flex-1 flex-col md:flex-row lg:flex-row mx-2">
                                <div
                                    class="mb-2 border-solid border-gray-300 rounded border shadow-sm w-full"
                                    >
                                    <div
                                        class="bg-gray-200 px-2 py-3 border-solid border-gray-200 border-b"
                                        >
                                        Giao hàng
                                    </div>
                                    <div class="p-3">
                                        <table
                                            class="table-responsive w-full rounded"
                                            style="text-align: center"
                                            >
                                            <thead>
                                                <tr>
                                                    <th class="border w-1/6 px-4 py-2">Tên người nhận</th>
                                                    <th class="border w-1/4 px-4 py-2">Địa chỉ</th>
                                                    <th class="border w-1/6 px-4 py-2">Số điện thoại</th>
                                                    <th class="border w-1/5 px-4 py-2">Tổng hóa đơn</th>
                                                    <th class="border w-1/12 px-4 py-2">Xác nhận</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${VIEW_ORDER_SHIPPER_VER_FULL}" var="o">
                                                    <tr class="cursor-pointer row-info" id="order" data-href="MainController?btAction=ViewOrderDetailShipperManager&id=${o.orderId}">
                                                        <td class="border w-1/6 py-2">${o.receiver}</td>
                                                        <td class="border w-1/4 py-2">${o.address}</td>
                                                        <td class="border w-1/6 py-2">${o.phone}</td>
                                                        <td class="border w-1/5 py-2">
                                                            <c:set var="total" value="${o.total}"/>
                                                            <fmt:setLocale value="vi_VN"/>
                                                            <fmt:formatNumber value="${total}" type="currency"/></td>
                                                        <td class="border w-1/12 py-2"><a href="MainController?btAction=ChangeOrderStatusShipperManager&orderId=${o.orderId}" class="px-4 py-2 rounded block leading-7" id="add_product_swp" style="background-color: rgb(212 212 216); margin-left: 5px; margin-right: 5px">Xác nhận</a></td>
                                                    </tr>
                                                </c:forEach>
                                                <!--  -->
                                            </tbody>
                                        </table>
                                        <h1 style="text-align: center">${VIEW_ORDER_SHIPPER_ERROR}</h1>
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
            function linkRow() {
                const rows = document.querySelectorAll("tr[data-href]");
                rows.forEach(row => {
                    row.addEventListener("click", () => {
                        window.location.href = row.dataset.href;
                    });
                });
            }
            document.addEventListener("DOMContentLoaded", linkRow());
        </script>
        <script>
            function handalModal(id, display, pid) {
                console.log(pid)
                document.getElementById('yes').href = 'MainController?btAction=RemoveProductManager&id=' + pid
                console.log(document.getElementById('yes'))
                document.getElementById(id).style.display = display;
            }

            const items = document.querySelectorAll('#item');
            const menu = document.getElementById('menu')
            const icon = document.getElementById('icon-xoay')
            const listMenu = document.getElementById('list-menu')
            console.log(listMenu)

            menu.addEventListener('click', () => {
                listMenu.classList.toggle('show-swp')
                icon.classList.toggle('show-swp-icon')
            })

            items.forEach(item => {
                console.log(item)
            })
        </script>
    </body>
</html>
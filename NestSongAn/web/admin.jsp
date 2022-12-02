<%-- 
    Document   : admin.jsp
    Created on : Oct 25, 2022, 2:09:18 PM
    Author     : thangbv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <meta
            name="keywords"
            content="tailwind,tailwindcss,tailwind css,css,starter template,free template,admin templates, admin template, admin dashboard, free tailwind templates, tailwind example"
            />
        <!-- Css -->
        <link rel="stylesheet" href="./dist/styles.css" />
        <link rel="stylesheet" href="./dist/all.css" />
        <link
            href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i"
            rel="stylesheet"
            />
        <link type="text/css" rel="Stylesheet" href="css/jqx.base.css" />
    
        <title>Admin</title>
        <style>
            .show-swp{
                display: block;
            }
            .show-swp-icon{
                transform: rotate(90deg)
            }
        </style>
        <style type="text/css">
        .labels {
            font-size: smaller;
        }
    </style>
    
    </head>

    <body>
        <!--Container -->
        <div class="mx-auto bg-grey-400">
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
                        <ul class="list-reset flex flex-col">
                            <li
                                class="w-full h-full py-3 px-2 border-b border-light-border bg-white"
                                >
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
                                    href="ViewProductManagerController"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fab fa-wpforms float-left mx-2"></i>
                                    Sản phẩm
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <!--href="ViewOrderManagerController"-->
                                <div id="menu">
                                    <a
                                        href="#"
                                        class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                        >
                                        <i class="fas fa-grip-horizontal float-left mx-2"></i>
                                        Đơn hàng
                                        <span><i class="fa fa-angle-right float-right" id="icon-xoay"></i></span>
                                    </a>
                                </div>
                                <ul class="text-sm border-t-2 mt-2 hidden" id="list-menu">
                                    <li id="item"><a href="ViewOrderManagerController" class="block py-2 font-sans font-hairline hover:font-normal text-nav-item text-sm">Đang chuẩn bị hàng</a></li> 
                                    <li id="item"><a href="ViewOrderTransportController" class="block py-2 font-sans font-hairline hover:font-normal text-nav-item text-sm">Đang vận chuyển</a></li> 
                                    <li id="item"><a href="ViewOrderSuccessController" class="block py-2 font-sans font-hairline hover:font-normal text-nav-item text-sm">Đã hoàn tất</a></li> 
                                </ul>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a
                                    href="GetComment"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fas fa-table float-left mx-2"></i>
                                    Bình luận
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a

                                    

                                    href="ViewBlogManagerController"
                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fab fa-uikit float-left mx-2"></i>
                                    Bài viết
                                    <span><i class="fa fa-angle-right float-right"></i></span>
                                </a>
                            </li>
                            <li class="w-full h-full py-3 px-2 border-b border-light-border">
                                <a
                                   href="GetContact"

                                    class="font-sans font-hairline hover:font-normal text-sm text-nav-item no-underline"
                                    >
                                    <i class="fab fa-uikit float-left mx-2"></i>
                                    Liên hệ
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
                    <main class="bg-white-300 flex-1 p-3 overflow-hidden">
                        <div class="flex flex-col">
                            <!-- Stats Row Starts Here -->
                            <div class="flex flex-1 flex-col md:flex-row lg:flex-row mx-2">
                                <div
                                    class="shadow-lg bg-red-vibrant border-l-8 hover:bg-red-vibrant-dark border-red-vibrant-dark mb-2 p-2 md:w-1/4 mx-2"
                                    >
                                    <div class="p-4 flex flex-col">
                                        <a href="#" class="no-underline text-white text-2xl">
                                            $244
                                        </a>
                                        <a href="#" class="no-underline text-white text-lg">
                                            Total Sales
                                        </a>
                                    </div>
                                </div>

                                <div
                                    class="shadow bg-info border-l-8 hover:bg-info-dark border-info-dark mb-2 p-2 md:w-1/4 mx-2"
                                    >
                                    <div class="p-4 flex flex-col">
                                        <a href="#" class="no-underline text-white text-2xl">
                                            $199.4
                                        </a>
                                        <a href="#" class="no-underline text-white text-lg">
                                            Total Cost
                                        </a>
                                    </div>
                                </div>

                                <div
                                    class="shadow bg-warning border-l-8 hover:bg-warning-dark border-warning-dark mb-2 p-2 md:w-1/4 mx-2"
                                    >
                                    <div class="p-4 flex flex-col">
                                        <a href="#" class="no-underline text-white text-2xl">
                                            900
                                        </a>
                                        <a href="#" class="no-underline text-white text-lg">
                                            Total Users
                                        </a>
                                    </div>
                                </div>

                                <div
                                    class="shadow bg-success border-l-8 hover:bg-success-dark border-success-dark mb-2 p-2 md:w-1/4 mx-2"
                                    >
                                    <div class="p-4 flex flex-col">
                                        <a href="#" class="no-underline text-white text-2xl">
                                            500
                                        </a>
                                        <a href="#" class="no-underline text-white text-lg">
                                            Total Products
                                        </a>
                                    </div>
                                </div>
                                <div
                                    class="shadow bg-success border-l-8 hover:bg-success-dark border-success-dark mb-2 p-2 md:w-1/4 mx-2"
                                    >
                                    <div class="p-4 flex flex-col">
                                        <a href="#" class="no-underline text-white text-2xl">
                                            500
                                        </a>
                                        <a href="#" class="no-underline text-white text-lg">
                                            Total Blog
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- /Stats Row Ends Here -->
                    <div id='chartContainer' style="width: 860px; height: 600px; margin-bottom: 25px;"></div>
                            <!-- Card Sextion Starts Here -->
                          
                            
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
        <script src="./main.js"></script>
        <script>
                                    const items = document.querySelectorAll('#item');
                                    const menu = document.getElementById('menu')
                                    const icon=document.getElementById('icon-xoay')
                                            const listMenu = document.getElementById('list-menu')
                                            console.log(listMenu)

                                            menu.addEventListener('click', () => {
                                                listMenu.classList.toggle('show-swp')
                                                icon.classList.toggle('show-swp-icon')
                                            })

                                            
        </script>
        
    </body>
</html>

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String LOGIN = "Login";
    private static final String LOGINCONTROLLER = "LoginController";
    private static final String REGISTER = "SignUp";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String DETAIL = "Detail";
    private static final String DETAIL_CONTROLLER = "DetailController";
    private static final String BUY_NOW = "BuyNow";
    private static final String BUY_NOW_CONTROLLER = "BuyNowController";
    private static final String ADD_TO_CART = "AddToCart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String REMOVE_CART = "RemoveCart";
    private static final String REMOVE_CART_CONTROLLER = "RemoveCartController";
    private static final String UPDATE_CART = "UpdateCart";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String VIEW_PRODUCT_BY_CATEGORY = "ViewProductByCategory";
    private static final String VIEW_PRODUCT_BY_CATEGORY_CONTROLLER = "ViewProductByCategoryController";
    private static final String VIEW_CATEGORY = "ViewCategory";
    private static final String VIEW_CATEGORY_CONTROLLER = "ViewCategoryController";
    private static final String SAVE_INFO = "SaveInfo";
    private static final String SAVE_INFO_CONTROLLER = "SaveInfoController";
    private static final String CONTACT = "Send";
    private static final String CONTACT_CONTROLLER = "ContactController";
    private static final String PURCHASE = "Purchase";
    private static final String PURCHASE_CONTROLLER = "PurchaseController";
    private static final String CREATE_COMMENT = "CreateComment";
    private static final String CREATE_COMMENT_CONTROLLER = "CreateCommentController";
    private static final String UPDATE_PRODUCT_MANAGER = "UpdateProductManager";
    private static final String UPDATE_PRODUCT_MANAGER_CONTROLLER = "UpdateProductManagerController";
    private static final String VIEW_LIST_BLOG = "ViewListBlog";
    private static final String VIEW_LIST_BLOG_CONTROLLER = "ViewListBlogController";
    private static final String VIEW_BLOG = "ViewBlog";
    private static final String VIEW_BLOG_CONTROLLER = "ViewBlogController";
    private static final String CREATE_BLOG = "CreateBlog";
    private static final String CREATE_BLOG_CONTROLLER = "CreateBlogController";
    private static final String UPDATE_PROFILE = "UpdateProfile";
    private static final String UPDATE_PROFILE_CONTROLLER = "UpdateProfileController";
    private static final String VIEW_EDIT_BLOG = "ViewEditBlog";
    private static final String VIEW_EDIT_BLOG_CONTROLLER = "ViewEditBlogController";
    private static final String EDIT_BLOG = "EditBlog";
    private static final String EDIT_BLOG_CONTROLLER = "EditBlogController";
    private static final String REMOVE_BLOG = "RemoveBlog";
    private static final String REMOVE_BLOG_CONTROLLER = "RemoveBlogController";
    private static final String UNLOCK_BLOG = "UnlockBlog";
    private static final String UNLOCK_BLOG_CONTROLLER = "UnlockBlogController";
    private static final String EDIT_PRODUCT_MANAGER = "EditProductManager";
    private static final String EDIT_PRODUCT_MANAGER_CONTROLLER = "EditProductManagerController";
    private static final String VIEW_EDIT_PRODUCT_MANAGER = "ViewEditProductManager";
    private static final String VIEW_EDIT_PRODUCT_MANAGER_CONTROLLER = "ViewEditProductManagerController";
    private static final String REMOVE_PRODUCT_MANAGER = "RemoveProductManager";
    private static final String REMOVE_PRODUCT_MANAGER_CONTROLLER = "RemoveProductManagerController";
    private static final String SEARCH_PRODUCT_MANAGER = "SearchProductManager";
    private static final String SEARCH_PRODUCT_MANAGER_CONTROLLER = "SearchProductManagerController";
    private static final String UPDATE_PASSWORD = "UpdatePassword";
    private static final String UPDATE_PASSWORD_CONTROLLER = "UpdatePasswordController";
    private static final String VIEW_ORDER_DETAIL_MANAGER = "ViewProductDetailManager";
    private static final String VIEW_ORDER_DETAIL_MANAGER_CONTROLLER = "ViewProductDetailManagerController";
    private static final String CHANGE_ORDER_STATUS_ADMIN_MANAGER = "ChangeOrderStatusAdminManager";
    private static final String CHANGE_ORDER_STATUS_ADMIN_MANAGER_CONTROLLER = "ChangeOrderStatusAdminManagerController";
    private static final String VIEW_ORDER_DETAIL_SHIPPER_MANAGER = "ViewOrderDetailShipperManager";
    private static final String VIEW_ORDER_DETAIL_SHIPPER_MANAGER_CONTROLLER = "ViewOrderDetailShipperManagerController";
    private static final String CHANGE_ORDER_STATUS_SHIPPER_MANAGER = "ChangeOrderStatusShipperManager";
    private static final String CHANGE_ORDER_STATUS_SHIPPER_MANAGER_CONTROLLER = "ChangeOrderStatusShipperManagerController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String action = request.getParameter("btAction");
        try {
            if (action == null) {
                log("Action is null");
            } else if (action.equals(LOGIN)) {
                url = LOGINCONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (action.equals(ADD_TO_CART)) {
                url = ADD_TO_CART_CONTROLLER;
            } else if (action.equals(DETAIL)) {
                url = DETAIL_CONTROLLER;
            } else if (action.equals(BUY_NOW)) {
                url = BUY_NOW_CONTROLLER;
            } else if (action.equals(REMOVE_CART)) {
                url = REMOVE_CART_CONTROLLER;
            } else if (action.equals(UPDATE_CART)) {
                url = UPDATE_CART_CONTROLLER;
            } else if (action.equals(VIEW_PRODUCT_BY_CATEGORY)) {
                url = VIEW_PRODUCT_BY_CATEGORY_CONTROLLER;
            } else if (action.equals(REGISTER)) {
                url = REGISTER_CONTROLLER;
            } else if (action.equals(LOGOUT)) {
                url = LOGOUT_CONTROLLER;
            } else if (action.equals(VIEW_CATEGORY)) {
                url = VIEW_CATEGORY_CONTROLLER;
            } else if (action.equals(SAVE_INFO)) {
                url = SAVE_INFO_CONTROLLER;
            } else if (action.equals(CONTACT)) {
                url = CONTACT_CONTROLLER;
            } else if (action.equals(SAVE_INFO)) {
                url = SAVE_INFO_CONTROLLER;
            } else if (action.equals(PURCHASE)) {
                url = PURCHASE_CONTROLLER;
            } else if (action.equals(CREATE_COMMENT)) {
                url = CREATE_COMMENT_CONTROLLER;
            } else if (UPDATE_PRODUCT_MANAGER.equals(action)) {
                url = UPDATE_PRODUCT_MANAGER_CONTROLLER;
            } else if (VIEW_LIST_BLOG.equals(action)) {
                url = VIEW_LIST_BLOG_CONTROLLER;
            } else if (VIEW_BLOG.equals(action)) {
                url = VIEW_BLOG_CONTROLLER;
            } else if (CREATE_BLOG.equals(action)) {
                url = CREATE_BLOG_CONTROLLER;
            } else if (UPDATE_PROFILE.equals(action)) {
                url = UPDATE_PROFILE_CONTROLLER;
            } else if (UPDATE_PROFILE.equals(action)) {
                url = UPDATE_PROFILE_CONTROLLER;
            } else if (VIEW_EDIT_BLOG.equals(action)) {
                url = VIEW_EDIT_BLOG_CONTROLLER;
            } else if (EDIT_BLOG.equals(action)) {
                url = EDIT_BLOG_CONTROLLER;
            } else if (REMOVE_BLOG.equals(action)) {
                url = REMOVE_BLOG_CONTROLLER;
            } else if (UNLOCK_BLOG.equals(action)) {
                url = UNLOCK_BLOG_CONTROLLER;
            } else if (EDIT_PRODUCT_MANAGER.equals(action)) {
                url = EDIT_PRODUCT_MANAGER_CONTROLLER;
            } else if (VIEW_EDIT_PRODUCT_MANAGER.equals(action)) {
                url = VIEW_EDIT_PRODUCT_MANAGER_CONTROLLER;
            } else if (REMOVE_PRODUCT_MANAGER.equals(action)) {
                url = REMOVE_PRODUCT_MANAGER_CONTROLLER;
            } else if (SEARCH_PRODUCT_MANAGER.equals(action)) {
                url = SEARCH_PRODUCT_MANAGER_CONTROLLER;
            } else if (UPDATE_PASSWORD.equals(action)) {
                url = UPDATE_PASSWORD_CONTROLLER;
            } else if (UPDATE_PASSWORD.equals(action)) {
                url = UPDATE_PASSWORD_CONTROLLER;
            } else if (VIEW_ORDER_DETAIL_MANAGER.equals(action)) {
                url = VIEW_ORDER_DETAIL_MANAGER_CONTROLLER;
            } else if (CHANGE_ORDER_STATUS_ADMIN_MANAGER.equals(action)) {
                url = CHANGE_ORDER_STATUS_ADMIN_MANAGER_CONTROLLER;
            } else if (VIEW_ORDER_DETAIL_SHIPPER_MANAGER.equals(action)) {
                url = VIEW_ORDER_DETAIL_SHIPPER_MANAGER_CONTROLLER;
            } else if (CHANGE_ORDER_STATUS_SHIPPER_MANAGER.equals(action)) {
                url = CHANGE_ORDER_STATUS_SHIPPER_MANAGER_CONTROLLER;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

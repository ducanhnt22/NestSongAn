/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.Cart;
import order.OrderDAO;
import order.OrderDTO;
import order.OrderDetail;
import product.ProductDTO;
import users.UserDAO;
import users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "PurchaseController", urlPatterns = {"/PurchaseController"})
public class PurchaseController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ViewProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int id = 0;
            String phone = "";
            String address = "";
            String status = "";
            int total = 0;
            int final_total = 0;
            String name = "";
            int shipping_fee = 0;

            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            UserDTO guest = (UserDTO) session.getAttribute("GUEST_USER");
            if (loginUser != null) {
                id = loginUser.getUserId();
                phone = request.getParameter("phone");//1
                address = request.getParameter("address");//2
                status = request.getParameter("status");
                total = Integer.parseInt(request.getParameter("total"));
                final_total = Integer.parseInt(request.getParameter("total_money"));
                name = request.getParameter("name");//3
                shipping_fee = final_total - total;
            } else if (guest != null) {
                OrderDAO oDao = new OrderDAO();
                UserDAO dao = new UserDAO();
                UserDTO user = (UserDTO) session.getAttribute("GUEST_USER");
                dao.saveGuestInformation(user);//update
                phone = guest.getPhone();//1
                id = oDao.checkUserId(phone);
                address = guest.getAddress();//2
                status = request.getParameter("status");
                total = Integer.parseInt(request.getParameter("total"));
                final_total = Integer.parseInt(request.getParameter("total_money"));
                name = guest.getFullName();//3
                shipping_fee = final_total - total;
            }
            Date today = new Date();
            SimpleDateFormat dateForm = new SimpleDateFormat("dd/MM/YYYY hh:mm aa");
            String date = dateForm.format(today);

            OrderDAO orderDAO = new OrderDAO();
            int orderId = orderDAO.insertOrder(new OrderDTO(date, address, id, phone, shipping_fee, total, name, status));

            boolean check = false;
            Cart cart = (Cart) session.getAttribute("CART");
            for (ProductDTO o : cart.getCart().values()) {
                check = orderDAO.insertOrderDetail(new OrderDetail(o.getProductId(), orderId, o.getQuantity(), o.getPrice()));
            }

            if (check) {
                cart=null;
                session.setAttribute("CART", cart);
                session.setAttribute("QUANTITY_IN_CART", null);
                request.setAttribute("SHOW_MODAL", "show");
                url = SUCCESS;
            } else {
                url = ERROR;
            }
        } catch (Exception e) {
            log("Error at PurchaseController at: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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

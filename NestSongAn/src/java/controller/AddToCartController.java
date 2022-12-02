/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.Cart;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String OVER_QUANTITY = "shop-detail.jsp";
    private static final String SUCCESS = "ViewProductController";   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String img = request.getParameter("img");
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int buyQuantity = Integer.parseInt(request.getParameter("buyQuantity"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (buyQuantity > quantity) {
                request.setAttribute("OVER_QUANTITY", "Over quantity, please try again!!!");
                url = OVER_QUANTITY;
            } else {
                HttpSession session = request.getSession();                
                if (session != null) {
                    Cart cart = (Cart) session.getAttribute("CART");
                    ProductDTO product = new ProductDTO(id, name, buyQuantity, price, img);
                    if (cart == null) {
                        cart = new Cart();
                    }
                    cart.add(product);
                    int quantityInCart=cart.getCart().size();
                    session.setAttribute("CART", cart);
                    session.setAttribute("QUANTITY_IN_CART", quantityInCart);
                    request.setAttribute("CART_SUCCESS", "sản phẩm đã thêm vào giỏ hàng thành công, mời bạn tiếp tục mua sắm");
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at AddProductController at: " + e.toString());
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

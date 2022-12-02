/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import category.CategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import price.PriceDTO;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateProductManagerController", urlPatterns = {"/UpdateProductManagerController"})
public class UpdateProductManagerController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ViewProductManagerController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
//            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryName = request.getParameter("categoryName");
            String img = request.getParameter("image");
            String desc = request.getParameter("desc");
            int status = Integer.parseInt(request.getParameter("status"));

            Date today = new Date();
            SimpleDateFormat dateForm = new SimpleDateFormat("dd/MM/YYYY hh:mm aa");
            String date = dateForm.format(today);

            ProductDAO dao = new ProductDAO();
            String categoryId = dao.getCategoryId(categoryName);
            
            dao.insertProduct(new ProductDTO(name, quantity, price, img, desc, categoryId ,categoryName, status));
            int productId = dao.getProductId(name);
            boolean check = dao.insertPrice(new PriceDTO(price, status, productId, date));
            
            ProductDTO product = new ProductDTO(name, quantity, price, img, desc, categoryName, status);
            request.setAttribute("VIEW_PRODUCT_VER_FULL", product);
            if(check) {
                url = SUCCESS;
            } else {
                url = ERROR;
            }
        } catch (Exception e) {
            log("Error at UpdateProductManagerController at: " + e.toString());
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import category.CategoryDAO;
import category.CategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author thangbv
 */
@WebServlet(name = "ViewProductController", urlPatterns = {"/ViewProductController"})
public class ViewProductController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "shop.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String page=request.getParameter("page");
            if(page==null){
                page="1";
            }
            int pageActive=Integer.parseInt(page);
            boolean checkValidation = true;
            ProductDAO dao = new ProductDAO();
            CategoryDAO cDao = new CategoryDAO();
            while (checkValidation) {
                checkValidation = true;
                List<ProductDTO> listProduct = dao.pagination(pageActive);
                if (listProduct.size() > 0) {
                    request.setAttribute("VIEW_PRODUCT", listProduct);
                    request.setAttribute("ACTIVE_PAGE", pageActive);
                    checkValidation = false;
                    url = SUCCESS;
                }
                List<CategoryDTO> listCategory = cDao.ViewCategory();
                if (listCategory.size() > 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("VIEW_CATEGORY", listCategory);
                    checkValidation = false;
                    url = SUCCESS;
                } 
            }

        } catch (Exception e) {
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import comment.CommentDAO;
import comment.CommentDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tranq
 */
@WebServlet(name = "CreateCommentController", urlPatterns = {"/CreateCommentController"})
public class CreateCommentController extends HttpServlet {

    private final String SHOP_DETAIL_PAGE = "shop-detail.jsp";
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
        String comment = request.getParameter("txtComment");
        int userId = Integer.parseInt(request.getParameter("userIdComment"));
        int productId = Integer.parseInt(request.getParameter("id"));
        String url = SHOP_DETAIL_PAGE;
        try {

            CommentDAO dao = new CommentDAO();
                CommentDTO dto = new CommentDTO(userId, productId, comment, 0);
                boolean result = dao.createComment(dto);
                if (result) {
                    url = SHOP_DETAIL_PAGE;
                    request.setAttribute("COMMENT_SUCCESS", "Cảm ơn bạn đã đánh giá! Đánh giá của bạn sẽ sớm được chúng tôi duyệt");
                }
            
        } catch (NamingException ex) {
            log("CreateCommentController _ Naming _ " + ex.getMessage());
        } catch (SQLException ex) {
            log("CreateCommentController _ SQL _ " + ex.getMessage());
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

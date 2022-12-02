/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import users.UserDAO;
import users.UserError;

/**
 *
 * @author tranq
 */
@WebServlet(name = "UpdatePasswordController", urlPatterns = {"/UpdatePasswordController"})
public class UpdatePasswordController extends HttpServlet {

    private final String ERROR = "change-password.jsp";
    private final String SUCCESS = "change-password.jsp";

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
            String password = request.getParameter("password");
            String reOldPassword = request.getParameter("reOldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirm = request.getParameter("confirm");
            int userId = Integer.parseInt(request.getParameter("userId"));
            UserError errors = new UserError();
            boolean foundErr = false;
            if (reOldPassword.equals(password)) {
                if (!confirm.equals(newPassword)) {
                    foundErr = true;
                    errors.setConfirmNotMatch("Mật Khẩu Nhập Lại Không Khớp");
                }
                if (newPassword.trim().length() > 50) {
                    foundErr = true;
                    errors.setPasswordErr("Mật khẩu không quá 50 kí tự");
                }
                if (foundErr) {
                    request.setAttribute("CHANGE_PASSWORD_ERROR", errors);
                } else {
                    UserDAO dao = new UserDAO();
                    boolean result = dao.updatePassword(userId, newPassword);
                    if (result) {
                        request.setAttribute("CHANGE_PASSWORD_SUCCESS", "Thay đổi mật khẩu thành công");
                        url = SUCCESS;
                    }
                }
            } else {
                request.setAttribute("ERROR_CHANGE_PASSWORD", "Mật khẩu cũ không đúng");
            }

        } catch (NamingException ex) {
            log("UpdateProfileController _ Naming _ " + ex.getMessage());
        } catch (SQLException ex) {
            log("UpdateProfileController _ SQL _ " + ex.getMessage());
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

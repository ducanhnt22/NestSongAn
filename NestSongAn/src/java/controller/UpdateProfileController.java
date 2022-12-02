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
import users.UserDTO;
import users.UserError;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tranq
 */
@WebServlet(name = "UpdateProfileController", urlPatterns = {"/UpdateProfileController"})
public class UpdateProfileController extends HttpServlet {

    private final String ERROR_PAGE = "user-profile.jsp";
    private final String SUCCESS = "user-profile.jsp";

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
        String url = ERROR_PAGE;
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            String fullName = request.getParameter("userFullName");
            String phone = request.getParameter("userPhone");
            String email = request.getParameter("userEmail");
            String address = request.getParameter("userAddress");
            String password = request.getParameter("password");
            String userName = request.getParameter("userName");
            String roleId = request.getParameter("roleId");
            boolean foundErr = false;
            UserError errors = new UserError();
            HttpSession session = request.getSession();
            UserDTO dto = (UserDTO) session.getAttribute("LOGIN_USER");
            //1. call dao
            if (email.trim().length() < 1 && phone.trim().length() < 1) {
                foundErr = true;
                errors.setEmailAndPhoneErr("Bạn cần điền email hoặc số điện thoại!!!");
            }

            if (foundErr) {
                request.setAttribute("INSERT_UPDATE_ACCOUNT_ERRORS", errors);
            } else {
                UserDAO dao = new UserDAO();
//                UserDTO dto = new UserDTO(userId, password, address, phone, email, fullName, roleId, userName);
                dto = new UserDTO(userId, password, address, phone, email, fullName, roleId, userName);
                boolean result = dao.updateInfo(dto);
                if (result) {
                    request.setAttribute("INSERT_UPDATE_ACCOUNT_SUCCESS", "Cập nhật thông tin thành công");
                    session.setAttribute("LOGIN_USER", dto);
                    url = SUCCESS;
                }
            }
        } catch (NamingException ex) {
            log("UpdateProfileController _ Naming _ " + ex.getMessage());
        } catch (SQLException ex) {
            log("UpdateProfileController _ SQL _ " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
//                response.sendRedirect(url);
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

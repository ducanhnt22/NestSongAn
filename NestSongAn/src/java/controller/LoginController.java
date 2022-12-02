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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.UserDAO;
import users.UserDTO;

/**
 *
 * @author tranq
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String INVALID_PAGE = "login.jsp";
    private static final String US = "US";
    private static final String USER_PAGE = "ViewProductController";
    private static final String AD = "AD";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String SHIPPER = "SHIPPER";
    private static final String SHIPPER_PAGE = "ViewOrderShipperController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = INVALID_PAGE;
        try {
            String userName = request.getParameter("txtUserName");
            String password = request.getParameter("txtPassword");
            //1.Call model/dao
            UserDAO dao = new UserDAO();
            UserDTO result = dao.checkLogin(userName, password);

            //2.Process result
            if (result != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", result);
                //Cookie remember me
                String remember = request.getParameter("remember");
                Cookie cUser = new Cookie("cUserName", userName);
                Cookie cPass = new Cookie("cPassword", password);
                Cookie cRemember = new Cookie("cRemember", remember);
                if (remember != null) {
                    cUser.setMaxAge(60 * 60 * 24); //1 ngay
                    cPass.setMaxAge(60 * 60 * 24);
                    cRemember.setMaxAge(60 * 60 * 24);
                } else {
                    cUser.setMaxAge(0);
                    cPass.setMaxAge(0);
                    cRemember.setMaxAge(0);
                }
                response.addCookie(cUser);
                response.addCookie(cPass);
                response.addCookie(cRemember);
                String roleID = result.getRoleId();
                if (AD.equals(roleID)) {
                    url = ADMIN_PAGE;
                } else if (US.equals(roleID)) {
                    url = USER_PAGE;
                } else if (SHIPPER.equals(roleID)) {
                    url = SHIPPER_PAGE;
                } else {
                    request.setAttribute("LOGIN_ERROR", "Your role is not supported!");
                }
            } else {
                request.setAttribute("LOGIN_ERROR", "Sai mật khẩu hoặc tài khoản không tồn tại");
            }

        } catch (SQLException ex) {
            log("LoginController _ SQL _ " + ex.getMessage());
        } catch (NamingException ex) {
            log("LoginController _ Naming _ " + ex.getMessage());

        } finally {
//            request.getRequestDispatcher(url).forward(request, response);
            response.sendRedirect(url);
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
        //Create Cookie
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

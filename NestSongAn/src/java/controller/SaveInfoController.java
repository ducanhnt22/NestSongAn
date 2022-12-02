/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.UserDAO;
import users.UserDTO;

/**
 *
 * @author thangbv
 */
@WebServlet(name = "SaveInfoController", urlPatterns = {"/SaveInfoController"})
public class SaveInfoController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "checkout2.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String save = request.getParameter("save");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int total = Integer.parseInt(request.getParameter("total"));
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            UserDAO dao = new UserDAO();
            if (loginUser != null) {
                UserDTO user = new UserDTO(address, phone, email, name, loginUser.getUserId());
                if (save != null) {
                    boolean check = dao.updateInfo(user);
                    if (check) {
                        UserDTO result = dao.checkLogin(loginUser.getUserName(), loginUser.getPassword());
                        session.setAttribute("LOGIN_USER", result);
                    }
                }
            } else {
                UserDTO user = new UserDTO(address, phone, email, name);
//                session.setAttribute("GUEST_USER", user);
               
                    session.setAttribute("GUEST_USER", user);
                
            }
//            }

            int shipFee = total / 100;
            request.setAttribute("SHIPPING_FEE", (int) shipFee);

            url = SUCCESS;
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

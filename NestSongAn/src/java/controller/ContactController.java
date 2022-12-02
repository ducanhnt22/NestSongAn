
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import contact.ContactDAO;
import contact.ContactDTO;
import contact.ContactErr;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
@WebServlet(name = "ContactController", urlPatterns = {"/ContactController"})
public class ContactController extends HttpServlet {

    private final String CONTACT_PAGE = "contact-us.jsp";
    private final String SUCCESS = "contact-successful.jsp";//fix here

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
        String senderName = request.getParameter("nameContact");
        String email = request.getParameter("emailContact");
        String phone = request.getParameter("phoneContact");
        String contact = request.getParameter("contactMessage");

//        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
//        Pattern emailPattern = Pattern.compile(emailRegex);
//        Matcher emailMatcher = emailPattern.matcher(email);
//        String phoneRegex = "(0/84)?[0-9][0-9]{9}";
//        Pattern phonePattern = Pattern.compile(phoneRegex);
//        Matcher phoneMatcher = phonePattern.matcher(phone);

        ContactErr errors = new ContactErr();
        boolean foundErr = false;
        ContactDAO dao = new ContactDAO();
        String url = CONTACT_PAGE;
        try {
            if (senderName.trim().length() > 50) {
                foundErr = true;
                errors.setNameErr("Tên không được dài quá 50 kí tự!!!");
            }

            if (email.trim().length() < 1 && phone.trim().length() < 1) {
                foundErr = true;
                errors.setEmailAndPhoneErr("Bạn cần điền email hoặc số điện"
                        + " thoại để chúng tôi liên lạc!!!");
            }
//            else {
//                if (email.trim().length() > 0) {
//                    if (!emailMatcher.matches()) {
//                        foundErr = true;
//                        errors.setEmailErr("Email không hợp lệ!!!");
//                    }
//                }
//                if (phone.trim().length() > 0) {
//                    if (!phoneMatcher.matches()) {
//                        foundErr = true;
//                        errors.setPhoneErr("Số điện thoại không hợp lệ!!!");
//                    }
//                }
//            }
            if (foundErr) {
                request.setAttribute("INSERT_CONTACT_ERRORS", errors);
            } else {
                ContactDTO dto
                        = new ContactDTO(senderName, email,
                                phone, contact);
                boolean result = dao.insertContact(dto);
                if (result) {
                    
                    url = SUCCESS;
                }
            }

        } catch (NamingException ex) {
            log("InsertContactController _ Naming _ " + ex.getMessage());
        } catch (SQLException ex) {
            log("InsertContactController _ SQL _ " + ex.getMessage());
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

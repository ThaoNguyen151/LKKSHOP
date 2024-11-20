/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author NGUYENTRAN
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    
    private static final String ERROR = "create.jsp";
    private static final String SUCCESS = "login.jsp";
           
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            UserDAO dao = new UserDAO();
            boolean checkValidation = true;
            String userID = request.getParameter("userID");
            String fullName = request.getParameter("fullName");
            String roleID = request.getParameter("roleID");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
//          Validation            
            if (userID.length() < 2 || userID.length() > 10) {
                checkValidation = false;
                userError.setUserIDError("UserID must be in [2, 10]");
            }
            
            if (fullName.length() < 5 || fullName.length() > 50) {
                checkValidation = false;
                userError.setFullNameError("Full Name must be in [5, 50]");
            }
            
            if (password.length() < 8 || password.length() > 20) {
                checkValidation = false;
                userError.setPasswordError("Password must be between 8 and 20 characters!");
            }

            if (!password.matches(".*[A-Z].*")) {
                checkValidation = false;
                userError.setPasswordError("Password must contain at least one uppercase letter!");
            }

            if (!password.matches(".*[a-z].*")) {
                checkValidation = false;
                userError.setPasswordError("Password must contain at least one lowercase letter!");
            }

            if (!password.matches(".*\\d.*")) {
                checkValidation = false;
                userError.setPasswordError("Password must contain at least one number!");
            }

            if (!password.matches(".*[@#$%^&+=].*")) {
                checkValidation = false;
                userError.setPasswordError("Password must contain at least one special character (@#$%^&+=)!");
            }

            if (!confirm.equals(password)) {
                checkValidation = false;
                userError.setConfirmError((" Not confirm Password"));
            }
            

            if (checkValidation) {
                UserDTO user = new UserDTO(userID, fullName, roleID, password, "");
                boolean checkInsert = dao.insert(user);
                if (checkInsert) {
                    url = SUCCESS;
                    request.setAttribute("USER_SUCCESS", "SUCCESSFULLY ADD USER");
                } else {
                    userError.setError("Unknown Error!");
                    request.setAttribute("USER_ERROR", userError);
                }
            } else {
//                request.setAttribute("USER_ERROR", userError);
                    request.setAttribute("USER_ERROR", userError);
                    request.getRequestDispatcher(ERROR).forward(request, response);
                    return; // Dừng xử lý để không tiếp tục logic thêm user
            }
                    
        } catch(Exception e) {
            log("Error at CreateController: " + e.toString());
            if(e.toString().contains("duplicate")) {
                userError.setUserIDError("Duplicate userID !");
                request.setAttribute("USER_ERROR", userError);
            }
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

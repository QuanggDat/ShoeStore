/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Facade.UserFacade;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

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
        String action = request.getAttribute("action").toString();
        switch (action) {
            case "create":
                //hiện form create để nhập dữ liệu (craete --submit--> save)
                create(request, response);
                break;
            case "save":
                save(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
        }
        //Chon view de hien ket qua
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
    }

    public void create(HttpServletRequest request, HttpServletResponse response) {
        //Xu ly
    }

    public void save(HttpServletRequest request, HttpServletResponse response) {
        String url = "";
        try {
            String op = request.getParameter("op");
            if (op.equals("save")) {
                String gmail = request.getParameter("gmail");
                String fullName = request.getParameter("fullName");
                String roleID = request.getParameter("roleID");
                String password = request.getParameter("password");
                User user = new User(gmail, fullName, roleID, password);

                UserFacade uf = new UserFacade();
                boolean checkDuplicate = uf.checkDuplicate(gmail);
                if (checkDuplicate) {
                    request.setAttribute("error", "This gmail already exists");
                    request.setAttribute("action", "create");
                } else {
                    uf.createUser(user);
                    request.setAttribute("SUCCESS", "Create account success");
                    request.setAttribute("action", "create");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            //Chi hien lai view create va thong bao loi
            request.setAttribute("action", "create");
            request.setAttribute("errorMessage", "Invalid data.");
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

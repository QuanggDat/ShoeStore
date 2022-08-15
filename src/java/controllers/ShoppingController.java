/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Facade.UserFacade;
import entities.Product;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
@WebServlet(name = "ShoppingController", urlPatterns = {"/shopping"})
public class ShoppingController extends HttpServlet {

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
            case "confirm":
                confirm(request, response);
                break;
            case "information":
                information(request, response);
                break;
            case "success":
                success(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
        }
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
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

    private void confirm(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("action", "confirm");
    }

    private void information(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("action", "information");
    }

    private void success(HttpServletRequest request, HttpServletResponse response) {
        String gmail = request.getParameter("gmail");
        String password = request.getParameter("password");
        UserFacade user = new UserFacade();
        User loginUser = user.checkLogin(gmail, password);
        request.setAttribute("gmail", gmail);
        if (loginUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("login_user", loginUser);
            String roleID = loginUser.getRoleID();
            if (roleID.equalsIgnoreCase("AD")) {
                request.setAttribute("action", "success");
            } else if (roleID.equalsIgnoreCase("US")) {
                request.setAttribute("action", "success");
            } else {
                request.setAttribute("ERROR", "Your role is not support !");
            }
        } else {
            request.setAttribute("action", "information");
            request.setAttribute("error", "Acount is not correct!");
        }
    }
}

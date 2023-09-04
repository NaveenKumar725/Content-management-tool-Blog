/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.NaveenBlog.Servlets;

import com.NaveenBlog.Dao.UserDao;
import com.NaveenBlog.Entities.User;
import com.NaveenBlog.Helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 91725
 */

@MultipartConfig
public class Registerservlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Registerservlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
      
            
            //fetching all the datas from register page
        
            
            String check=request.getParameter("check");
            
            if(check==null){
                out.println("Please accept terms and conditions");
            }else{
                
        String name=  request.getParameter("user_name");
      String email=request.getParameter("user_email");
      String password=request.getParameter("user_password");
      String gender=request.getParameter("user_gender");
      String about=request.getParameter("user_textarea");
            
      
      //create user object and set all the data to that object
      User user=new User(name, email, password, gender, about);
      
      
      //creating object of UserDao for connection
      
      UserDao   dao=new UserDao (ConnectionProvider.getConnection());
   
      if(  dao.savaUser(user)){
          out.println("Done");
      }else{
          out.println("Error");
      }
      
      
            }
      
      
        
    
            
            
            
            
            
            
//            
//            out.println("</body>");
//            out.println("</html>");
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

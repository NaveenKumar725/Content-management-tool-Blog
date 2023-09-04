/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.NaveenBlog.Servlets;

import com.NaveenBlog.Dao.PostDao;
import com.NaveenBlog.Entities.Post;
import com.NaveenBlog.Entities.User;
import com.NaveenBlog.Helper.ConnectionProvider;
import com.NaveenBlog.Helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.reflect.Array.set;
import java.security.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author 91725
 */
@MultipartConfig
public class AddPostservlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

            //fetching form data of post form
            int cid = Integer.parseInt(request.getParameter("post_category"));
            String pTitle = request.getParameter("post_title");

            String pContent = request.getParameter("post_content");
            String pCode = request.getParameter("post_code");

            Part part = request.getPart("post_pic");
            

//            //getting current userId
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            String pDate = request.getParameter("pDate");
//  Timestamp pDate=null;
            Post p = new Post(pTitle, pContent, pCode,  part.getSubmittedFileName(), null, cid, user.getId());
//              Post p = new Post(pTitle, pContent, pCode,  part.getSubmittedFileName(), pDate, cid, user.getId());

            PostDao dao = new PostDao(ConnectionProvider.getConnection());

            if (dao.savePost(p)) {
                out.println("Done");
             
 String pathh = request.getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
              
Helper.saveFile(part.getInputStream(), pathh);
                
            } else {
                out.println("Error..");

            }

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

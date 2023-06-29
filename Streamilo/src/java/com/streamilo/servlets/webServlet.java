/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.streamilo.servlets;

import com.streamilo.dao.webDao;
import com.streamilo.entity.submitWeb;
import com.streamilo.helper.ConnectionProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JDialog;
import javax.swing.JOptionPane;

/**
 *
 * @author asus
 */
@MultipartConfig
public class webServlet extends HttpServlet {

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

            String wnam = request.getParameter("website_name");
            String wpur = request.getParameter("website_purpose");
            String wgl = request.getParameter("website_goal");
            Part part = request.getPart("web_file");
            String imgFileName = part.getSubmittedFileName();

            String uploadPath = "C:/Users/asus/Documents/NetBeansProjects/Streamilo/web/webImg/" + imgFileName;

            try {
                InputStream is = part.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                try (FileOutputStream fs = new FileOutputStream(uploadPath)) {
                    fs.write(data);
                    fs.flush();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            submitWeb sw = new submitWeb(wnam, wpur, wgl, imgFileName);
            webDao wd = new webDao();
            if (wd.addWebDetail(sw)) {
                JOptionPane optionPane = new JOptionPane("SuccessFully Submited");
                JDialog dialog = optionPane.createDialog("Warning!");
                dialog.setAlwaysOnTop(true); // to show top of all other application
                dialog.setVisible(true); // to visible the dialog
                response.sendRedirect("mapping.jsp");
            } else {
                JOptionPane optionPane = new JOptionPane("Something went wrong");
                JDialog dialog = optionPane.createDialog("Warning!");
                dialog.setAlwaysOnTop(true); // to show top of all other application
                dialog.setVisible(true); // to visible the dialog
                response.sendRedirect("submitpage.jsp");
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

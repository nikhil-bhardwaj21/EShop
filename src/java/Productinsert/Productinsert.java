/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Productinsert;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import classpack.DBcontext;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Nikhil
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class Productinsert extends HttpServlet {

    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String pid = request.getParameter("pid");
        String pname = request.getParameter("pname");
//        String pbrand = request.getParameter("pbrand");
        String psize = request.getParameter("psize");
        String prate = request.getParameter("prate");
        String pquantity = request.getParameter("pquantity");
        String pcategory = request.getParameter("category");

        String c = pcategory;
        String category = c.substring(c.indexOf(",") + 1);
        String brand = c.substring(0, c.indexOf(",") );

        HttpSession session = request.getSession(false);
        String contact = (String) session.getAttribute("contactno");
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        System.out.println("Level 1");
//        System.out.println("C1 : " + request.getParameter("c1"));
//        Cookie []ck =  request.getCookies();
//        
//        String contact = ck[0].getValue();
//(String) request.getAttribute("contactno");
        Part filePart = request.getPart("file");

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        InputStream inputStream = filePart.getInputStream();

        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        System.out.println(uploadPath);
        System.out.println(fileName);

        FileOutputStream outputStream = new FileOutputStream(uploadPath
                + File.separator + fileName);
        int read = 0;
        final byte[] bytes = new byte[1024];
        while ((read = inputStream.read(bytes)) != -1) {
            outputStream.write(bytes, 0, read);
        }

        DBcontext sd = new DBcontext();
        try {
            String query = "insert into producttable(productid,product_name,brand,size,rate,quantity,catogory,image,contactno) values("
                    + "'" + pid + "','" + pname + "','" + brand + "','" + psize + "','" + prate + "','" + pquantity + "','" + category + "','" + fileName + "','" + contact + "')";
            System.out.println("Level2");

            sd.executeDML(query);
//            sd.addproduct(pid, pname, psize, prate, pquantity, pcategory, fileName, contact);
            System.out.println("Level3");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            request.setAttribute("Error", ex.getMessage());

        }
        response.sendRedirect("productadd.jsp");
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

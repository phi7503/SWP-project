/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.JobPostDAO;
import Model.JobPost;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "DeleteJobPost", urlPatterns = {"/DeleteJobPost"})
public class DeleteJobPost extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteJobPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteJobPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        int jobPostID = Integer.parseInt(request.getParameter("id"));
        System.out.println("----------------------------" + jobPostID);
        JobPostDAO dao = new JobPostDAO();

        try {
            JobPost jobPost = new JobPost();
            jobPost.setJobPostID(jobPostID);
            boolean toggled = dao.toggleJobPostStatus(jobPost);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error toggling job post status");
        }
        try {
            List<JobPost> jobPosts = dao.getJobPostsByJobPostId(jobPostID);
            for (JobPost item : jobPosts) {
                item.setIsdeleted(item.isIsdeleted() == true ? false : true);
            }

//        request.getRequestDispatcher("/views/JobPostDetail?id=${jobPost.getJobPostID()}").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching job posts");
        }

        try {
            List<JobPost> jobPosts = dao.getJobPostsByJobPostId(jobPostID);
            for (JobPost jobPost : jobPosts) {
                System.out.println(jobPost.isIsdeleted());
            }
            request.setAttribute("id", 1);
//            jobPosts.get(0).setIsdeleted(jobPosts.get(0).isIsdeleted() == false ? true : false);
            request.setAttribute("jobPosts", jobPosts);
            request.getRequestDispatcher("/views/JobPostDetail.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching job posts");
        }
//        request.getRequestDispatcher("/views/JobPostDetail.jsp").forward(request, response);

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

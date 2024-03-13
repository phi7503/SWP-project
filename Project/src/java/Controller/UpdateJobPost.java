/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.JobPostDAO;
import Model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UpdateJobPost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String updatedTitle = request.getParameter("title");
        String updatedDescription = request.getParameter("description");
        int updatedSalary = Integer.parseInt(request.getParameter("salary"));
        String updatedPostedDate = request.getParameter("postedDate");
        String updatedRequirements = request.getParameter("requirements");
        // Lấy các thông tin khác cần cập nhật từ form

        // Thực hiện cập nhật thông tin của job post trong cơ sở dữ liệu
        JobPost updatedJobPost = new JobPost();
        updatedJobPost.setTitle(updatedTitle);
        updatedJobPost.setDescription(updatedDescription);
        updatedJobPost.setSalary(updatedSalary);
        updatedJobPost.setPostedDate(updatedPostedDate);
        updatedJobPost.setRequirements(updatedRequirements);
        // Cập nhật các thông tin khác của job post  

        int jobPostID = Integer.parseInt(request.getParameter("id"));
        updatedJobPost.setJobPostID(jobPostID);
        JobPostDAO dao = new JobPostDAO();
        try {
            dao.updateJobPost(updatedJobPost);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateJobPost.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateJobPost.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            List<JobPost> jobPosts = dao.getJobPostsByJobPostId(jobPostID);
            for (JobPost jobPost : jobPosts) {
                System.out.println(jobPost.getCompanyName());
            }

            request.setAttribute("jobPosts", jobPosts);
            request.getRequestDispatcher("/views/JobPostDetail.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching job posts");
        }
        // Forward đến trang JobPostDetail.jsp
//        request.getRequestDispatcher("/views/JobPostDetail.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

package Controller;

import DAL.JobPostDAO;
import Model.*;
import jakarta.servlet.RequestDispatcher;
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
import java.util.ArrayList;
import java.util.List;

public class JobDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int jobPostID = Integer.parseInt(request.getParameter("id"));
        JobPostDAO dao = new JobPostDAO();

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
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int jobPostID = Integer.parseInt(request.getParameter("jobPostID"));
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
        request.setAttribute("id", 1);

//        request.getRequestDispatcher("/JobDetail").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

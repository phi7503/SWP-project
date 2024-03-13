/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAL.*;
import Model.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        SearchDAO dao = new SearchDAO();
        try {
            List<Category> categories = dao.getCategory();
            request.setAttribute("categories", categories);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }


        try {
            String category = request.getParameter("category");
            List<JobPost> jobPosts = dao.getJobPostsByCategory(category);
            request.setAttribute("jobPosts", jobPosts);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, "Error retrieving job posts by category", ex);
            request.setAttribute("errorMessage", "An error occurred while retrieving job posts. Please try again later.");
        }
        
        try {
        List<Category> categories = dao.getCategory();
        request.setAttribute("categories", categories);
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    try {
        // Kiểm tra nếu có từ khóa tìm kiếm
        if (keyword != null && !keyword.isEmpty()) {
            // Gọi phương thức tìm kiếm công việc theo từ khóa
            List<JobPost> jobPosts = dao.getJobPostsByName(keyword);
            request.setAttribute("jobPosts", jobPosts);
        }
    } catch (SQLException | ClassNotFoundException ex) {
        Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, "Error retrieving job posts by keyword", ex);
        request.setAttribute("errorMessage", "An error occurred while retrieving job posts. Please try again later.");
    }


        request.getRequestDispatcher("/views/JobSearch.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/JobSearch.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

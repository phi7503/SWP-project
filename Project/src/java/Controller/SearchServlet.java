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
        SearchDAO dao = new SearchDAO();

        try {
            List<Category> categories = dao.getCategory();
            request.setAttribute("categories", categories);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            List<Company> companies = dao.getLocation();
            request.setAttribute("companies", companies);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        String category = request.getParameter("category");

        // Lấy tham số "location" từ request
        String location = request.getParameter("location");

        try {
            // Kiểm tra xem tham số "category" được cung cấp hay không
            if (category != null && !category.isEmpty()) {
                List<JobPost> jobPosts = dao.getJobPostsByCategory(category);
                request.setAttribute("jobPosts", jobPosts);
            } else if (location != null && !location.isEmpty()) { // Nếu không, kiểm tra tham số "location" được cung cấp hay không
                List<JobPost> jobPosts = dao.getJobPostsByLocation(location);
                request.setAttribute("jobPosts", jobPosts);
            } else {
                // Nếu không có cả "category" và "location", không có gì để tìm kiếm
                request.setAttribute("errorMessage", "Please provide either a category or a location.");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, "Error retrieving job posts", ex);
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

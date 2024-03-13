/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AuthenticationDAO;
import Model.JobSeeker;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author FPT
 */
public class SignupServlet extends HttpServlet {

    private final String LOGIN_PAGE = "/views/Login.jsp";
    private final String SIGNUP_PAGE = "/views/Signup.jsp";

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
        PrintWriter out = response.getWriter();
        String url = SIGNUP_PAGE;

        String button = request.getParameter("btAction2");
        try {
            if (button.equals("Signup")) {
                String username = request.getParameter("txtUsername");
                String password = request.getParameter("txtPassword");
                String fullname = request.getParameter("txtFullname");
                String email = request.getParameter("txtEmail");
                int phone = Integer.parseInt(request.getParameter("txtPhone"));
                boolean gender = "male".equals(request.getParameter("gender"));
                String address = request.getParameter("txtAddress");
                String dobString = request.getParameter("txtDoB");            
                JobSeeker jobSeeker = new JobSeeker(username, fullname, email, password, phone, gender, address, dobString);
                AuthenticationDAO dao = new AuthenticationDAO();

                // Check if the username is available
                boolean result = dao.isUsernameAvailable(username);

                if (result) {
                    // Username is available, try to insert the JobSeeker
                    boolean result2 = dao.insertJobSeeker(jobSeeker);

                    if (result2) {
                        // Insertion successful, redirect to login page or a success page
                        url = LOGIN_PAGE;
                    } else {
                        // Insertion failed, handle accordingly
                        request.setAttribute("errorMessage1", "Failed to insert JobSeeker");
                    }
                } else {
                    // Username already exists, set an error message
                    request.setAttribute("errorMessage1", "Username already exists");
                }
            }// End if user has clicked Signup button
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Handle SQL exception appropriately
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            // Handle ClassNotFoundException appropriately
        } finally {
            // Forward to the appropriate page
            request.getRequestDispatcher(url).forward(request, response);
            out.close();
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

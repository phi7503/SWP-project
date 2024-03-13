/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CompanyDAO;
import Model.Company;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 *
 * @author FPT
 */
public class AddCompanyServlet extends HttpServlet {

    private final String SUCCESS_PAGE = "/views/SuccessAddCom.jsp";
    private final String ADDCOM_PAGE = "/views/AddCompany.jsp";

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
        String url = ADDCOM_PAGE;

        String button = request.getParameter("btAction3");
        try {
            if (button.equals("AddCompany")) {

                HttpSession session = request.getSession();

                String email = request.getParameter("txtEmail");
                String password = request.getParameter("txtPassword");
                String location = request.getParameter("txtLocation");
                String phone = request.getParameter("txtPhone");
                int phone1 = Integer.parseInt(phone);
                String website = request.getParameter("txtWebsite");
                String comname = request.getParameter("txtComName");

                Company company = new Company(null,email,password,location,phone1, website, comname);
                
                CompanyDAO dao = new CompanyDAO();

                boolean result = dao.insertCompany(company);
                if (result) {
                    url = SUCCESS_PAGE;
                } else {
                    request.setAttribute("errorMessage1", "Insert error");
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

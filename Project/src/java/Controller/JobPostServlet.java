
package Controller;

import DAL.AuthenticationDAO;
import DAL.JobPostDAO;
import Model.JobPost;
import Model.JobSeeker;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author FPT
 */
public class JobPostServlet extends HttpServlet {

    private final String SUCCESS_PAGE = "/views/Success.jsp";
    private final String POSTJOB_PAGE = "/views/PostJob.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = POSTJOB_PAGE;

        String button = request.getParameter("btAction3");
        try {
            if (button.equals("PostJob")) {

                HttpSession session = request.getSession();
                String comID = (String) session.getAttribute("comID");

                String description = request.getParameter("txtDescription");
                String title = request.getParameter("txtTitle");
                String salary = request.getParameter("txtSalary");
                String requirement = request.getParameter("txtRequirement");
                int selectJob = Integer.parseInt(request.getParameter("txtSelectJob"));

                int sa = Integer.parseInt(salary);

                Date currentDate = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String dateString = dateFormat.format(currentDate);

                JobPost jobPost = new JobPost(description, title, sa, dateString, requirement, comID, selectJob);

                JobPostDAO dao = new JobPostDAO();
                
                boolean result = dao.insertJobPost(jobPost);
                if (result) {
                  url = SUCCESS_PAGE;
                } else {      
                    request.setAttribute("errorMessage1", "Post error");
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

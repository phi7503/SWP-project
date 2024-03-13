/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.JobPost;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class JobPostDAO {

    public boolean insertJobPost(JobPost jobPost) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBContext.makeConnection();
            if (con != null) {

                String sql = "INSERT INTO JobPost (Description, Title, Salary, PostedDate, Requirements, ComID) "
                        + "VALUES (?, ?, ?, ?, ?, ?)";

                stm = con.prepareStatement(sql);

                // Set values for the prepared statement
                stm.setString(1, jobPost.getDescription());
                stm.setString(2, jobPost.getTitle());
                stm.setInt(3, jobPost.getSalary());
                stm.setString(4, jobPost.getPostedDate());
                stm.setString(5, jobPost.getRequirements());
                stm.setString(6, jobPost.getComID());
                // Execute the update (INSERT) query
                int rowsAffected = stm.executeUpdate();

                // Return true if the insertion was successful
                return rowsAffected > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public List<JobPost> getJobPostsByCompanyId(String comId) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<JobPost> jobPosts = new ArrayList<>();

        try {
            // Connect to the database
            con = DBContext.makeConnection();

            if (con != null) {
                // Create SQL String
                String sql = "SELECT * FROM JobPost WHERE ComID = ?";

                // Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, comId);

                // Execute Query
                rs = stm.executeQuery();

                // Process Result
                while (rs.next()) {
                    // Create JobPost object and add to the list
                    JobPost jobPost = new JobPost();

                    jobPost.setDescription(rs.getString("Description"));
                    jobPost.setTitle(rs.getString("Title"));
                    jobPost.setSalary(rs.getInt("Salary"));
                    jobPost.setPostedDate(rs.getString("PostedDate"));
                    jobPost.setRequirements(rs.getString("Requirements"));
                    jobPost.setComID(rs.getString("ComID"));
                    jobPosts.add(jobPost);
                }
            }
        } finally {
            // Close resources
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return jobPosts;
    }

    public List<JobPost> getJobPosts() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<JobPost> jobPosts = new ArrayList<>();

        try {
            // Connect to the database
            con = DBContext.makeConnection();

            if (con != null) {
                // Create SQL String
               // String sql = "select JobPost.* , Company.ComName  from JobPost join Company on JobPost.ComID=Company.ComId";
                String sql = "select * from JobPost";

                // Create Statement
                stm = con.prepareStatement(sql);

                // Execute Query
                rs = stm.executeQuery();

                // Process Result
                while (rs.next()) {
                    // Create JobPost object and add to the list
                    JobPost jobPost = new JobPost();

                    jobPost.setDescription(rs.getString("Description"));
                    jobPost.setTitle(rs.getString("Title"));
                    jobPost.setSalary(rs.getInt("Salary"));
                    jobPost.setPostedDate(rs.getString("PostedDate"));
                    jobPost.setRequirements(rs.getString("Requirements"));
                    jobPost.setComID(rs.getString("ComID"));

                  

                    jobPosts.add(jobPost);
                }
            }
        } finally {
            // Close resources
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return jobPosts;
    }
}

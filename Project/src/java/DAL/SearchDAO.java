package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.*;
import java.sql.Connection;


public class SearchDAO {

    public List<Category> getCategory() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Category> categories = new ArrayList<>();

        try {
            // Connect to the database
            con = DBContext.makeConnection();
            if (con != null) {
                // Create SQL String
                String sql = "select * FROM Job_Category";
                // Create Statement
                stm = con.prepareStatement(sql);
                // Execute Query
                rs = stm.executeQuery();
                while (rs.next()) {
                    Category cate = new Category();
                    cate.setCategoryName(rs.getString("CategoryName"));
                    categories.add(cate);
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
        return categories;
    }
    
    public List<Company> getLocation() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Company> Company = new ArrayList<>();

        try {
            // Connect to the database
            con = DBContext.makeConnection();
            if (con != null) {
                // Create SQL String
                String sql = "select * FROM Company";
                // Create Statement
                stm = con.prepareStatement(sql);
                // Execute Query
                rs = stm.executeQuery();
                while (rs.next()) {
                    Company com = new Company();
                    com.setLocation(rs.getString("Location"));
                    Company.add(com);
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
        return Company;
    }
    
    
    public List<JobPost> getJobPostsByCategory(String categoryName) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<JobPost> jobPosts = new ArrayList<>();

        try {
            // Connect to the database
            con = DBContext.makeConnection();

            if (con != null) {
                // Create SQL String
                String sql = "select *  FROM Job_Category join \n"
                        + "   job on job.Category = Job_Category.CategoryName join\n"
                        + "   JobPost on JobPost.JobID = job.JobID where Job_Category.CategoryName = ? ";

                // Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, categoryName);

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
            // Close resources in reverse order of their creation
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

    public List<JobPost> getJobPostsByLocation(String location) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<JobPost> jobPosts = new ArrayList<>();

        try {
            // Connect to the database
            con = DBContext.makeConnection();

            if (con != null) {
                // Create SQL String
                String sql = "select * FROM JobPost\n"
                        + "join   job on job.JobID = JobPost.JobID\n"
                        + "join  Company on JobPost.ComId = Company.ComId where Location = ?";

                // Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, location);

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
            // Close resources in reverse order of their creation
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


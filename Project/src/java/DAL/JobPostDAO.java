
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

                String sql = "INSERT INTO JobPost (Description, Title, Salary, PostedDate, Requirements, ComID, JobID) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?)";

                stm = con.prepareStatement(sql);

                // Set values for the prepared statement
                stm.setString(1, jobPost.getDescription());
                stm.setString(2, jobPost.getTitle());
                stm.setInt(3, jobPost.getSalary());
                stm.setString(4, jobPost.getPostedDate());
                stm.setString(5, jobPost.getRequirements());
                stm.setString(6, jobPost.getComID());
                stm.setInt(7, jobPost.getJobID());
                
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
    

    public boolean updateJobPost(JobPost jobPost) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        System.out.println(jobPost);
        try {
            con = DBContext.makeConnection();
            if (con != null) {

                String sql = "Update JobPost Set Description = ?, Title = ?, Salary = ?, PostedDate = ?, Requirements = ? "
                        + "Where jobPostID = ?";

                stm = con.prepareStatement(sql);

                // Set values for the prepared statement
                stm.setString(1, jobPost.getDescription());
                stm.setString(2, jobPost.getTitle());
                stm.setInt(3, jobPost.getSalary());
                stm.setString(4, jobPost.getPostedDate());
                stm.setString(5, jobPost.getRequirements());
                stm.setInt(6, jobPost.getJobPostID());
                // Execute the update (INSERT) query
                int rowsAffected = stm.executeUpdate();

                // Return true if the insertion was successful
                return true;
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

    public boolean toggleJobPostStatus(JobPost jobPost) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "UPDATE JobPost SET isDeleted = CASE WHEN isDeleted = 1 THEN 0 ELSE 1 END "
                        + "WHERE jobPostID = ?";
                        
                stm = con.prepareStatement(sql);
                stm.setInt(1, jobPost.getJobPostID());
                int rowsAffected = stm.executeUpdate();
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
                String sql = "select JobPost.* , Company.ComName  from JobPost join Company on JobPost.ComID=Company.ComId WHERE JobPost.ComID = ?";

                // Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, comId);

                // Execute Query
                rs = stm.executeQuery();

                // Process Result
                while (rs.next()) {
                    // Create JobPost object and add to the list
                    JobPost jobPost = new JobPost();
                    jobPost.setJobPostID(rs.getInt("JobPostID"));
                    jobPost.setDescription(rs.getString("Description"));
                    jobPost.setTitle(rs.getString("Title"));
                    jobPost.setSalary(rs.getInt("Salary"));
                    jobPost.setPostedDate(rs.getString("PostedDate"));
                    jobPost.setRequirements(rs.getString("Requirements"));
                    jobPost.setComID(rs.getString("ComID"));
                    jobPost.setIsdeleted(rs.getBoolean("isDeleted"));
                    String companyName = rs.getString("ComName");
                    jobPost.setCompanyName(companyName);
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

    public List<JobPost> getJobPostsByJobPostId(int JobPostID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<JobPost> jobPosts = new ArrayList<>();

        try {
            con = DBContext.makeConnection();

            if (con != null) {
                String sql = "select JobPost.* , Company.ComName  from JobPost join Company on JobPost.ComID=Company.ComId WHERE JobPost.JobPostID = ?";

                stm = con.prepareStatement(sql);
                stm.setInt(1, JobPostID);

                rs = stm.executeQuery();

                while (rs.next()) {
                    // Create JobPost object and add to the list
                    JobPost jobPost = new JobPost();
                    jobPost.setJobPostID(rs.getInt("JobPostID"));
                    jobPost.setDescription(rs.getString("Description"));
                    jobPost.setTitle(rs.getString("Title"));
                    jobPost.setSalary(rs.getInt("Salary"));
                    jobPost.setPostedDate(rs.getString("PostedDate"));
                    jobPost.setRequirements(rs.getString("Requirements"));
                    jobPost.setComID(rs.getString("ComID"));
                    jobPost.setIsdeleted(rs.getBoolean("isDeleted"));
                    String companyName = rs.getString("ComName");
                    jobPost.setCompanyName(companyName);
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
                String sql = "select JobPost.* , Company.ComName  from JobPost join Company on JobPost.ComID=Company.ComId";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    JobPost jobPost = new JobPost();
                    jobPost.setDescription(rs.getString("Description"));
                    jobPost.setTitle(rs.getString("Title"));
                    jobPost.setSalary(rs.getInt("Salary"));
                    jobPost.setPostedDate(rs.getString("PostedDate"));
                    jobPost.setRequirements(rs.getString("Requirements"));
                    jobPost.setComID(rs.getString("ComID"));
                    String companyName = rs.getString("ComName");
                    jobPost.setCompanyName(companyName);
                    jobPosts.add(jobPost);
                }
            }
        } finally {
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

    public JobPost jobSeekerGetJpbPostById(int jobPostId) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        JobPost jobPost = new JobPost();

        try {
            // Connect to the database
            con = DBContext.makeConnection();

            if (con != null) {
                // Create SQL String
                String sql = "select JobPost.* , Company.ComName  from JobPost join Company on JobPost.ComID=Company.ComId where isDeleted = 0 and jobPostID = " + jobPostId;

                // Create Statement
                stm = con.prepareStatement(sql);

                // Execute Query
                rs = stm.executeQuery();

                // Process Result
                while (rs.next()) {
                    // Create JobPost object and add to the list
                    jobPost.setDescription(rs.getString("Description"));
                    jobPost.setTitle(rs.getString("Title"));
                    jobPost.setSalary(rs.getInt("Salary"));
                    jobPost.setPostedDate(rs.getString("PostedDate"));
                    jobPost.setRequirements(rs.getString("Requirements"));
                    jobPost.setComID(rs.getString("ComID"));

                    String companyName = rs.getString("ComName");
                    jobPost.setCompanyName(companyName);
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

        return jobPost;
    }

    public List<JobPost> jobSeekerGetJobPosts() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<JobPost> jobPosts = new ArrayList<>();

        try {
            // Connect to the database
            con = DBContext.makeConnection();

            if (con != null) {
                // Create SQL String
                String sql = "select JobPost.* , Company.ComName  from JobPost join Company on JobPost.ComID=Company.ComId where isDeleted = 0";

                // Create Statement
                stm = con.prepareStatement(sql);

                // Execute Query
                rs = stm.executeQuery();

                // Process Result
                while (rs.next()) {
                    // Create JobPost object and add to the list
                    JobPost jobPost = new JobPost();
                    jobPost.setJobPostID(rs.getInt("jobPostID"));
                    jobPost.setDescription(rs.getString("Description"));
                    jobPost.setTitle(rs.getString("Title"));
                    jobPost.setSalary(rs.getInt("Salary"));
                    jobPost.setPostedDate(rs.getString("PostedDate"));
                    jobPost.setRequirements(rs.getString("Requirements"));
                    jobPost.setComID(rs.getString("ComID"));

                    String companyName = rs.getString("ComName");
                    jobPost.setCompanyName(companyName);

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

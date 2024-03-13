/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Company;
import Model.JobSeeker;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author FPT
 */
public class AuthenticationDAO {

    public boolean checkLogin(String username, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBContext.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select username "
                        + "FROM JobSeeker "
                        + "WHERE Username = ? "
                        + "AND Password = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if (rs.next()) {
                    return true;
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
        return false;
    }

    public boolean checkLoginCompany(String email, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBContext.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select Email "
                        + "FROM Company "
                        + "WHERE Email = ? "
                        + "AND Password = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if (rs.next()) {
                    return true;
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
        return false;
    }

    public JobSeeker getJobSeeker(String username, String password) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // 1. Connect DB
            con = DBContext.makeConnection();
            if (con != null) {
                // 2. Create SQL String
                String sql = "SELECT * "
                        + "FROM JobSeeker "
                        + "WHERE Username = ? "
                        + "AND Password = ?";
                // 3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                // 4. Execute Query
                rs = stm.executeQuery();
                // 5. Process Result
                if (rs.next()) {
                String fullName = rs.getString("Fullname");
                String email = rs.getString("Email");
                int phone = rs.getInt("Phone");
                boolean gender = rs.getBoolean("Gender");
                String address = rs.getString("Address");
                String dob = rs.getString("DoB");
                    return new JobSeeker(username, fullName, email, password, phone, gender, address, dob);
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
        return null; // Return null if no matching record is found
    }

    public Company getCom(String email, String password) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // 1. Connect DB
            con = DBContext.makeConnection();
            if (con != null) {
                // 2. Create SQL String
                String sql = "SELECT * "
                        + "FROM Company "
                        + "WHERE Email = ? "
                        + "AND Password = ?";
                // 3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                // 4. Execute Query
                rs = stm.executeQuery();
                // 5. Process Result
                if (rs.next()) {
                String comID = rs.getString("ComID");
                String location = rs.getString("Location");
                int phone = rs.getInt("Phone");
                String website = rs.getString("Website");
                String comName = rs.getString("ComName");

                // Create and return a Company object
                return new Company(comID, email, password, location, phone, website, comName);
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
        return null; // Return null if no matching record is found
    }

    public boolean isUsernameAvailable(String username) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "SELECT username FROM JobSeeker WHERE Username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                rs = stm.executeQuery();

                // If the username exists in the database, return false
                return !rs.next();
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
        return false;
    }

    public boolean insertJobSeeker(JobSeeker jobSeeker) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO JobSeeker (Username, Fullname, Email, Password, Phone, Gender, Address, DOB) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);

                // Set values for the prepared statement
                stm.setString(1, jobSeeker.getUsername());
                stm.setString(2, jobSeeker.getFullname());
                stm.setString(3, jobSeeker.getEmail());
                stm.setString(4, jobSeeker.getPassword());
                stm.setInt(5, jobSeeker.getPhone());
                stm.setBoolean(6, jobSeeker.isGender());
                stm.setString(7, jobSeeker.getAddress());
                stm.setString(8, jobSeeker.getDoB()); // Assuming DOB is a java.sql.Date

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
}

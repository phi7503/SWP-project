/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Company;
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
public class CompanyDAO {
    public List<Company> getCompany() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<Company> companies = new ArrayList<>();

        try {
            // Connect to the database
            con = DBContext.makeConnection();

            if (con != null) {
                // Create SQL String
                String sql = "select * from Company where comID <> 10004";

                // Create Statement
                stm = con.prepareStatement(sql);

                // Execute Query
                rs = stm.executeQuery();

                // Process Result
                while (rs.next()) {
                    // Create JobPost object and add to the list
                    Company company = new Company();

                    company.setComID(rs.getString("ComId"));
                    company.setEmail(rs.getString("Email"));
                    company.setPassword(rs.getString("Password"));
                    company.setLocation(rs.getString("Location"));
                    company.setPhone(rs.getInt("Phone"));
                    company.setWebsite(rs.getString("Website"));
                    company.setComName(rs.getString("ComName"));

                    companies.add(company);
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

        return companies;
    }
    
    
    public boolean insertCompany(Company company) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBContext.makeConnection();
            if (con != null) {

                String sql = "INSERT INTO Company (Email, Password, Location, Phone, Website, ComName) "
                        + "VALUES (?, ?, ?, ?, ?, ?)";

                stm = con.prepareStatement(sql);

                // Set values for the prepared statement
                stm.setString(1, company.getEmail());
                stm.setString(2, company.getPassword());
                stm.setString(3, company.getLocation());
                stm.setInt(4, company.getPhone());
                stm.setString(5, company.getWebsite());
                stm.setString(6, company.getComName());
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

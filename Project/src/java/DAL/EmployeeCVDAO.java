package DAL;

import Model.EmployeeCV;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeCVDAO {

    public boolean insertEmployeeCV(EmployeeCV employeeCV) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBContext.makeConnection();
            if (con != null) {

                String sql = "INSERT INTO EmployeeCV (User_id,  Path_name) "
                        + "VALUES (?, ?)";

                stm = con.prepareStatement(sql);

                // Set values for the prepared statement
                stm.setString(1, employeeCV.getUser_id());

                stm.setString(2, employeeCV.getPath_name());;

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

    public static List<EmployeeCV> getEmployeeCVsByUserID(String userID) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<EmployeeCV> employeeCVs = new ArrayList<>();

        try {
            // Connect to the database
            con = DBContext.makeConnection();

            if (con != null) {
                // Create SQL String
                String sql = "SELECT * FROM EmployeeCV WHERE User_id = ?";

                // Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);

                // Execute Query
                rs = stm.executeQuery();

                // Process Result
                while (rs.next()) {
                    // Create EmployeeCV object and add to the list
                    EmployeeCV employeeCV = new EmployeeCV();

                    employeeCV.setCV_id(rs.getInt("CV_id"));

                    employeeCV.setPath_name(rs.getString("Path_name"));

                    employeeCVs.add(employeeCV);
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

        return employeeCVs;
    }

    public static boolean saveCV(EmployeeCV employeeCV) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBContext.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO EmployeeCV (User_id,  Path_name) "
                        + "VALUES (?, ?)";

                stm = con.prepareStatement(sql);

                // Set values for the prepared statement
                stm.setString(1, employeeCV.getUser_id());

                stm.setString(2, employeeCV.getPath_name());

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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class EmployeeCV {

    private int CV_id;
    private String User_id;

    private String Path_name;

    public EmployeeCV() {
    }

    public EmployeeCV(int CV_id, String User_id, String Path_name) {
        this.CV_id = CV_id;
        this.User_id = User_id;

        this.Path_name = Path_name;
    }

    public int getCV_id() {
        return CV_id;
    }

    public String getUser_id() {
        return User_id;
    }

    public String getPath_name() {
        return Path_name;
    }

    public void setCV_id(int CV_id) {
        this.CV_id = CV_id;
    }

    public void setUser_id(String User_id) {
        this.User_id = User_id;
    }

    public void setPath_name(String Path_name) {
        this.Path_name = Path_name;
    }

}

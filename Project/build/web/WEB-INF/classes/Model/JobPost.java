/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author FPT
 */
public class JobPost {
    private int jobPostID;
    private String Description;
    private String Title;
    private int Salary;
    private String PostedDate;
    private String Requirements;
    private String ComID;

    public JobPost() {
    }

    public JobPost(String Description, String Title, int Salary, String PostedDate, String Requirements, String ComID) {
        this.Description = Description;
        this.Title = Title;
        this.Salary = Salary;
        this.PostedDate = PostedDate;
        this.Requirements = Requirements;
        this.ComID = ComID;
    }

    public int getJobPostID() {
        return jobPostID;
    }

    public void setJobPostID(int jobPostID) {
        this.jobPostID = jobPostID;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public int getSalary() {
        return Salary;
    }

    public void setSalary(int Salary) {
        this.Salary = Salary;
    }

    public String getPostedDate() {
        return PostedDate;
    }

    public void setPostedDate(String PostedDate) {
        this.PostedDate = PostedDate;
    }

    public String getRequirements() {
        return Requirements;
    }

    public void setRequirements(String Requirements) {
        this.Requirements = Requirements;
    }

    public String getComID() {
        return ComID;
    }

    public void setComID(String ComID) {
        this.ComID = ComID;
    }

    public void setAttribute(String companyName, String companyName0) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}

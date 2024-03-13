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
    private String companyName;
    private int JobID;
    private boolean isdeleted;

    public JobPost() {
    }

    public JobPost(int jobPostID, String Description, String Title, int Salary, String PostedDate, String Requirements, String ComID, String companyName, boolean isdeleted) {
        this.jobPostID = jobPostID;
        this.Description = Description;
        this.Title = Title;
        this.Salary = Salary;
        this.PostedDate = PostedDate;
        this.Requirements = Requirements;
        this.ComID = ComID;
        this.companyName = companyName;
        this.isdeleted = isdeleted;
    }

    public JobPost(int jobPostID, String Description, String Title, int Salary, String PostedDate, String Requirements, String ComID, String companyName, int JobID, boolean isdeleted) {
        this.jobPostID = jobPostID;
        this.Description = Description;
        this.Title = Title;
        this.Salary = Salary;
        this.PostedDate = PostedDate;
        this.Requirements = Requirements;
        this.ComID = ComID;
        this.companyName = companyName;
        this.JobID = JobID;
        this.isdeleted = isdeleted;
    }
    
    
    
    public JobPost(String Description, String Title, int Salary, String PostedDate, String Requirements, String ComID, int JobID ) {
        this.Description = Description;
        this.Title = Title;
        this.Salary = Salary;
        this.PostedDate = PostedDate;
        this.Requirements = Requirements;
        this.ComID = ComID;
        this.JobID = JobID;
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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public boolean isIsdeleted() {
        return isdeleted;
    }

    public void setIsdeleted(boolean isdeleted) {
        this.isdeleted = isdeleted;
    }

    public int getJobID() {
        return JobID;
    }

    public void setJobID(int JobID) {
        this.JobID = JobID;
    }

    
    
    @Override
    public String toString() {
        return "JobPost{" + "jobPostID=" + jobPostID + ", Description=" + Description + ", Title=" + Title + ", Salary=" + Salary + ", PostedDate=" + PostedDate + ", Requirements=" + Requirements + ", ComID=" + ComID + ", companyName=" + companyName + ", isdeleted=" + isdeleted + '}';
    }

    
    
    
}

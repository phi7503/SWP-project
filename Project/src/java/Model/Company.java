/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author FPT
 */
public class Company {
    private String ComID;
    private String Email;
    private String Password;
    private String Location;
    private int Phone;
    private String Website;
    private String ComName;

    public Company() {
    }

    public Company(String ComID, String Email, String Password, String Location, int Phone, String Website, String ComName) {
        this.ComID = ComID;
        this.Email = Email;
        this.Password = Password;
        this.Location = Location;
        this.Phone = Phone;
        this.Website = Website;
        this.ComName = ComName;
    }

    public String getComID() {
        return ComID;
    }

    public void setComID(String ComID) {
        this.ComID = ComID;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String Location) {
        this.Location = Location;
    }

    public int getPhone() {
        return Phone;
    }

    public void setPhone(int Phone) {
        this.Phone = Phone;
    }

    public String getWebsite() {
        return Website;
    }

    public void setWebsite(String Website) {
        this.Website = Website;
    }

    public String getComName() {
        return ComName;
    }

    public void setComName(String ComName) {
        this.ComName = ComName;
    }

    
    
}

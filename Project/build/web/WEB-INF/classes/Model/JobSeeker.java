/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author FPT
 */
public class JobSeeker {
    
    private String Username;
    private String Fullname;
    private String Email;
    private String Password;
    private int Phone;
    private boolean Gender;
    private String Address;
    private String DoB;

    public JobSeeker() {
    }

    public JobSeeker(String Username, String Fullname, String Email, String Password, int Phone, boolean Gender, String Address, String DoB) {
        this.Username = Username;
        this.Fullname = Fullname;
        this.Email = Email;
        this.Password = Password;
        this.Phone = Phone;
        this.Gender = Gender;
        this.Address = Address;
        this.DoB = DoB;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String Fullname) {
        this.Fullname = Fullname;
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

    public int getPhone() {
        return Phone;
    }

    public void setPhone(int Phone) {
        this.Phone = Phone;
    }

    public boolean isGender() {
        return Gender;
    }

    public void setGender(boolean Gender) {
        this.Gender = Gender;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getDoB() {
        return DoB;
    }

    public void setDoB(String DoB) {
        this.DoB = DoB;
    }

    

   
    
    
}

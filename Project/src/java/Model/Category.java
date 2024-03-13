/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Category {
    String CategoryName;
    String Description;

    public Category() {
    }

    public Category(String CategoryName, String Description) {
        this.CategoryName = CategoryName;
        this.Description = Description;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    @Override
    public String toString() {
        return "Category{" + "CategoryName=" + CategoryName + ", Description=" + Description + '}';
    }
    
    
}

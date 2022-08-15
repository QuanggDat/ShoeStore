/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class Product {
    private int id;
    private String description;
    private double price;
    private double discount;

    public Product() {
    }

    public Product(int id, String description, double price, double discount) {
        this.id = id;
        this.description = description;
        this.price = price;
        this.discount = discount;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", description=" + description + ", price=" + price + ", discount=" + discount + '}';
    }

 

   
    
    
}

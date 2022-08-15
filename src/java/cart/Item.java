/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class Item {
    private int id;
    private String description;
    private double price;
    private double discount;
    private int quantity;

    public Item() {
    }

    public Item(int id, String description, double price, double discount, int quantity) {
        this.id = id;
        this.description = description;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double getNewPrice(){
        return price * (1-discount); // 1 la 100%
    }
    
    public double getCost(){
        return this.getNewPrice()*quantity;
    }
}

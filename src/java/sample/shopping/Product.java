/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author NGUYENTRAN
 */
public class Product {

    private String productID;
    private String name;
    private double price;
    private int quantity;
    private String picture;
    private String brand;

    public Product() {
    }

    public Product(String id, String name, double price, int quantity, String picture, String brand) {
        this.productID = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.picture = picture;
        this.brand = brand;
    }


    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + productID + ", name=" + name + ", price=" + price + ", quantity=" + quantity + '}';
    }

    
}

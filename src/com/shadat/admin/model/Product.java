package com.shadat.admin.model;

public class Product {
    private int id,stock;
    private String title,description,thumbnail;
    private double price,discount;
    private boolean available;

    public Product(int id, String title, String description, String thumbnail, double price, double discount, boolean available, int stock) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.thumbnail = thumbnail;
        this.price = price;
        this.discount = discount;
        this.available = available;
        this.stock = stock;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Product(String title, String description, String thumbnail, double price, double discount, boolean available, int stock) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.thumbnail = thumbnail;
        this.price = price;
        this.discount = discount;
        this.available = available;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
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

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", stock=" + stock +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                ", available=" + available +
                '}';
    }
}

package com.shadat.admin.model;

public class DeliveryMethod {
    int id;
    String deliveryMethodTitle,deliveryTime;

    public DeliveryMethod(int id, String deliveryMethodTitle, String deliveryTime) {
        this.id = id;
        this.deliveryMethodTitle = deliveryMethodTitle;
        this.deliveryTime = deliveryTime;
    }

    public DeliveryMethod(String deliveryMethodTitle, String deliveryTime) {
        this.deliveryMethodTitle = deliveryMethodTitle;
        this.deliveryTime = deliveryTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDeliveryMethodTitle() {
        return deliveryMethodTitle;
    }

    public void setDeliveryMethodTitle(String deliveryMethodTitle) {
        this.deliveryMethodTitle = deliveryMethodTitle;
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }
}

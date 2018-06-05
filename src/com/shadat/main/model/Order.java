package com.shadat.main.model;

public class Order {
    private OrderUserDetail orderUserDetail;
    private int deliveryMethodId,paymentMethodId;
    String status;
    private long orderId;
    private String orderNumber;
    Cart cart;
    private long orderTime;


    public Order(OrderUserDetail orderUserDetail, int deliveryMethodId, int paymentMethodId, Cart cart) {
        this.orderUserDetail = orderUserDetail;
        this.deliveryMethodId = deliveryMethodId;
        this.paymentMethodId = paymentMethodId;
        this.cart = cart;
    }

    public OrderUserDetail getOrderUserDetail() {
        return orderUserDetail;
    }

    public void setOrderUserDetail(OrderUserDetail orderUserDetail) {
        this.orderUserDetail = orderUserDetail;
    }

    public int getDeliveryMethodId() {
        return deliveryMethodId;
    }

    public void setDeliveryMethodId(int deliveryMethodId) {
        this.deliveryMethodId = deliveryMethodId;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public long getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(long orderTime) {
        this.orderTime = orderTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

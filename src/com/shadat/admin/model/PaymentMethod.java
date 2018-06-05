package com.shadat.admin.model;

public class PaymentMethod {
    int id;
    String title,mobileNo;


    public PaymentMethod(int id, String title, String mobileNo) {
        this.id = id;
        this.title = title;
        this.mobileNo = mobileNo;
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

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }


}

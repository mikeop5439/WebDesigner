package com.webdesign.bean.analysis;

import java.util.Date;

public class User_prod {
    private int user_id;
    private int prod_id;
    private Date used_date;
    private int value;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProd_id() {
        return prod_id;
    }

    public void setProd_id(int prod_id) {
        this.prod_id = prod_id;
    }

    public Date getUsed_date() {
        return used_date;
    }

    public void setUsed_date(Date used_date) {
        this.used_date = used_date;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "User_prod{" +
                "user_id=" + user_id +
                ", prod_id=" + prod_id +
                ", used_date=" + used_date +
                ", value=" + value +
                '}';
    }
}

package com.webdesign.bean.analysis.extend;

public class UserNameAndProdId {
    private String user_name;
    private int prod_id;

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getProd_id() {
        return prod_id;
    }

    public void setProd_id(int prod_id) {
        this.prod_id = prod_id;
    }

    @Override
    public String toString() {
        return "UserNameAndProdId{" +
                "user_name='" + user_name + '\'' +
                ", prod_id=" + prod_id +
                '}';
    }
}


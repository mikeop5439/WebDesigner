package com.webdesign.bean.maker;

public class HtmlAndUserIdAndProdId {
    private int user_id;
    private int prod_id;

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

    @Override
    public String toString() {
        return "HtmlAndUserIdAndProdId{" +
                "user_id=" + user_id +
                ", prod_id=" + prod_id +
                '}';
    }
}

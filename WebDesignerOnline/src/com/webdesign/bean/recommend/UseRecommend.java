package com.webdesign.bean.recommend;

public class UseRecommend {
    private long user_id;
    private float value;
    private long prod_id;

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public float getValue() {
        return value;
    }

    public void setValue(float value) {
        this.value = value;
    }

    public long getProd_id() {
        return prod_id;
    }

    public void setProd_id(long prod_id) {
        this.prod_id = prod_id;
    }

    @Override
    public String toString() {
        return "UseRecommend{" +
                "user_id=" + user_id +
                ", value=" + value +
                ", prod_id=" + prod_id +
                '}';
    }
}

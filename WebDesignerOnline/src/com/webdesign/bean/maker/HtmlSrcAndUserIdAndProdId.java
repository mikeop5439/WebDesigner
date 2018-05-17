package com.webdesign.bean.maker;

import java.util.Date;

public class HtmlSrcAndUserIdAndProdId {
    private int user_id;
    private int prod_id;
    private String src;
    private Date date;
    private String his_name;
    private String his_desc;

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

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getHis_name() {
        return his_name;
    }

    public void setHis_name(String his_name) {
        this.his_name = his_name;
    }

    public String getHis_desc() {
        return his_desc;
    }

    public void setHis_desc(String his_desc) {
        this.his_desc = his_desc;
    }

    @Override
    public String toString() {
        return "HtmlSrcAndUserIdAndProdId{" +
                "user_id=" + user_id +
                ", prod_id=" + prod_id +
                ", src='" + src + '\'' +
                ", date=" + date +
                ", his_name='" + his_name + '\'' +
                ", his_desc='" + his_desc + '\'' +
                '}';
    }
}

package com.webdesign.bean.users.extend;

import java.util.Date;

public class UsersRegisteredClass {
    private String user_name;
    private String user_password;
    private String user_tele;
    private Date user_register;

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return user_password;
    }

    public void setPassword(String password) {
        this.user_password = password;
    }

    public String getUser_tele() {
        return user_tele;
    }

    public void setUser_tele(String user_tele) {
        this.user_tele = user_tele;
    }

    public Date getUser_register() {
        return user_register;
    }

    public void setUser_register(Date user_register) {
        this.user_register = user_register;
    }

    @Override
    public String toString() {
        return "UsersRegisteredClass{" +
                "user_name='" + user_name + '\'' +
                ", user_password=" + user_password +
                ", user_tele='" + user_tele + '\'' +
                ", user_register=" + user_register +
                '}';
    }
}

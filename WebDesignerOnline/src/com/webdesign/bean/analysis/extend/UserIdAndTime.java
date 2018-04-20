package com.webdesign.bean.analysis.extend;

import java.util.Date;

public class UserIdAndTime {
    private int user_id;
    private Date user_accesstime;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getUser_accesstime() {
        return user_accesstime;
    }

    public void setUser_accesstime(Date user_accesstime) {
        this.user_accesstime = user_accesstime;
    }

    @Override
    public String toString() {
        return "UserIdAndTime{" +
                "user_id=" + user_id +
                ", user_accesstime=" + user_accesstime +
                '}';
    }
}

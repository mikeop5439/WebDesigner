package com.webdesign.bean.users;

import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2018/4/6.
 */

public class Provinces {
    private int id;
    private String provinceid;
    private String province;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProvinceid() {
        return provinceid;
    }

    public void setProvinceid(String provinceid) {
        this.provinceid = provinceid;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Override
    public String toString() {
        return "Provinces{" +
                "id=" + id +
                ", provinceid='" + provinceid + '\'' +
                ", province='" + province + '\'' +
                '}';
    }
}

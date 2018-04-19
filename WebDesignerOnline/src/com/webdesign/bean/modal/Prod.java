package com.webdesign.bean.modal;

import java.util.Date;

public class Prod {
    private int prod_id;
    private int spec_id;
    private String prod_name;
    private String prod_desc;
    private Date effect_date;
    private String prod_image_src;
    private String service_src;
    private int prod_status_cd;

    public int getProd_id() {
        return prod_id;
    }

    public void setProd_id(int prod_id) {
        this.prod_id = prod_id;
    }

    public int getSpec_id() {
        return spec_id;
    }

    public void setSpec_id(int spec_id) {
        this.spec_id = spec_id;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public String getProd_desc() {
        return prod_desc;
    }

    public void setProd_desc(String prod_desc) {
        this.prod_desc = prod_desc;
    }

    public Date getEffect_date() {
        return effect_date;
    }

    public void setEffect_date(Date effect_date) {
        this.effect_date = effect_date;
    }

    public String getProd_image_src() {
        return prod_image_src;
    }

    public void setProd_image_src(String prod_image_src) {
        this.prod_image_src = prod_image_src;
    }

    public String getService_src() {
        return service_src;
    }

    public void setService_src(String service_src) {
        this.service_src = service_src;
    }

    public int getProd_status_cd() {
        return prod_status_cd;
    }

    public void setProd_status_cd(int prod_status_cd) {
        this.prod_status_cd = prod_status_cd;
    }

    @Override
    public String toString() {
        return "Prod{" +
                "prod_id=" + prod_id +
                ", spec_id=" + spec_id +
                ", prod_name='" + prod_name + '\'' +
                ", prod_desc='" + prod_desc + '\'' +
                ", effect_date=" + effect_date +
                ", prod_image_src='" + prod_image_src + '\'' +
                ", service_src='" + service_src + '\'' +
                ", prod_status_cd=" + prod_status_cd +
                '}';
    }
}

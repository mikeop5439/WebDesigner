package com.webdesign.bean.classfiy;

public class Prod_spec {
    private int spec_id;
    private String spec_name;
    private String spec_desc;
    private int spec_status_cd;
    private String spec_image_src;

    public int getSpec_id() {
        return spec_id;
    }

    public void setSpec_id(int spec_id) {
        this.spec_id = spec_id;
    }

    public String getSpec_name() {
        return spec_name;
    }

    public void setSpec_name(String spec_name) {
        this.spec_name = spec_name;
    }

    public String getSpec_desc() {
        return spec_desc;
    }

    public void setSpec_desc(String spec_desc) {
        this.spec_desc = spec_desc;
    }

    public int getSpec_status_cd() {
        return spec_status_cd;
    }

    public void setSpec_status_cd(int spec_status_cd) {
        this.spec_status_cd = spec_status_cd;
    }

    public String getSpec_image_src() {
        return spec_image_src;
    }

    public void setSpec_image_src(String spec_image_src) {
        this.spec_image_src = spec_image_src;
    }

    @Override
    public String toString() {
        return "Prod_spec{" +
                "spec_id=" + spec_id +
                ", spec_name='" + spec_name + '\'' +
                ", spec_desc='" + spec_desc + '\'' +
                ", spec_status_cd=" + spec_status_cd +
                ", spec_image_src='" + spec_image_src + '\'' +
                '}';
    }
}

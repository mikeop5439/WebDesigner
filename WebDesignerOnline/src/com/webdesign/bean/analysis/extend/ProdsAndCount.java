package com.webdesign.bean.analysis.extend;

public class ProdsAndCount {
    private String prods_name;
    private int count;

    public String getProds_name() {
        return prods_name;
    }

    public void setProds_name(String prods_name) {
        this.prods_name = prods_name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "ProdsAndCount{" +
                "prods_name='" + prods_name + '\'' +
                ", count=" + count +
                '}';
    }
}

package com.webdesign.bean.seach;

import com.webdesign.service.saech.service.SeachService;

public class ClassfiyAndNowPage {
    private int spec_id;
    private int now_page;
    private int startindex;

    public int getSpec_id() {
        return spec_id;
    }

    public void setSpec_id(int spec_id) {
        this.spec_id = spec_id;
    }

    public int getNow_page() {
        return now_page;
    }

    public void setNow_page(int now_page) {
        this.now_page = now_page;
    }

    public int getStartindex() {
        return startindex;
    }

    public void setStartindex(int startindex) {
        this.startindex = startindex;
    }

    @Override
    public String toString() {
        return "ClassfiyAndNowPage{" +
                "spec_id=" + spec_id +
                ", now_page=" + now_page +
                ", startindex=" + startindex +
                '}';
    }
}

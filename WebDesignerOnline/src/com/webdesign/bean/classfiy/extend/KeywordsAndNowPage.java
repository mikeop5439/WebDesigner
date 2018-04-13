package com.webdesign.bean.classfiy.extend;

public class KeywordsAndNowPage {
    private String keywords;
    private int nowpage;
    private int startindex;

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public int getNowpage() {
        return nowpage;
    }

    public void setNowpage(int nowpage) {
        this.nowpage = nowpage;
    }

    public int getStartindex() {
        return startindex;
    }

    public void setStartindex(int startindex) {
        this.startindex = startindex;
    }

    @Override
    public String toString() {
        return "KeywordsAndNowPage{" +
                "keywords='" + keywords + '\'' +
                ", nowpage=" + nowpage +
                ", startindex=" + startindex +
                '}';
    }
}

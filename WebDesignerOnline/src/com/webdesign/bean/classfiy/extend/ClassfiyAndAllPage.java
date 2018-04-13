package com.webdesign.bean.classfiy.extend;

import com.webdesign.bean.classfiy.Prod_spec;

import java.util.List;

public class ClassfiyAndAllPage {
    private List<Prod_spec> classfiy;
    private int allpage;

    public List<Prod_spec> getClassfiy() {
        return classfiy;
    }

    public void setClassfiy(List<Prod_spec> classfiy) {
        this.classfiy = classfiy;
    }

    public int getAllpage() {
        return allpage;
    }

    public void setAllpage(int allpage) {
        this.allpage = allpage;
    }

    @Override
    public String toString() {
        return "ClassfiyAndAllPage{" +
                "classfiy=" + classfiy +
                ", allpage=" + allpage +
                '}';
    }
}

package com.webdesign.bean.modal.extend;

import com.webdesign.bean.modal.Prod;

import java.util.List;

public class ProdAndAllPage {
     private List<Prod> prods;
     private int allpage;

    public List<Prod> getProds() {
        return prods;
    }

    public void setProds(List<Prod> prods) {
        this.prods = prods;
    }

    public int getAllpage() {
        return allpage;
    }

    public void setAllpage(int allpage) {
        this.allpage = allpage;
    }

    @Override
    public String toString() {
        return "ProdAndAllPage{" +
                "prods=" + prods +
                ", allpage=" + allpage +
                '}';
    }
}

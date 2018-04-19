package com.webdesign.bean.modal.extend;

import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.modal.Prod;

import java.util.List;

public class ProdAndClassfiy extends Prod{
    private Prod_spec prod_spec;
    private List<Prod_spec> list_spec;

    public Prod_spec getProd_spec() {
        return prod_spec;
    }

    public void setProd_spec(Prod_spec prod_spec) {
        this.prod_spec = prod_spec;
    }

    public List<Prod_spec> getList_spec() {
        return list_spec;
    }

    public void setList_spec(List<Prod_spec> list_spec) {
        this.list_spec = list_spec;
    }

    @Override
    public String toString() {
        return "ProdAndClassfiy{" +
                "prod_spec=" + prod_spec +
                ", list_spec=" + list_spec +
                '}';
    }
}


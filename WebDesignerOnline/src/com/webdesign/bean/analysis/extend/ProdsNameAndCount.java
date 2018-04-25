package com.webdesign.bean.analysis.extend;

import java.util.List;

public class ProdsNameAndCount {
    private List<ProdsAndCount> prodsAndCounts;
    private List<ProdsAndCount> classfiyAndCounts;

    public List<ProdsAndCount> getProdsAndCounts() {
        return prodsAndCounts;
    }

    public void setProdsAndCounts(List<ProdsAndCount> prodsAndCounts) {
        this.prodsAndCounts = prodsAndCounts;
    }

    public List<ProdsAndCount> getClassfiyAndCounts() {
        return classfiyAndCounts;
    }

    public void setClassfiyAndCounts(List<ProdsAndCount> classfiyAndCounts) {
        this.classfiyAndCounts = classfiyAndCounts;
    }

    @Override
    public String toString() {
        return "ProdsNameAndCount{" +
                "prodsAndCounts=" + prodsAndCounts +
                ", classfiyAndCounts=" + classfiyAndCounts +
                '}';
    }
}

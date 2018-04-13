package com.webdesign.service.classfiy.service;

import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.classfiy.extend.KeywordsAndNowPage;

import java.util.List;

public interface ClassfiyService {
    //查询分类(分页)
    public List<Prod_spec> queryClassLimit(int startindex);
    //查询分类总数
    public  int queryClassCount();
    //搜索分类(分页)
    public List<Prod_spec> seachClassLimit(KeywordsAndNowPage keywordsAndNowPage);
    //搜索分类总数
    public int seachClassCount(KeywordsAndNowPage keywordsAndNowPage);
    //查询分类
    public Prod_spec queryClassById(int spec_id);
    //修改分类信息
    public void updateClass(Prod_spec prod_spec);
    //新增分类信息
    public void insertClass(Prod_spec prod_spec);
}

package com.webdesign.mapper.modal;

import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.classfiy.extend.KeywordsAndNowPage;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.modal.extend.ProdAndClassfiy;

import java.util.List;

public interface ModalMapper {
    //查询模板（分页）
    public List<Prod> queryModalLimit(int startindex);
    //查询模板总数
    public int queryModalCount();
    //查询模板
    public ProdAndClassfiy queryModalById(int prod_id);
    //查询全部分类
    public List<Prod_spec> queryAllClass();
    //修改模板信息
    public void  updateModal(Prod prod);
    //搜索模板总数
    public int seachModalCount(KeywordsAndNowPage keywordsAndNowPage);
    //搜索模板(分页)
    public List<Prod> seachModalLimit(KeywordsAndNowPage keywordsAndNowPage);
    //新增模板信息
    public void insertModal(Prod prod);
    //通过名字搜索模板
    public int seachModalByName(KeywordsAndNowPage keywordsAndNowPage);
    //删除模板
    public void deleteModal(int prod_id);
}

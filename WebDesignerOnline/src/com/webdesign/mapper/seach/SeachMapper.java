package com.webdesign.mapper.seach;

import com.webdesign.bean.analysis.User_prod;
import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.seach.ClassfiyAndNowPage;

import java.util.List;

public interface SeachMapper {
    //搜索分类
    public List<Prod_spec> seachClassfiy();
    //查询分类下的模板
    public List<Prod> queryModalByClassfiy(ClassfiyAndNowPage classfiyAndNowPagePage);
    //查询分类下的模板总数
    public int queryModalByClassfiyCount(ClassfiyAndNowPage classfiyAndNowPagePage);
    //模板使用记录
    public void insertUserProd(User_prod user_prod);
}

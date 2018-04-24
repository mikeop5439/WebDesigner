package com.webdesign.service.saech.service;

import com.webdesign.bean.analysis.User_prod;
import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.seach.ClassfiyAndNowPage;
import com.webdesign.mapper.seach.SeachMapper;
import org.apache.tools.ant.taskdefs.Pack;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public interface SeachService {
    //搜索分类
    public List<Prod_spec> seachClassfiy();
    //查询分类下的模板
    public List<Prod> queryModalByClassfiy(ClassfiyAndNowPage classfiyAndNowPagePage);
    //查询分类下的模板总数
    public int queryModalByClassfiyCount(ClassfiyAndNowPage classfiyAndNowPagePage);
    //模板使用记录
    public void insertUserProd(User_prod user_prod);

}

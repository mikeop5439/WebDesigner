package com.webdesign.service.saech.serviceimpl;

import com.webdesign.bean.analysis.User_prod;
import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.seach.ClassfiyAndNowPage;
import com.webdesign.mapper.seach.SeachMapper;
import com.webdesign.service.saech.service.SeachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SeachServiceImpl implements SeachService {
    @Autowired
    private SeachMapper seachMapper;

    @Override
    public List<Prod_spec> seachClassfiy() {
        return seachMapper.seachClassfiy();
    }

    @Override
    public List<Prod> queryModalByClassfiy(ClassfiyAndNowPage classfiyAndNowPagePage) {
        return seachMapper.queryModalByClassfiy(classfiyAndNowPagePage);
    }

    @Override
    public int queryModalByClassfiyCount(ClassfiyAndNowPage classfiyAndNowPagePage) {
        return seachMapper.queryModalByClassfiyCount(classfiyAndNowPagePage);
    }

    @Override
    public void insertUserProd(User_prod user_prod) {
        seachMapper.insertUserProd(user_prod);
    }
}

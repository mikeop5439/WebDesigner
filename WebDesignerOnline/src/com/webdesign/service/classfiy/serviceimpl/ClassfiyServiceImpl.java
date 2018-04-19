package com.webdesign.service.classfiy.serviceimpl;

import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.classfiy.extend.KeywordsAndNowPage;
import com.webdesign.mapper.classfiy.ClassfiyMapper;
import com.webdesign.mapper.users.UserLoginAndRegisteredMapper;
import com.webdesign.service.classfiy.service.ClassfiyService;
import org.aspectj.apache.bcel.util.ClassPath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassfiyServiceImpl implements ClassfiyService {
    @Autowired
    private ClassfiyMapper classfiyMapper;

    @Override
    public List<Prod_spec> queryClassLimit(int startindex) {
        return classfiyMapper.queryClassLimit(startindex);
    }

    @Override
    public int queryClassCount() {
        return classfiyMapper.queryClassCount();
    }

    @Override
    public List<Prod_spec> seachClassLimit(KeywordsAndNowPage keywordsAndNowPage) {
        return classfiyMapper.seachClassLimit(keywordsAndNowPage);
    }

    @Override
    public int seachClassCount(KeywordsAndNowPage keywordsAndNowPage) {
        return classfiyMapper.seachClassCount(keywordsAndNowPage);
    }

    @Override
    public Prod_spec queryClassById(int spec_id) {
        return classfiyMapper.queryClassById(spec_id);
    }

    @Override
    public void updateClass(Prod_spec prod_spec) {
        classfiyMapper.updateClass(prod_spec);
    }

    @Override
    public void insertClass(Prod_spec prod_spec) {
        classfiyMapper.insertClass(prod_spec);
    }

    @Override
    public int seachClassByName(KeywordsAndNowPage keywordsAndNowPage) {
        return classfiyMapper.seachClassByName(keywordsAndNowPage);
    }
}

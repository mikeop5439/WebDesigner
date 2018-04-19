package com.webdesign.service.modal.serviceimpl;

import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.classfiy.extend.KeywordsAndNowPage;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.modal.extend.ProdAndClassfiy;
import com.webdesign.mapper.modal.ModalMapper;
import com.webdesign.service.modal.service.ModalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MoadlServiceImpl implements ModalService {
    @Autowired
    private ModalMapper modalMapper;


    @Override
    public List<Prod> queryModalLimit(int startindex) {
        return modalMapper.queryModalLimit(startindex);
    }

    @Override
    public int queryModalCount() {
        return modalMapper.queryModalCount();
    }

    @Override
    public ProdAndClassfiy queryModalById(int prod_id) {
        return modalMapper.queryModalById(prod_id);
    }

    @Override
    public List<Prod_spec> queryAllClass() {
        return modalMapper.queryAllClass();
    }

    @Override
    public void updateModal(Prod prod) {
        modalMapper.updateModal(prod);
    }

    @Override
    public int seachModalCount(KeywordsAndNowPage keywordsAndNowPage) {
        return modalMapper.seachModalCount(keywordsAndNowPage);
    }

    @Override
    public List<Prod> seachModalLimit(KeywordsAndNowPage keywordsAndNowPage) {
        return modalMapper.seachModalLimit(keywordsAndNowPage);
    }

    @Override
    public void insertModal(Prod prod) {
        modalMapper.insertModal(prod);
    }

    @Override
    public int seachModalByName(KeywordsAndNowPage keywordsAndNowPage) {
        return modalMapper.seachModalByName(keywordsAndNowPage);
    }
}

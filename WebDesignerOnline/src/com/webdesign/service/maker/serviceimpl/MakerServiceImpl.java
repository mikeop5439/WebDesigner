package com.webdesign.service.maker.serviceimpl;

import com.webdesign.bean.maker.His_mark;
import com.webdesign.bean.maker.HtmlAndUserIdAndProdId;
import com.webdesign.bean.maker.HtmlSrcAndUserIdAndProdId;
import com.webdesign.mapper.maker.MakerMapper;
import com.webdesign.service.maker.service.MakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MakerServiceImpl implements MakerService {
    @Autowired
    private MakerMapper makerMapper;

    @Override
    public int selectHis(HtmlAndUserIdAndProdId htmlAndUserIdAndProdId) {
        return makerMapper.selectHis(htmlAndUserIdAndProdId);
    }

    @Override
    public void deleteHis(HtmlAndUserIdAndProdId htmlAndUserIdAndProdId) {
        makerMapper.deleteHis(htmlAndUserIdAndProdId);
    }

    @Override
    public void insertHis(HtmlSrcAndUserIdAndProdId htmlSrcAndUserIdAndProdId) {
        makerMapper.insertHis(htmlSrcAndUserIdAndProdId);
    }

    @Override
    public List<His_mark> selectUserHis(HtmlAndUserIdAndProdId htmlAndUserIdAndProdId) {
        return makerMapper.selectUserHis(htmlAndUserIdAndProdId);
    }
}

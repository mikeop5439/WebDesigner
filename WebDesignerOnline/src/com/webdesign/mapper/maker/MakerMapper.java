package com.webdesign.mapper.maker;

import com.webdesign.bean.maker.His_mark;
import com.webdesign.bean.maker.HtmlAndUserIdAndProdId;
import com.webdesign.bean.maker.HtmlSrcAndUserIdAndProdId;

import java.util.List;

public interface MakerMapper {
    //查询是否已有历史记录
    public int selectHis(HtmlAndUserIdAndProdId htmlAndUserIdAndProdId);
    //删除已有历史记录
    public void deleteHis(HtmlAndUserIdAndProdId htmlAndUserIdAndProdId);
    //插入历史记录
    public void insertHis(HtmlSrcAndUserIdAndProdId htmlSrcAndUserIdAndProdId);
    //查询用户的历史记录
    public List<His_mark> selectUserHis(HtmlAndUserIdAndProdId htmlAndUserIdAndProdId);
}

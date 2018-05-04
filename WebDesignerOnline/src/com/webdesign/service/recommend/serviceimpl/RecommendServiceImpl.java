package com.webdesign.service.recommend.serviceimpl;

import com.webdesign.bean.analysis.User_prod;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.recommend.UseRecommend;
import com.webdesign.bean.users.User;
import com.webdesign.mapper.recommend.RecommendMapper;
import com.webdesign.service.recommend.service.RecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecommendServiceImpl implements RecommendService {
    @Autowired
    private RecommendMapper recommendMapper;
    @Override
    public List<User_prod> queryUserProd() {
        return recommendMapper.queryUserProd();
    }

    @Override
    public void insertRecommend(UseRecommend useRecommend) {
        recommendMapper.insertRecommend(useRecommend);
    }

    @Override
    public void deleteRecommend() {
        recommendMapper.deleteRecommend();
    }

    @Override
    public List<Integer> queryRecommendByUserId(int user_id) {
        return recommendMapper.queryRecommendByUserId(user_id);
    }

    @Override
    public List<Prod> queryProdById(List<Integer> prod_id) {
        return recommendMapper.queryProdById(prod_id);
    }

    @Override
    public List<Prod> queryProd4() {
        return recommendMapper.queryProd4();
    }


}

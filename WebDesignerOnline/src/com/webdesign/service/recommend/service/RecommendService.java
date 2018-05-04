package com.webdesign.service.recommend.service;

import com.webdesign.bean.analysis.User_prod;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.recommend.UseRecommend;
import com.webdesign.bean.users.User;

import java.util.List;

public interface RecommendService {
    //查询用户使用记录
    public List<User_prod> queryUserProd();
    //插入推荐信息
    public void insertRecommend(UseRecommend useRecommend);
    //清表
    public void deleteRecommend();
    //根据用户查询推荐模板
    public List<Integer> queryRecommendByUserId(int user_id);
    //根据Prod_id查询模板
    public List<Prod> queryProdById(List<Integer> prod_id);
    //查询前四模板
    public List<Prod> queryProd4();

}

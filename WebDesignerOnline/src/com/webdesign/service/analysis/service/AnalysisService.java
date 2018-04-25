package com.webdesign.service.analysis.service;

import com.webdesign.bean.analysis.extend.DateAndCount;
import com.webdesign.bean.analysis.extend.ProdsAndCount;
import com.webdesign.bean.analysis.extend.UserIdAndTime;

import java.util.List;

public interface AnalysisService {
    //用户登录记录
    public void loginRmark(UserIdAndTime userIdAndTime);
    //查询用户id
    public int queryUserId(String user_name);
    //查询每日的访问数
    public List<DateAndCount> queryDateTraffic();
    //查询使用量前十的模板
    public List<ProdsAndCount> queryTopModals();
    //查询使用量前十的分类
    public List<ProdsAndCount> queryTopClassfiy();
}

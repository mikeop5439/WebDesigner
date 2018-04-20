package com.webdesign.service.analysis.service;

import com.webdesign.bean.analysis.extend.DateAndCount;
import com.webdesign.bean.analysis.extend.UserIdAndTime;

import java.util.List;

public interface AnalysisService {
    //用户登录记录
    public void loginRmark(UserIdAndTime userIdAndTime);
    //查询用户id
    public int queryUserId(String user_name);
    //查询每日的访问数
    public List<DateAndCount> queryDateTraffic();
}

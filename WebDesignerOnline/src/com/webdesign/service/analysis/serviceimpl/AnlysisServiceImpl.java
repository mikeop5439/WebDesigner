package com.webdesign.service.analysis.serviceimpl;

import com.webdesign.bean.analysis.extend.DateAndCount;
import com.webdesign.bean.analysis.extend.ProdsAndCount;
import com.webdesign.bean.analysis.extend.UserIdAndTime;
import com.webdesign.mapper.analysis.AnalysisMapper;
import com.webdesign.service.analysis.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnlysisServiceImpl implements AnalysisService {
    @Autowired
    private AnalysisMapper analysisMapper;

    @Override
    public void loginRmark(UserIdAndTime userIdAndTime) {
        analysisMapper.loginRmark(userIdAndTime);
    }

    @Override
    public int queryUserId(String user_name) {
        return analysisMapper.queryUserId(user_name);
    }

    @Override
    public List<DateAndCount> queryDateTraffic() {
        return analysisMapper.queryDateTraffic();
    }

    @Override
    public List<ProdsAndCount> queryTopModals() {
        return analysisMapper.queryTopModals();
    }

    @Override
    public List<ProdsAndCount> queryTopClassfiy() {
        return analysisMapper.queryTopClassfiy();
    }
}

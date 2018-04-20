package com.webdesign.controller.analysis;

import com.webdesign.bean.analysis.extend.DateAndCount;
import com.webdesign.service.analysis.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("analysis")
public class AnalysisConroller {
    @Autowired
    private AnalysisService analysisService;
    //查询分类总数
    @RequestMapping("dateAnalysis")
    public @ResponseBody
    List<DateAndCount> dateAnalysis(){
        return  analysisService.queryDateTraffic();
    }
}

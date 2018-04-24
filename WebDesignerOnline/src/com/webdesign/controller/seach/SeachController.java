package com.webdesign.controller.seach;

import com.webdesign.bean.analysis.User_prod;
import com.webdesign.bean.analysis.extend.UserNameAndProdId;
import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.classfiy.extend.KeywordsAndNowPage;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.modal.extend.ProdAndAllPage;
import com.webdesign.bean.seach.ClassfiyAndNowPage;
import com.webdesign.service.analysis.service.AnalysisService;
import com.webdesign.service.saech.service.SeachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("seach")
public class SeachController {
    @Autowired
    private SeachService seachService;
    @Autowired
    private AnalysisService analysisService;

    //查询所有分类
    @RequestMapping("queryAllClassfiy")
    public @ResponseBody List<Prod_spec> queryAllClassfiy(){
        return  seachService.seachClassfiy();
    }
    //查询分类下的模板
    @RequestMapping("queryModalByClassfiy")
    public @ResponseBody ProdAndAllPage queryModalByClassfiy(Model model, @RequestBody ClassfiyAndNowPage classfiyAndNowPage){
        int nowpage;
        if(classfiyAndNowPage.getNow_page()==0){
            nowpage=1;
        }else{
            nowpage=classfiyAndNowPage.getNow_page();
        }
        int startindex=8*(nowpage-1);
        double count=seachService.queryModalByClassfiyCount(classfiyAndNowPage);
        int allpage=(int) Math.ceil(count/8.0);

        classfiyAndNowPage.setStartindex(startindex);
        ProdAndAllPage prodAndAllPage=new ProdAndAllPage();
        prodAndAllPage.setAllpage(allpage);
        prodAndAllPage.setProds(seachService.queryModalByClassfiy(classfiyAndNowPage));
        return prodAndAllPage;
    }
    //跳转模板页面
    @RequestMapping("toModal")
    public  String toModal(RedirectAttributes model, int spec_id, HttpServletRequest request){
        model.addAttribute("spec_id",spec_id);
        return "redirect:/fe/modal.jsp";
    }
    //记录模板使用历史
    @RequestMapping("insertUserProd")
    public  @ResponseBody void insertUserProd(@RequestBody UserNameAndProdId userNameAndProdId){
        User_prod user_prod=new User_prod();
        Date date=new Date();
        user_prod.setUsed_date(date);
        user_prod.setProd_id(userNameAndProdId.getProd_id());
        user_prod.setUser_id(analysisService.queryUserId(userNameAndProdId.getUser_name()));
        seachService.insertUserProd(user_prod);
    }
}

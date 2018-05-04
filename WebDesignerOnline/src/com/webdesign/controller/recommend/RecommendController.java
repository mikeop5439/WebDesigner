package com.webdesign.controller.recommend;

import com.csvreader.CsvWriter;
import com.webdesign.bean.analysis.User_prod;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.recommend.UseRecommend;
import com.webdesign.service.recommend.service.RecommendService;
import com.webdesign.tools.UserBased;
import org.apache.mahout.cf.taste.common.TasteException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;

@Controller
@RequestMapping("recommend")
public class RecommendController {
    @Autowired
    private RecommendService recommendService;
    //修改分类信息
    @RequestMapping("setRecommend")
    public void setRecommend() throws IOException, TasteException {
        String csvFilePath = "D:\\IDEAWorkSpace\\git\\WebDesigner\\WebDesignerOnline\\src\\data\\testCF.csv";
        try {
            // 创建CSV写对象 例如:CsvWriter(文件路径，分隔符，编码格式);
            CsvWriter csvWriter = new CsvWriter(csvFilePath, ',', Charset.forName("UTF-8"));
            // 写表头
            /*String[] csvHeaders = { "编号", "姓名", "年龄" };
            csvWriter.writeRecord(csvHeaders);*/
            // 写内容
            for(User_prod attribute : recommendService.queryUserProd()) {
                String[] csvContent = { ""+attribute.getUser_id(), ""+attribute.getProd_id(),""+attribute.getValue()};
                csvWriter.writeRecord(csvContent);
            }
            csvWriter.close();
            System.out.println("--------CSV文件已经写入--------");
        }catch (IOException e) {
            e.printStackTrace();
        }

        recommendService.deleteRecommend();
        UserBased userBased=new UserBased();
        String file = "D:\\IDEAWorkSpace\\git\\WebDesigner\\WebDesignerOnline\\src\\data\\testCF.csv";
        for(UseRecommend attribute : userBased.userBase(file)) {
            recommendService.insertRecommend(attribute);
        }

    }
    //修改分类信息
    @RequestMapping("getRecommendByUserId")
    public @ResponseBody List<Prod> getRecommendByUserId(int user_id){
        List<Integer> prod_id=recommendService.queryRecommendByUserId(user_id);
        if (prod_id.isEmpty()){
            return recommendService.queryProd4();
        }else {
            return recommendService.queryProdById(prod_id);
        }
    }

}

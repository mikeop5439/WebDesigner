package com.webdesign.test;

import com.webdesign.bean.analysis.User_prod;
import com.webdesign.bean.modal.extend.ProdAndClassfiy;
import com.webdesign.bean.recommend.UseRecommend;
import com.webdesign.service.analysis.service.AnalysisService;
import com.webdesign.service.modal.service.ModalService;
import com.webdesign.service.recommend.service.RecommendService;
import com.webdesign.service.users.service.UserLoginAndRegisteredService;
import com.webdesign.tools.UserBased;
import com.webdesign.tools.ZipUtil;
import org.apache.mahout.cf.taste.common.TasteException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.csvreader.*;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;

/**
 * Created by Administrator on 2018/4/6.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:com/config/applicationContext.xml"})
public class AddTest {
    @Autowired
    private RecommendService recommendService;
    @Autowired
    private AnalysisService analysisService;
    /*@Test
    public void test1(){
        // 定义一个CSV路径
        String csvFilePath = "D://StemQ.csv";
        try {
            // 创建CSV写对象 例如:CsvWriter(文件路径，分隔符，编码格式);
            CsvWriter csvWriter = new CsvWriter(csvFilePath, ',', Charset.forName("UTF-8"));
            // 写表头
            String[] csvHeaders = { "编号", "姓名", "年龄" };
            csvWriter.writeRecord(csvHeaders);
            // 写内容
            for (int i = 0; i < 20; i++) {
                String[] csvContent = { i + "000000", "StemQ", "1" + i };
                csvWriter.writeRecord(csvContent);
            }
            csvWriter.close();
            System.out.println("--------CSV文件已经写入--------");
        }catch (IOException e) {
            e.printStackTrace();
        }
    }*/
    @Test
    public void test2() throws IOException, TasteException {
        recommendService.deleteRecommend();
        UserBased userBased=new UserBased();
        String file = "D:\\IDEAWorkSpace\\git\\WebDesigner\\WebDesignerOnline\\src\\data\\testC1.csv";
        for(UseRecommend attribute : userBased.userBase(file)) {
            recommendService.insertRecommend(attribute);
        }
    }
    @Test
    public void test3() throws IOException, TasteException {
        System.out.println("!!!!!!!!!!!!!"+recommendService.queryProd4());
    }
    @Test
    public void test() throws IOException, TasteException {
        System.out.println("!!!!!!!!!!!!!"+recommendService.queryUserProd());
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

        UserBased userBased=new UserBased();
        String file = "D:\\IDEAWorkSpace\\git\\WebDesigner\\WebDesignerOnline\\src\\data\\testCF.csv";
        System.out.println("!!!!!!!!!"+userBased.userBase(file));
    }

}

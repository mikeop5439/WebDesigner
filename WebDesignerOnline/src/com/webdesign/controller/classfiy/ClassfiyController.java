package com.webdesign.controller.classfiy;

import com.webdesign.bean.classfiy.Prod_spec;
import com.webdesign.bean.classfiy.extend.ClassfiyAndAllPage;
import com.webdesign.bean.classfiy.extend.KeywordsAndNowPage;
import com.webdesign.service.classfiy.service.ClassfiyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("classfiy")
public class ClassfiyController {
    @Autowired
    private ClassfiyService classfiyService;


    //查询分类（分页）
    @RequestMapping("queryClassLimit")
    public @ResponseBody ClassfiyAndAllPage queryClassLimit(Model model, int nowpage){
        int startindex=12*(nowpage-1);
        double count=classfiyService.queryClassCount();
        int allpage=(int) Math.ceil(count/12.0);
        ClassfiyAndAllPage classfiyAndAllPage =new ClassfiyAndAllPage();
        classfiyAndAllPage.setClassfiy(classfiyService.queryClassLimit(startindex));
        classfiyAndAllPage.setAllpage(allpage);
        return classfiyAndAllPage;
    }

    //查询分类总数
    @RequestMapping("queryClassCount")
    public @ResponseBody int queryClassCount(){
        double count=classfiyService.queryClassCount();
        int allpage=(int) Math.ceil(count/12.0);
        return allpage;
    }
    //搜索分类（分页）
    @RequestMapping("seachClassLimit")
    public @ResponseBody ClassfiyAndAllPage seachClassLimit(Model model, @RequestBody KeywordsAndNowPage keywordsAndNowPage){
        int nowpage;
        if(keywordsAndNowPage.getNowpage()==0){
            nowpage=1;
        }else{
            nowpage=keywordsAndNowPage.getNowpage();
        }
        int startindex=12*(nowpage-1);
        double count=classfiyService.seachClassCount(keywordsAndNowPage);
        int allpage=(int) Math.ceil(count/12.0);

        keywordsAndNowPage.setStartindex(startindex);
        ClassfiyAndAllPage classfiyAndAllPage =new ClassfiyAndAllPage();
        classfiyAndAllPage.setClassfiy(classfiyService.seachClassLimit(keywordsAndNowPage));
        classfiyAndAllPage.setAllpage(allpage);
        return classfiyAndAllPage;
    }
    //用过ID查询分类
    @RequestMapping("queryClassById")
    public @ResponseBody  Prod_spec queryClassById(int spec_id){
        return classfiyService.queryClassById(spec_id);
    }
    //修改分类信息
    @RequestMapping("updateClass")
    public  @ResponseBody void  updateClass(@RequestParam(value = "classphoto",required = false)MultipartFile classphoto, HttpServletRequest request, Prod_spec prod_spec, HttpSession session){
        if (classphoto != null && classphoto.getOriginalFilename() != null) {
            if (!classphoto.isEmpty()) {
                try {
                    String path = session.getServletContext().getRealPath("/document/resource/classfiy/images");

                    String realName="";

                    realName = realName+prod_spec.getSpec_id()+".jpg";

                    String realFilePath = path+File.separator+realName;

                    String saveFilePath = File.separator+"document"+File.separator+"resource"+File.separator+"classfiy"+File.separator+"images"+File.separator+realName;

                    File file = new File(realFilePath);
                    classphoto.transferTo(file);
                    prod_spec.setSpec_image_src(saveFilePath);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        classfiyService.updateClass(prod_spec);
    }
    //新增分类信息
    @RequestMapping("insertClass")
    public  @ResponseBody void  insertClass(@RequestParam(value = "iclassphoto",required = false)MultipartFile iclassphoto, HttpServletRequest request, Prod_spec prod_spec, HttpSession session){
        if (iclassphoto != null && iclassphoto.getOriginalFilename() != null) {
            if (!iclassphoto.isEmpty()) {
                try {
                    classfiyService.insertClass(prod_spec);
                    KeywordsAndNowPage keywordsAndNowPage =new KeywordsAndNowPage();
                    keywordsAndNowPage.setKeywords(prod_spec.getSpec_name());

                    String path = session.getServletContext().getRealPath("/document/resource/classfiy/images");

                    String realName="";
                    realName = realName+classfiyService.seachClassByName(keywordsAndNowPage) +".jpg";

                    String realFilePath = path+File.separator+realName;

                    String saveFilePath = File.separator+"document"+File.separator+"resource"+File.separator+"classfiy"+File.separator+"images"+File.separator+realName;

                    File file = new File(realFilePath);
                    iclassphoto.transferTo(file);
                    prod_spec.setSpec_id(classfiyService.seachClassByName(keywordsAndNowPage));
                    prod_spec.setSpec_image_src(saveFilePath);
                    classfiyService.updateClass(prod_spec);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }else {
            String realName="none.png";
            String saveFilePath = File.separator+"document"+File.separator+"resource"+File.separator+"classfiy"+File.separator+"images"+File.separator+realName;
            prod_spec.setSpec_image_src(saveFilePath);
            classfiyService.insertClass(prod_spec);
        }

    }
}

package com.webdesign.controller.Maker;

import com.webdesign.bean.maker.His_mark;
import com.webdesign.bean.maker.HtmlAndUserIdAndProdId;
import com.webdesign.bean.maker.HtmlSrcAndUserIdAndProdId;
import com.webdesign.service.maker.service.MakerService;
import com.webdesign.tools.Ioliu;
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
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("maker")
public class MakerController {
    @Autowired
    private MakerService makerService;

    @RequestMapping("getMaker")
    public String getMaker(Model model, int user_id,int prod_id,HttpSession session) throws Exception {
        Ioliu ioliu=new Ioliu();
        String prod_ids=""+prod_id;
        String user_ids=""+user_id;
        String srcpath = session.getServletContext().getRealPath("/document/resource/prod/src")+File.separator+prod_ids;
        String despath = session.getServletContext().getRealPath("/document/resource/prod/user")+File.separator+user_ids+File.separator+prod_ids;
        String usepath=File.separator+"document"+File.separator+"resource"+File.separator+"prod"+File.separator+"user"+File.separator+user_ids+File.separator+prod_ids+File.separator+"index.jsp?user_id="+user_id;
        ioliu.copy(srcpath,despath);
        System.out.println("src:"+srcpath+"des:"+despath);
        return "redirect:/"+usepath;
    }

    //修改分类信息
    @RequestMapping("updateimg")
    public  @ResponseBody void  updateimg(@RequestParam(value = "classphoto",required = false) MultipartFile classphoto, HttpServletRequest request, String imgid,String user_id,String prod_id, HttpSession session){
        if (classphoto != null && classphoto.getOriginalFilename() != null) {
            if (!classphoto.isEmpty()) {
                try {
                    String path = session.getServletContext().getRealPath("/document/resource/prod/user/")+File.separator+user_id+File.separator+prod_id+File.separator+"images";

                    String realName="";

                    realName = realName+imgid+".jpg";

                    String realFilePath = path+File.separator+realName;

                    File file = new File(realFilePath);
                    classphoto.transferTo(file);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    //写入HTML页面
    @RequestMapping("getChangeHtml")
    public @ResponseBody String getChangeHtml(Model model,HttpSession session, @RequestBody String html,String prod_id,String user_id,String his_name,String his_desc){
        System.out.println(html);
/*
        FileWriter writer;
*/

        String html5="<!DOCTYPE html>";
        String html_heard="<html>";
        String html_tail="</html>";
        html=html5+html_heard+html+html_tail;
        user_id= String.valueOf(session.getAttribute("user_id"));
        String path = session.getServletContext().getRealPath("/document/resource/prod/user/")+File.separator+user_id+File.separator+prod_id+File.separator+"index.html";
        try {
            OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(path),"UTF-8");
            out.write(html);
            out.flush();
            out.close();
            /*writer = new FileWriter(path);
            writer.write(html);
            writer.flush();
            writer.close();*/

        }catch (IOException e){
            e.printStackTrace();
        }
        HtmlAndUserIdAndProdId htmlAndUserIdAndProdId=new HtmlAndUserIdAndProdId();
        htmlAndUserIdAndProdId.setProd_id(Integer.parseInt(prod_id));
        htmlAndUserIdAndProdId.setUser_id(Integer.parseInt(user_id));
        if(makerService.selectHis(htmlAndUserIdAndProdId)==0){
            Date date=new Date();
            String src = File.separator+"document"+File.separator+"resource"+File.separator+"prod"+File.separator+"user"+File.separator+user_id+File.separator+prod_id+File.separator+"index.html";
            HtmlSrcAndUserIdAndProdId htmlSrcAndUserIdAndProdId=new HtmlSrcAndUserIdAndProdId();
            htmlSrcAndUserIdAndProdId.setUser_id(Integer.parseInt(user_id));
            htmlSrcAndUserIdAndProdId.setProd_id(Integer.parseInt(prod_id));
            htmlSrcAndUserIdAndProdId.setDate(date);
            htmlSrcAndUserIdAndProdId.setSrc(src);
            htmlSrcAndUserIdAndProdId.setHis_name(his_name);
            htmlSrcAndUserIdAndProdId.setHis_desc(his_desc);
            makerService.insertHis(htmlSrcAndUserIdAndProdId);
        }else {
            makerService.deleteHis(htmlAndUserIdAndProdId);
            Date date=new Date();
            String src = File.separator+"document"+File.separator+"resource"+File.separator+"prod"+File.separator+"user"+File.separator+user_id+File.separator+prod_id+File.separator+"index.html";
            HtmlSrcAndUserIdAndProdId htmlSrcAndUserIdAndProdId=new HtmlSrcAndUserIdAndProdId();
            htmlSrcAndUserIdAndProdId.setUser_id(Integer.parseInt(user_id));
            htmlSrcAndUserIdAndProdId.setProd_id(Integer.parseInt(prod_id));
            htmlSrcAndUserIdAndProdId.setDate(date);
            htmlSrcAndUserIdAndProdId.setSrc(src);
            htmlSrcAndUserIdAndProdId.setHis_name(his_name);
            htmlSrcAndUserIdAndProdId.setHis_desc(his_desc);
            makerService.insertHis(htmlSrcAndUserIdAndProdId);
        }
        return null;
    }
    //跳转到成品页面
    @RequestMapping("getFinalHtml")
    public String getFinalHtml(Model model,HttpSession session,String user_id,String prod_id) throws Exception {
        user_id= String.valueOf(session.getAttribute("user_id"));
        String usepath=File.separator+"document"+File.separator+"resource"+File.separator+"prod"+File.separator+"user"+File.separator+user_id+File.separator+prod_id+File.separator+"index.html";
        return "redirect:/"+usepath;
    }
    //跳转到成品页面
    @RequestMapping("toHistory")
    public String toHistory(Model model,HttpSession session) throws Exception {
        String user_id= user_id= String.valueOf(session.getAttribute("user_id"));
        HtmlAndUserIdAndProdId htmlAndUserIdAndProdId=new HtmlAndUserIdAndProdId();
        htmlAndUserIdAndProdId.setUser_id(Integer.valueOf(user_id));
        List<His_mark> his_marks=makerService.selectUserHis(htmlAndUserIdAndProdId);
        model.addAttribute("his",his_marks);
        return "forward:/fe/history.jsp";
    }
}

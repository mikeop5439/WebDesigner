package com.webdesign.controller.Maker;

import com.webdesign.service.maker.service.MakerService;
import com.webdesign.tools.Ioliu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

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
}

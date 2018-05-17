package com.webdesign.controller.modal;

import com.webdesign.bean.classfiy.extend.KeywordsAndNowPage;
import com.webdesign.bean.modal.Prod;
import com.webdesign.bean.modal.extend.ProdAndAllPage;
import com.webdesign.bean.modal.extend.ProdAndClassfiy;
import com.webdesign.service.modal.service.ModalService;
import com.webdesign.tools.DeleteFiles;
import com.webdesign.tools.ZipUtil;
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
import java.util.Date;

@Controller
@RequestMapping("modal")
public class ModalController {
    @Autowired
    private ModalService modalService;

    //查询分类（分页）
    @RequestMapping("queryModalLimit")
    public @ResponseBody ProdAndAllPage queryModalLimit(Model model, int nowpage){
        if(nowpage==0){
            nowpage=1;
        }else{
            nowpage=nowpage;
        }
        int startindex=12*(nowpage-1);
        double count=modalService.queryModalCount();
        int allpage=(int) Math.ceil(count/12.0);
        ProdAndAllPage prodAndAllPage =new ProdAndAllPage();
        prodAndAllPage.setProds(modalService.queryModalLimit(startindex));
        prodAndAllPage.setAllpage(allpage);
        return prodAndAllPage;
    }
    //搜索分类（分页）
    @RequestMapping("seachModalLimit")
    public @ResponseBody ProdAndAllPage seachModalLimit(Model model, @RequestBody KeywordsAndNowPage keywordsAndNowPage){
        int nowpage;
        if(keywordsAndNowPage.getNowpage()==0){
            nowpage=1;
        }else{
            nowpage=keywordsAndNowPage.getNowpage();
        }
        int startindex=12*(nowpage-1);
        double count=modalService.seachModalCount(keywordsAndNowPage);
        int allpage=(int) Math.ceil(count/12.0);

        keywordsAndNowPage.setStartindex(startindex);
        ProdAndAllPage prodAndAllPage=new ProdAndAllPage();
        prodAndAllPage.setProds(modalService.seachModalLimit(keywordsAndNowPage));
        prodAndAllPage.setAllpage(allpage);
        return prodAndAllPage;
    }
    //用过ID查询模板
    @RequestMapping("queryModalById")
    public @ResponseBody ProdAndClassfiy queryModalById(int prod_id){
        ProdAndClassfiy prodAndClassfiy=new ProdAndClassfiy();
        prodAndClassfiy=modalService.queryModalById(prod_id);
        prodAndClassfiy.setProd_spec(modalService.queryModalById(prod_id).getProd_spec());
        prodAndClassfiy.setList_spec(modalService.queryAllClass());
        return prodAndClassfiy;
    }
    //修改分类信息
    @RequestMapping("updateModal")
    public  @ResponseBody void  updateModal(@RequestParam(value = "classphoto",required = false) MultipartFile classphoto, HttpServletRequest request, Prod prod, HttpSession session){
        if (classphoto != null && classphoto.getOriginalFilename() != null) {
            if (!classphoto.isEmpty()) {
                try {
                    String path = session.getServletContext().getRealPath("/document/resource/prod/images");

                    String realName="";

                    realName = realName+prod.getProd_id()+".jpg";

                    String realFilePath = path+File.separator+realName;

                    String saveFilePath = File.separator+"document"+File.separator+"resource"+File.separator+"prod"+File.separator+"images"+File.separator+realName;

                    File file = new File(realFilePath);
                    classphoto.transferTo(file);
                    prod.setProd_image_src(saveFilePath);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        modalService.updateModal(prod);
    }
    //新增模板信息
    @RequestMapping("insertModal")
    public  @ResponseBody void  insertModal(@RequestParam(value = "iclassphoto",required = false)MultipartFile iclassphoto,@RequestParam(value = "fileupdate",required = false)MultipartFile fileupdate, HttpServletRequest request, Prod prod, HttpSession session){
        if (iclassphoto != null && iclassphoto.getOriginalFilename() != null) {
            if (!iclassphoto.isEmpty()) {
                try {
                    ZipUtil zipUtil=new ZipUtil();
                    Date date = new Date();
                    prod.setEffect_date(date);
                    modalService.insertModal(prod);
                    KeywordsAndNowPage keywordsAndNowPage =new KeywordsAndNowPage();
                    keywordsAndNowPage.setKeywords(prod.getProd_name());
                    int prod_id=modalService.seachModalByName(keywordsAndNowPage);
                    String path = session.getServletContext().getRealPath("/document/resource/prod/images");
                    String path2 = session.getServletContext().getRealPath("/document/resource/prod/src");


                    String realName="";

                    String realName2="";

                    realName = realName+prod_id+".jpg";

                    realName2 = realName2+prod_id+".zip";

                    String realFilePath = path+File.separator+realName;

                    String realFilePath2 = path2+File.separator+realName2;

                    String realFilePath3 = path2+File.separator+prod_id+File.separator;

                    //图片上传就路径
                    String saveFilePath = File.separator+"document"+File.separator+"resource"+File.separator+"prod"+File.separator+"images"+File.separator+realName;
                    //模板压缩包解压路径
                    String saveFilePath2 = File.separator+"document"+File.separator+"resource"+File.separator+"prod"+File.separator+"src"+File.separator+prod_id+File.separator;

                    //图片路径
                    File file = new File(realFilePath);
                    //上传模板代码路径
                    File file2 = new File(realFilePath2);
                    //解压上传模板代码的路径
                    File file3 = new File(realFilePath3);

                    iclassphoto.transferTo(file);
                    fileupdate.transferTo(file2);

                    //Windows解压Zip文件
                    zipUtil.unZip(file2,file3);
                    //解压之后删除
                    file2.delete();
                    prod.setProd_id(modalService.seachModalByName(keywordsAndNowPage));
                    prod.setProd_image_src(saveFilePath);
                    prod.setService_src(saveFilePath2);
                    modalService.updateModal(prod);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }else {
            String realName="none.png";
            String saveFilePath = File.separator+"document"+File.separator+"resource"+File.separator+"prod"+File.separator+"images"+File.separator+realName;
            prod.setProd_image_src(saveFilePath);
            modalService.insertModal(prod);
        }

    }
    //删除模板
    @RequestMapping("deleteModal")
    public @ResponseBody void deleteModal(int prod_id,HttpSession session){
        String path = session.getServletContext().getRealPath("/document/resource/prod/images");
        String path2 = session.getServletContext().getRealPath("/document/resource/prod/src");
        String realName="";
        String realName2="";
        realName = realName+prod_id+".jpg";
        realName2 = realName2+prod_id;
        String realFilePath = path+File.separator+realName;
        String realFilePath2 = path2+File.separator+realName2;
        System.out.println(realFilePath);
        System.out.println(realFilePath2);
        File file1=new File(realFilePath);
        File file2=new File(realFilePath2);
        file1.delete();
        DeleteFiles deleteFiles=new DeleteFiles();
        deleteFiles.delAllFile(realFilePath2);
        file2.delete();
        modalService.deleteModal(prod_id);
    }
}

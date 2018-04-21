package com.webdesign.test;

import com.webdesign.bean.modal.extend.ProdAndClassfiy;
import com.webdesign.service.modal.service.ModalService;
import com.webdesign.service.users.service.UserLoginAndRegisteredService;
import com.webdesign.tools.ZipUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by Administrator on 2018/4/6.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:com/config/applicationContext.xml"})
public class AddTest {
    @Autowired
    private UserLoginAndRegisteredService modalService;
    @Test
    public void test1(){
        System.out.println("!!!!!!!!!!!"+modalService.queryUserFlag("mikeop5439"));
    }

}

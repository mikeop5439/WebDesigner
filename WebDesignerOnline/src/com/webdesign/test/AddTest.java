package com.webdesign.test;

import com.webdesign.service.users.service.UserLoginAndRegisteredService;
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
    private UserLoginAndRegisteredService userLoginAndRegisteredService;
    @Test
    public void test1(){
        System.out.print(userLoginAndRegisteredService.selectTest());
    }
}

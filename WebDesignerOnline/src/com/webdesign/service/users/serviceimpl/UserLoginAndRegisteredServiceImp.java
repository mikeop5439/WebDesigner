package com.webdesign.service.users.serviceimpl;

import com.webdesign.bean.users.Provinces;
import com.webdesign.bean.users.User;
import com.webdesign.mapper.users.UserLoginAndRegisteredMapper;
import com.webdesign.service.users.service.UserLoginAndRegisteredService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/4/5.
 */
@Service
public class UserLoginAndRegisteredServiceImp implements UserLoginAndRegisteredService{
    @Autowired
    private UserLoginAndRegisteredMapper userLoginAndRegistered;

    @Override
    public List<Provinces> selectTest() {
        return userLoginAndRegistered.selectTest();
    }
}

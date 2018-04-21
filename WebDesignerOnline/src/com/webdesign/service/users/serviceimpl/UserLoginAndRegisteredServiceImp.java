package com.webdesign.service.users.serviceimpl;

import com.webdesign.bean.users.User;
import com.webdesign.bean.users.extend.UsersRegisteredClass;
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
    public void usersRegistered(UsersRegisteredClass usersRegisteredClass) {
        userLoginAndRegistered.usersRegistered(usersRegisteredClass);
    }

    @Override
    public int countUsername(String user_name) {
        return userLoginAndRegistered.countUsername(user_name);
    }

    @Override
    public int queryUserLogin(User user) {
        return userLoginAndRegistered.queryUserLogin(user);
    }

    @Override
    public void setManager(int user_id) {
        userLoginAndRegistered.setManager(user_id);
    }

    @Override
    public void nosetManager(int user_id) {
        userLoginAndRegistered.nosetManager(user_id);
    }

    @Override
    public List<User> queryUserByName(String user_name) {
        return userLoginAndRegistered.queryUserByName(user_name);
    }

    @Override
    public int queryUserFlag(String user_name) {
        return userLoginAndRegistered.queryUserFlag(user_name);
    }
}

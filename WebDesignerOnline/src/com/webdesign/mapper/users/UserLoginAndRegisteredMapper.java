package com.webdesign.mapper.users;

import com.webdesign.bean.users.User;
import com.webdesign.bean.users.extend.UsersRegisteredClass;

import java.util.List;

/**
 * Created by Administrator on 2018/4/5.
 */
public interface UserLoginAndRegisteredMapper {
    //注册用户
    public void usersRegistered(UsersRegisteredClass usersRegisteredClass);
    //验证用户名是否重复
    public int countUsername(String user_name);
    //用户登录
    public int queryUserLogin(User user);
    //修改用户权限
    public void setManager(int user_id);
    //退出登录
    public void nosetManager(int user_id);
    //查询用户
    public List<User> queryUserByName(String user_name);
    //查询用户权限
    public int queryUserFlag(String user_name);
}

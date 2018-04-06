package com.webdesign.mapper.users;

import com.webdesign.bean.users.Provinces;
import com.webdesign.bean.users.User;
import com.webdesign.service.users.service.UserLoginAndRegisteredService;

import java.util.List;

/**
 * Created by Administrator on 2018/4/5.
 */
public interface UserLoginAndRegisteredMapper {
    public List<Provinces> selectTest();
}

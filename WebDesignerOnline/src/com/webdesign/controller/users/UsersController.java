package com.webdesign.controller.users;

import com.webdesign.bean.analysis.extend.UserIdAndTime;
import com.webdesign.bean.users.User;
import com.webdesign.bean.users.extend.UsersRegisteredClass;
import com.webdesign.service.analysis.service.AnalysisService;
import com.webdesign.service.users.service.UserLoginAndRegisteredService;
import com.webdesign.tools.Md5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("users")
public class UsersController {
    @Autowired
    private UserLoginAndRegisteredService userLoginAndRegisteredService;
    @Autowired
    private AnalysisService analysisService;

    //用户注册
    @RequestMapping("registered")
    public String usersRegistred(HttpServletRequest request)throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String user_name;
        String user_tele;
        String user_password;
        String user_register;
        UsersRegisteredClass usersRegisteredClass=new UsersRegisteredClass();
        user_name = request.getParameter("user_name");
        usersRegisteredClass.setUser_name(user_name);
        user_tele = request.getParameter("user_tele");
        usersRegisteredClass.setUser_tele(user_tele);
        user_password = request.getParameter("user_password");
        //密码MD5加密
        Md5 md5t=new Md5();
        usersRegisteredClass.setPassword(md5t.md5(user_password));

        //获取当前注册时间
        Date date = new Date();
        usersRegisteredClass.setUser_register(date);
        userLoginAndRegisteredService.usersRegistered(usersRegisteredClass);
        return "redirect:/fe/login.jsp";
    };

    //用户名查重
    @RequestMapping("checkUsername")
    public @ResponseBody int checkUsername(String user_name) {
        int value = -1;
        String param = user_name;
        value = userLoginAndRegisteredService.countUsername(param);
        return value;
    }

    //用户登录
    @RequestMapping("queryuserLogin")
    public String queryuserLogin(HttpServletRequest request,
                               HttpServletResponse response,
                               User user
    ) throws ParseException {
        //登陆
        HttpSession session = request.getSession();
        Md5 md5t=new Md5();
        String user_password=md5t.md5(user.getUser_password());
        user.setUser_password(user_password);

        if (userLoginAndRegisteredService.queryUserLogin(user)==0) {
            session.setAttribute("loginError", "登录信息有误");
            return "redirect:/fe/login.jsp";
        }else{
            session.setAttribute("username",user.getUser_name());
            session.setAttribute("userflag",userLoginAndRegisteredService.queryUserFlag(user.getUser_name()));
            session.setAttribute("user_id",analysisService.queryUserId(user.getUser_name()));
            UserIdAndTime userIdAndTime=new UserIdAndTime();
            userIdAndTime.setUser_id(analysisService.queryUserId(user.getUser_name()));
            Date date=new Date();
            userIdAndTime.setUser_accesstime(date);
            analysisService.loginRmark(userIdAndTime);
            return "redirect:/index.jsp";
        }


    }

    //退出登录状态
    @RequestMapping("quitUser")
    public String quitUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        session.removeAttribute("userflag");
        return "redirect:/index.jsp";
    }

    //修改用户权限
    @RequestMapping("setManager")
    public @ResponseBody int setManager(HttpServletRequest request,int user_id) {
        userLoginAndRegisteredService.setManager(user_id);
        return 1;
    }
    @RequestMapping("nosetManager")
    public @ResponseBody int nosetManager(HttpServletRequest request,int user_id) {
        userLoginAndRegisteredService.nosetManager(user_id);
        return 1;
    }
    //通过用户名查询用户
    @RequestMapping("queryUserByName")
    public @ResponseBody List<User> queryUserByName(HttpServletRequest request,String user_name) {
        List<User> user=new ArrayList<User>();
        user=userLoginAndRegisteredService.queryUserByName(user_name);
        return user;
    }

}

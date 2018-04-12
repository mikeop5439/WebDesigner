package com.webdesign.controller.inteceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.webdesign.bean.users.User;


public class LoginInterceptor implements HandlerInterceptor{

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        //获取session中的用户对象，判断是否登录
        HttpSession session=request.getSession();
        String user= (String) session.getAttribute("username");
        String uri = request.getRequestURI();
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+uri);
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+user);

        if(uri.indexOf("manager.jsp") > 0){
            //收藏夹
            if(user != null){return true;}
            else{
                response.sendRedirect("/WebDesignerOnline/fe/login.jsp");
                return false;
            }
        }
        //暂时不拦截任何请求
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub

    }

}

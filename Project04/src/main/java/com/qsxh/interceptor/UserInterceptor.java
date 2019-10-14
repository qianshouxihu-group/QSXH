package com.qsxh.interceptor;

import com.qsxh.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("进入登录判断拦截器");
        User user= (User) httpServletRequest.getSession().getAttribute("user");
        User manager = (User) httpServletRequest.getSession().getAttribute("manager");

        if (null == user || user.getRoleid().equals('5') || user.getRoleid().equals('6'))
        {
            httpServletRequest.setAttribute("log","log");
            httpServletRequest.getRequestDispatcher("/jsp/login.jsp").forward(httpServletRequest,httpServletResponse);
            return false;
        }
        else if (null == manager)
        {
            httpServletRequest.setAttribute("log","log");
            httpServletRequest.getRequestDispatcher("/jsp/login_backstage.jsp").forward(httpServletRequest,httpServletResponse);
            return false;
        }
        else return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}

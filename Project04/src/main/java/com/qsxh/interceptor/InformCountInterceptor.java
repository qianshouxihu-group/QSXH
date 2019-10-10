package com.qsxh.interceptor;

import com.qsxh.entity.User;
import com.qsxh.service.IInformBiz;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class InformCountInterceptor implements HandlerInterceptor {
    @Resource
    private IInformBiz informBiz;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("进入消息数拦截器");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String userid = user.getUserid();

        List<Integer> list = informBiz.unreadCount(userid);
        request.setAttribute("countList", list);
        System.out.println("用户："+userid+"未读数："+list.get(0)+list.get(1)+list.get(2)+list.get(3));
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

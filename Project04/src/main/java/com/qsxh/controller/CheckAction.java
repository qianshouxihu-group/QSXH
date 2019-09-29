package com.qsxh.controller;

import com.qsxh.entity.User;
import com.qsxh.service.ICheckBiz;
import com.qsxh.service.UserBiz;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//后台审核
@Controller
@RequestMapping("/checkManager")
public class CheckAction {
    @Resource
    private ICheckBiz checkBiz;

    //注册审核列表
    @RequestMapping(value="/regCheckList")
    @ResponseBody
    public Map<String , Object> regCheckList(User user)
    {
        int page = user.getPage();
        int limit = user.getLimit();
        System.out.println("第几页："+page+"一页几行："+limit);

        Map<String , Object> map = new HashMap<>();
        map = checkBiz.regCheckListAndCount(user);

        return map;
    }

    //注册审核 通过
    @RequestMapping("/pass.action")
    @ResponseBody
    public String pass(String userid){
        System.out.println("通过："+userid);
        //修改该用户角色为普通用户，并系统发送一条信息给该用户，提示其审核通过
        String result = checkBiz.regCheckPass(userid);
        return result;
    }

    //注册审核 不通过
    @RequestMapping("/nopass.action")
    @ResponseBody
    public String nopass(String userid)
    {
        System.out.println("不通过："+userid);
        //修改该用户角色为未提交，并系统发送一条信息给该用户，提示其审核未通过
        String result = checkBiz.regCheckNoPass(userid);
        return result;
    }

    //注册审核 批量通过
    @RequestMapping("/allPass.action")
    @ResponseBody
    public String allPass(User user)
    {
        checkBiz.allPass(user.getUserids());
        return "passSuccess";
    }

    //注册审核 批量不通过
    @RequestMapping("/allNoPass.action")
    @ResponseBody
    public String allNoPass(User user)
    {
        checkBiz.allNoPass(user.getUserids());
        return "noPassSuccess";
    }
}

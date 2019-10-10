package com.qsxh.controller;

import com.qsxh.entity.Dating;
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

    /*---------------------------------注册审核--------------------------------------*/
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

    //注册审核 查看资料详情
    @RequestMapping("/dataDetails.action")
    @ResponseBody
    public User dataDetails(String userid)
    {
        System.out.println("查看资料详情："+userid);
        User user = checkBiz.dataDetails(userid);
        return user;
    }

    /*---------------------------------约会审核--------------------------------------*/
    //约会审核列表
    @RequestMapping(value="/datingCheckList")
    @ResponseBody
    public Map<String , Object> datingCheckList(Dating dating)
    {
        int page = dating.getPage();
        int limit = dating.getLimit();
        System.out.println("第几页："+page+"一页几行："+limit);

        Map<String , Object> map = new HashMap<>();
        map = checkBiz.datingCheckListAndCount(dating);

        return map;
    }

    //约会审核 通过
    @RequestMapping("/datingPass.action")
    @ResponseBody
    public String datingPass(String dateid , String dfromid){
        System.out.println("通过："+dateid+dfromid);
        //修改该约会为审核通过，并系统发送一条信息给该用户，提示其审核通过
        String result = checkBiz.datingCheckPass(dateid , dfromid);
        return result;
    }

    //约会审核 不通过
    @RequestMapping("/datingNopass.action")
    @ResponseBody
    public String datingNopass(String dateid , String dfromid)
    {
        System.out.println("不通过："+dateid+dfromid);
        //修改该约会为审核通过，并系统发送一条信息给该用户，提示其审核未通过
        String result = checkBiz.datingCheckNoPass(dateid , dfromid);
        return result;
    }

    //约会审核 批量通过
    @RequestMapping("/datingAllPass.action")
    @ResponseBody
    public String datingAllPass(String dateids , String dfromids)
    {
        System.out.println("批量通过："+dateids+"==="+dfromids);
        checkBiz.datingAllPass(dateids , dfromids);
        return "passSuccess";
    }

    //约会审核 批量不通过
    @RequestMapping("/datingAllNoPass.action")
    @ResponseBody
    public String datingAllNoPass(String dateids , String dfromids)
    {
        System.out.println("批量不通过："+dateids+"==="+dfromids);
        checkBiz.datingAllNoPass(dateids , dfromids);
        return "noPassSuccess";
    }

    //注册审核 查看资料详情
    @RequestMapping("/datingDetails.action")
    @ResponseBody
    public Dating datingDetails(String dateid)
    {
        System.out.println("查看资料详情："+dateid);
        Dating dating = checkBiz.datingDetails(dateid);
        return dating;
    }
}

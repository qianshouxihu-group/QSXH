package com.qsxh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qsxh.entity.TblRelation;
import com.qsxh.entity.TblUser;
import com.qsxh.entity.User;
import com.qsxh.interceptor.Log;
import com.qsxh.service.RelationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/MyFollowManager")
public class MyFollowAction {

    @Resource
    private RelationService relationService;

    @RequestMapping("/getlist")//获得关注列表
    @Log(actionType = "关注列表", actionName = "获得关注列表")
    public ModelAndView findFollowed(HttpServletRequest request, @RequestParam(value = "page", defaultValue = "1") Integer page){
        ModelAndView mv = new ModelAndView();

        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();

        //dao查找并分页
        PageHelper.startPage(page,5);
        List<TblUser> followlist = relationService.findFollowed(userid);

        PageInfo pageInfo = new PageInfo(followlist, 5);

        mv.addObject("pageInfo",pageInfo);

        mv.setViewName("myfollowed");
        return mv;
    }

    @RequestMapping("/good")//点赞
    @Log(actionType = "用户操作", actionName = "点赞")
    @ResponseBody
    public String giveGood(HttpServletRequest request,String followedid){
        System.out.println("---进入点赞逻辑---");

        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();

        //封装用户信息
        TblRelation users = new TblRelation();
        users.setFfromid(userid);
        users.setFtoid(followedid);

        boolean result = relationService.good(users);

        String state = result ? "yes" : "no";

        return state;
    }

    @RequestMapping("/change")//更改关注状态
    @Log(actionType = "关注列表", actionName = "修改关注状态")
    @ResponseBody
    public String cancelFollow(HttpServletRequest request,String followedid){
        System.out.println("---进入关注逻辑---");

        String requestUrl = request.getRequestURL().toString();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        String[] url = requestUrl.split(basePath);

        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();

        //封装用户信息
        TblRelation users = new TblRelation();
        users.setFfromid(userid);
        users.setFtoid(followedid);

        boolean result = relationService.follow(users);

        String state = result ? "yes" : "no";

        return state;
    }

    @RequestMapping("/gift")//赠送礼物
    @Log(actionType = "用户操作", actionName = "赠送礼物")
    @ResponseBody
    public String sendGift(HttpServletRequest request,String toid){
        System.out.println("---进入赠送礼物逻辑---");

        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();

        //封装用户信息
        TblRelation users = new TblRelation();
        users.setFfromid(userid);
        users.setFtoid(toid);

        System.out.println(userid+"---"+toid);

        String result = relationService.sendGift(users);

        return result;
    }


}

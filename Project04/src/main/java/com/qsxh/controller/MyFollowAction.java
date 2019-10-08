package com.qsxh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qsxh.entity.TblRelation;
import com.qsxh.entity.TblUser;
import com.qsxh.entity.User;
import com.qsxh.service.ChatService;
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
    @Resource
    private ChatService chatService;

    @RequestMapping("/getlist")//获得关注列表
    public ModelAndView findFollowed(HttpServletRequest request, @RequestParam(value = "page", defaultValue = "1") Integer page){
        ModelAndView mv = new ModelAndView();

        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();

        List<TblUser> chatList = chatService.findUser(userid);
        request.getSession().setAttribute("chatlist",chatList);

        //dao查找并分页
        PageHelper.startPage(page,2);
        List<TblUser> followlist = relationService.findFollowed(userid);

        PageInfo pageInfo = new PageInfo(followlist, 5);

        mv.addObject("pageInfo",pageInfo);

        mv.setViewName("myfollowed");
        return mv;
    }

    @RequestMapping("/good")//点赞
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

        return "forward:/MyFollowManager/getlist.action";
    }

    @RequestMapping("/chat")//获得聊天列表
    @ResponseBody
    public List<TblUser> chatList(@RequestParam String userid){

        System.out.println("userid = [" + userid + "]");
        List<TblUser> chatList = chatService.findUser(userid);

        return chatList;
    }

    @RequestMapping("/change")//更改关注状态
    public String cancelFollow(HttpServletRequest request,String followedid){
        System.out.println("---进入关注逻辑---");

        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();

        //封装用户信息
        TblRelation users = new TblRelation();
        users.setFfromid(userid);
        users.setFtoid(followedid);

        boolean result = relationService.follow(users);

        return "forward:/MyFollowManager/getlist.action";
    }

    @RequestMapping("/gift")//赠送礼物
    public String sendGift(HttpServletRequest request,String followedid){
        System.out.println("---进入赠送礼物逻辑---");

        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();

        //封装用户信息
        TblRelation users = new TblRelation();
        users.setFfromid(userid);
        users.setFtoid(followedid);

        boolean result = relationService.sendGift(users);

        return "forward:/MyFollowManager/getlist.action";
    }


}

package com.qsxh.controller;

import com.qsxh.entity.UserAndData;
import com.qsxh.service.impl.MatchUserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/matchUser")
public class MatchUserAction {
    private List<UserAndData> list;
    private List<UserAndData> memberlist;
    private List<UserAndData> manlist;
    private List<UserAndData> womanlist;
    private ModelAndView mv = new ModelAndView();
    @Resource
    private MatchUserServiceImpl matchUserService;

    /*
    从首页进入搜索页面时，默认展示的list查询
     */
    @RequestMapping(value = "/smartMatch", method= RequestMethod.GET, produces="application/json;charset=utf-8")
    public ModelAndView smartMatch(UserAndData userAndData){
        //条件搜索页面de默认查询
        list = matchUserService.findUserByCharisma(userAndData);
        //条件搜索页面de查询最新会员推荐
        userAndData.setCondition("member");
        userAndData.setLimitString("6");
        memberlist = matchUserService.findUserByTime(userAndData);
        //request传给页面数据
        mv.addObject("MatchUserList",list);//回传魅力值排序用户列表
        mv.addObject("Memberlist",memberlist);//回传魅力值排序用户列表
        mv.setViewName("searchmember");//跳转到条件搜索界面
        return mv;
    }

    /*
    按下搜索按钮时查询用户
     */
    @RequestMapping(value = "/matchByCondition", method= RequestMethod.GET, produces="application/json;charset=utf-8")
    public ModelAndView MatchUserListByCondition(UserAndData userAndData){
        //条件搜索页面按条件查询
        list = matchUserService.findUserByCondition(userAndData);
        //request传给页面数据
        mv.addObject("MatchUserList",list);//回传魅力值排序用户列表
        mv.addObject("userAndData",userAndData);//回传所选条件
        mv.setViewName("searchmember");//跳转到条件搜索界面
        return mv;
    }

    /*
    首页的近期佳人，近期熟男查询
     */
    @RequestMapping(value = "/matchByTime", method= RequestMethod.GET, produces="application/json;charset=utf-8")
    public ModelAndView MatchByTime(UserAndData userAndData){
        //按性别根据时间排序查询用户
        userAndData.setUsex("男");
        manlist = matchUserService.findUserByTime(userAndData);
        userAndData.setUsex("女");
        womanlist = matchUserService.findUserByTime(userAndData);
        //request传给页面数据
        mv.addObject("ManList",manlist);//回传近期男性用户列表
        mv.addObject("WomanList",womanlist);//回传近期女性用户列表
        mv.setViewName("index");//跳转到首页
        return mv;
    }


    //ajax请求待条件的查询list
    @RequestMapping(value="/MatchForPage", method= RequestMethod.GET, produces="application/json;charset=utf-8")
    public @ResponseBody List<UserAndData> MatchUserAllList(UserAndData userAndData){
        list = matchUserService.Page(userAndData);
        return list;
    }

    //智能匹配功能
    @RequestMapping(value = "/smartUser", method= RequestMethod.GET, produces="application/json;charset=utf-8")
    public ModelAndView  SmartUser(String id){
        list = matchUserService.SmartUser(id);
        //request传给页面数据
        mv.addObject("MatchList",list);//回传智能匹配的用户list
        mv.setViewName("match");//跳转到智能匹配用户展示页面
        return mv;
    }

}

package com.qsxh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qsxh.entity.TblUser;
import com.qsxh.entity.User;
import com.qsxh.service.RelationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/MyFollowManager")
public class MyFollowAction {

    @Resource
    private RelationService relationService;

    @RequestMapping("/getlist")
    public ModelAndView findFollowed(HttpServletRequest request, @RequestParam(value = "page", defaultValue = "1") Integer page){
        ModelAndView mv = new ModelAndView();

        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();

        PageHelper.startPage(page,2);
        List<TblUser> followlist = relationService.findFollowed(userid);

        PageInfo pageInfo = new PageInfo(followlist, 5);

        mv.addObject("pageInfo",pageInfo);

        mv.setViewName("myfollowed");
        return mv;
    }


}

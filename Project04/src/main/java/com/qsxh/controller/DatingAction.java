package com.qsxh.controller;

import com.mysql.cj.Session;
import com.qsxh.entity.Dating;
import com.qsxh.service.IDatingBiz;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

//约会控制层
@Controller
@RequestMapping("/datingManager")
public class DatingAction {
    @Resource
    private IDatingBiz datingBiz;//约会业务处理对象

    //和TA约会
    @RequestMapping("/dating.action")
    @ResponseBody
    public String dating(Dating dating)
    {
        System.out.println("进入约会action");
        //session取userid，放入dating

        System.out.println(dating.getDdate()+dating.getDtime()+dating.getDaddress()+dating.getDcontext()+
        dating.getDpay());
        String result = datingBiz.dating(dating);
        return result;
    }
}

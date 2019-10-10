package com.qsxh.controller;

import com.qsxh.entity.Inform;
import com.qsxh.service.IInformBiz;
import com.qsxh.service.IInformPushBiz;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

//消息推送控制层
@Controller
@RequestMapping("/informPushManager")
public class InformPushAction {

    @Resource
    private IInformPushBiz informPushBiz;
    @Resource
    private IInformBiz informBiz;

    //历史推送列表
    @RequestMapping(value="/informList.action")
    @ResponseBody
    public Map<String , Object> regCheckList(Inform inform)
    {
        int page = inform.getPage();
        int limit = inform.getLimit();
        System.out.println("第几页："+page+"一页几行："+limit);

        System.out.println("查询条件："+"title:"+inform.getItitle()+"type:"+inform.getItype()+"begindate:"+inform.getBegindate()+"enddate:"+inform.getEnddate());

        Map<String , Object> map = new HashMap<>();
        map = informPushBiz.informList(inform);

        return map;
    }

    //新增推送
    @RequestMapping(value="/addPush.action")
    @ResponseBody
    public String addPush(Inform inform)
    {
        System.out.println("新增推送:"+"title:"+inform.getItitle()+"context:"+inform.getIcontext()+"type:"+inform.getItype()+"toid:"+inform.getItoid()+"url:"+inform.getIurl());
        //1、插入数据库
        //2、实时推送
        return "success";
    }

    //消息详情
    @RequestMapping(value="/informDetails.action")
    @ResponseBody
    public Inform informDetails(Inform inform)
    {
        System.out.println("查看消息详情：informid:"+inform.getInformid());
        Inform informDetails = informBiz.informDetails(inform.getInformid().toString());
        return informDetails;
    }
}

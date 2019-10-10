package com.qsxh.controller;

import com.qsxh.entity.Inform;
import com.qsxh.entity.User;
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

    //历史推送列表
    @RequestMapping(value="/informList.action")
    @ResponseBody
    public Map<String , Object> regCheckList(Inform inform)
    {
        int page = inform.getPage();
        int limit = inform.getLimit();
        System.out.println("第几页："+page+"一页几行："+limit);

        Map<String , Object> map = new HashMap<>();
        map = informPushBiz.informList(inform);

        return map;
    }
}

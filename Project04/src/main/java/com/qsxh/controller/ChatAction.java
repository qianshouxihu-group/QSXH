package com.qsxh.controller;


import com.qsxh.entity.TblChatMessage;
import com.qsxh.entity.TblUser;
import com.qsxh.interceptor.Log;
import com.qsxh.service.ChatService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/ChatOnline")
public class ChatAction {

    @Resource
    private ChatService chatService;

    @RequestMapping("/chatList")//获得聊天列表
    @ResponseBody
    @Log(actionType = "在线聊天", actionName = "获得列表")
    public List<TblUser> chatList(@RequestParam String userid){

        List<TblUser> chatList = chatService.findUser(userid);

        return chatList;
    }

    @RequestMapping("/delete")//删除聊天对象
    @Log(actionType = "在线聊天", actionName = "删除用户")
    @ResponseBody
    public String deleteUser(@RequestParam String fromid, @RequestParam String toid, HttpServletRequest request){

        boolean daoResult = chatService.delete(fromid,toid,request);

        String result = daoResult ? "yes" : "no";

        System.out.println("删除结果---"+result);

        return result;
    }


    @RequestMapping("/messages")//获得聊天列表
    @ResponseBody
    @Log(actionType = "在线聊天", actionName = "获得聊天列表")
    public List<TblChatMessage> getMessages(@RequestParam String fromid,@RequestParam String toid){

        List<TblChatMessage> result = chatService.messages(fromid,toid);

        return result;
    }
}

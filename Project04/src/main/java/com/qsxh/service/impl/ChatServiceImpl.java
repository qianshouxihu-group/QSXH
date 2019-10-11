package com.qsxh.service.impl;

import com.google.gson.Gson;
import com.qsxh.dao.ChatUserDao;
import com.qsxh.entity.TblChatMessage;
import com.qsxh.entity.TblUser;
import com.qsxh.service.ChatService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("chatService")
public class ChatServiceImpl implements ChatService {

    @Resource
    private ChatUserDao chatUserDao;

    private boolean flag;

    @Override//增加聊天用户
    public boolean addChat(TblChatMessage cm) {

        int result = chatUserDao.addChat(cm);
        flag = result > 0 ? true : false;

        return flag;
    }

    @Override//获取聊天列表
    public List<TblUser> findUser(String userid) {
        return chatUserDao.findUser(userid);
    }

    @Override//用户下线
    public boolean offLine(String userid) {

        int result = chatUserDao.changeLine(userid,"12");
        flag = result > 0 ? true : false;

        return flag;
    }

    @Override//用户上线
    public boolean online(String userid) {

        int result = chatUserDao.changeLine(userid,"11");
        flag = result > 0 ? true : false;

        return flag;
    }

    @Override//删除聊天好友
    public boolean delete(String fromid,String toid) {

        int result = chatUserDao.deleteChat(fromid,toid);
        flag = result > 0 ? true : false;
        System.out.println("删除结果---"+flag);
        return flag;
    }

    @Override//收到消息（添加聊天记录，添加聊天列表）
    public String chatControl(TblChatMessage chatMessage) {

        String type = chatMessage.getType();

        if (type.equals("agree")){
            addChat(chatMessage);
        }
        else if (type.equals("text")||type.equals("bq")||type.equals("img")){
            chatUserDao.addMessage(chatMessage);
        }

        Gson gson = new Gson();
        String resultMessage = gson.toJson(chatMessage);

        return resultMessage;
    }


}

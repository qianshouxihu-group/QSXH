package com.qsxh.service;

import com.qsxh.entity.TblChatMessage;
import com.qsxh.entity.TblUser;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ChatService {

    //增加聊天用户
    public boolean addChat(TblChatMessage cm);

    //获取聊天列表
    public List<TblUser> findUser(String userid);

    //用户下线
    public boolean offLine(String userid);

    //用户上线
    public boolean online(String userid);

    //删除聊天好友
    public boolean delete(String fromid, String toid, HttpServletRequest request);

    //获取聊天记录
    public List<TblChatMessage> messages(String fromid,String toid);

    //根据消息类型，执行不同的操作
    public String chatControl(TblChatMessage chatMessage);

}

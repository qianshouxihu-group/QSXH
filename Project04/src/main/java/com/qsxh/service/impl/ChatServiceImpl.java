package com.qsxh.service.impl;

import com.google.gson.Gson;
import com.qsxh.dao.ChatUserDao;
import com.qsxh.entity.TblChatMessage;
import com.qsxh.entity.TblUser;
import com.qsxh.service.ChatService;
import com.qsxh.utiles.FileDeleteUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    public boolean delete(String fromid, String toid, HttpServletRequest request) {

        System.out.println("进来删除的service");
        //好友列表中删除
        int userNum = chatUserDao.deleteChat(fromid,toid);

        TblChatMessage param = new TblChatMessage();
        param.setFromid(fromid);
        param.setToid(toid);
        param.setType("img");

        String parentPath = request.getSession().getServletContext().getRealPath("/temp/");
        //查找图片记录
        List<String> imgList = chatUserDao.findSomeone(param);
        //删除这些图片
        for (String imgPath : imgList) {
            FileDeleteUtil.deleteImg(parentPath,imgPath);
        }

        //删除聊天记录
        int chatNum = chatUserDao.deleteMessage(fromid, toid);

        flag = userNum>0 ? true : false;
        System.out.println(userNum+"---删除结果---"+chatNum);
        return flag;
    }

    @Override//获得聊天记录
    public List<TblChatMessage> messages(String fromid, String toid) {
        return chatUserDao.findMessage(fromid,toid);
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

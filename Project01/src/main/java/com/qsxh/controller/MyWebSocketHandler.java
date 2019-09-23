package com.qsxh.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.qsxh.entity.Message;
import com.qsxh.entity.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Component
public class MyWebSocketHandler implements WebSocketHandler{

    @Autowired
//    private youandmeService youandmeService;

    //当MyWebSocketHandler类被加载时就会创建该Map，随类而生
    public static final Map<String, WebSocketSession> userSocketSessionMap;

    static {
        userSocketSessionMap = new HashMap<String, WebSocketSession>();
    }

    //握手实现连接后
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {

        //获得当前用户id
        Users user = (Users) webSocketSession.getAttributes().get("user");
        String userid = user.getUserid();

        if (userSocketSessionMap.get(userid) == null) {
            userSocketSessionMap.put(userid, webSocketSession);
        }
    }

    //发送信息前的处理
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {

        //判断信息是否为空
        if(webSocketMessage.getPayloadLength()==0) return;

        //得到Socket通道中的数据并转化为Message对象
        Message msg = new Gson().fromJson(webSocketMessage.getPayload().toString(),Message.class);

        Timestamp now = new Timestamp(System.currentTimeMillis());

        msg.setMessageDate(now);
        //将信息保存至数据库
//        youandmeService.addMessage(msg.getFromId(),msg.getFromName(),msg.getToId(),msg.getMessageText(),msg.getMessageDate());

        //发送Socket信息
        sendMessageToUser(msg.getToId(), new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
    }

    public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {

    }

    /**
     * 在此刷新页面就相当于断开WebSocket连接,原本在静态变量userSocketSessionMap中的
     * WebSocketSession会变成关闭状态(close)，但是刷新后的第二次连接服务器创建的
     * 新WebSocketSession(open状态)又不会加入到userSocketSessionMap中,所以这样就无法发送消息
     * 因此应当在关闭连接这个切面增加去除userSocketSessionMap中当前处于close状态的WebSocketSession，
     * 让新创建的WebSocketSession(open状态)可以加入到userSocketSessionMap中
     * @param webSocketSession
     * @param closeStatus
     * @throws Exception
     */
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {

        Users user = (Users) webSocketSession.getAttributes().get("user");
        String userid = user.getUserid();

        System.out.println("WebSocket:"+userid+"close connection");
        Iterator<Map.Entry<String,WebSocketSession>> iterator = userSocketSessionMap.entrySet().iterator();
        while(iterator.hasNext()){
            Map.Entry<String,WebSocketSession> entry = iterator.next();
            if(entry.getValue().getAttributes().get(userid)==webSocketSession.getAttributes().get(userid)){
                userSocketSessionMap.remove(webSocketSession.getAttributes().get(userid));
                System.out.println("WebSocket in staticMap:" + webSocketSession.getAttributes().get(userid) + "removed");
            }
        }
    }

    public boolean supportsPartialMessages() {
        return false;
    }

    //发送信息的实现
    public void sendMessageToUser(String userid, TextMessage message)
            throws IOException {
        WebSocketSession session = userSocketSessionMap.get(userid);
        if (session != null && session.isOpen()) {
            session.sendMessage(message);
        }
    }
}

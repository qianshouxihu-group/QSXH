package com.qsxh.controller;

import com.google.gson.Gson;
import com.qsxh.dao.InformDao;
import com.qsxh.entity.TblChatMessage;
import com.qsxh.service.ChatService;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Component
public class MyWebSocketAction implements WebSocketHandler{

    @Resource
    private ChatService chatService;

    @Resource
    private InformDao informDao;
    private List<String> userids;

    //当MyWebSocketHandler类被加载时就会创建该Map，随类而生
    public static final Map<String, WebSocketSession> userSocketSessionMap;

    static {
        userSocketSessionMap = new HashMap<String, WebSocketSession>();
    }

    //握手实现连接后
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {


        //获得当前用户id
        String userid = (String) webSocketSession.getAttributes().get("wsid");

        System.out.println("--实现握手连接--"+userid);

        //修改用户状态为上线
        chatService.online(userid);

        if (userSocketSessionMap.get(userid) == null) {
            userSocketSessionMap.put(userid, webSocketSession);
        }

    }

    //收到信息后的处理
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {

        //判断信息是否为空
        if(webSocketMessage.getPayloadLength()==0) return;

        String message = webSocketMessage.getPayload().toString();
        System.out.println("收到来自客户端的信息"+message);

        //得到Socket通道中的数据并转化为chatMessage对象
        TblChatMessage chatMessage = new Gson().fromJson(message, TblChatMessage.class);

        String toid = chatMessage.getToid();
        String type = chatMessage.getType();

        if (type.equals("push")){
        //根据toid（类型）查询所有用户id
        switch (toid)
        {
            case "all":
                userids = informDao.findAll("ol");
                break;
            case "allMan":
                userids = informDao.findAllMan("ol");
                break;
            case "allWomen":
                userids = informDao.findAllWomen("ol");
                break;
            case "allUser":
                userids = informDao.findAllUser("ol");
                break;
            case "allVip":
                userids = informDao.findAllVip("ol");
                break;
            default:
                break;
        }
        TextMessage msg = new TextMessage("test");//json格式
        for (String userid : userids)
        {
            //for循环发送实时消息
            sendMessageToUser("123" , msg);
        }
        }
        else {
            //对消息进行处理
            String resultMessage = chatService.chatControl(chatMessage);
            //封装处理后的消息
            TextMessage tm = new TextMessage(resultMessage);

            //发送Socket信息
            sendMessageToUser(toid, tm);
        }



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

        String wsid  = (String) webSocketSession.getAttributes().get("wsid");

        System.out.println("WebSocket:"+wsid+"--close connection");

        //数据库修改在线状态为离线
        chatService.offLine(wsid);

        Iterator<Map.Entry<String,WebSocketSession>> iterator = userSocketSessionMap.entrySet().iterator();
        while(iterator.hasNext()){
            Map.Entry<String,WebSocketSession> entry = iterator.next();

            if(entry.getValue().getAttributes().get("wsid")==webSocketSession.getAttributes().get("wsid")){
                userSocketSessionMap.remove(webSocketSession.getAttributes().get("wsid"));
                System.out.println("WebSocket in staticMap:" + wsid + "--removed");
            }

        }
    }

    public boolean supportsPartialMessages() {
        return false;
    }

    //发送信息的实现
    public void sendMessageToUser(String toid, TextMessage message)
            throws IOException {

        System.out.println("发送消息实现给"+toid);

        WebSocketSession session = userSocketSessionMap.get(toid);

        if (session != null && session.isOpen()) {
            session.sendMessage(message);

        }
    }
}

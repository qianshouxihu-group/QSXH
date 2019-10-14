package com.qsxh.rabbitmq;

import com.google.gson.Gson;
import com.qsxh.dao.InformDao;
import com.qsxh.entity.Inform;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;

public class MessageConsumer implements MessageListener {
    private Logger logger = LoggerFactory.getLogger(MessageConsumer.class);

    @Resource
    private InformDao informDao;

    private Gson gson = new Gson();

    @Override
    public void onMessage(Message message) {
        try {
            //消息消费者 接收队列中的消息
            String messages = new String(message.getBody(), "UTF-8");
            //如果该方法报异常，导致该条message没被消费掉，rabbit会重复投送该条消息，造成死循环
//            System.out.println(messages);

            //收到消息后，处理一些事务
            //1、将新增推送存入数据库
            informDao.addRecord(gson.fromJson(messages, Inform.class));

            //2、通过websocket对在线用户进行实时推送
            //无法实现，原因：①websocket只能在自己内部发送消息，外部无法调用send方法，在这边无法调用
            //②考虑将websocket作为消息队列的消费者（实现messageListener接口），但是失败，具体原因未知
            //解决方案：分两步走：①jsp--ajax--action--biz--生产者--消费者--dao，实现消息插入数据库
            //②jsp--websocket--dao--send，实现给所有在线用户发实时消息



        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        logger.info("消息消费者收到消息------->:{}", message);
    }



}

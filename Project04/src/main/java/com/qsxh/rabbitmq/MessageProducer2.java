package com.qsxh.rabbitmq;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;

@Service("MessageProducer2")
public class MessageProducer2 {
    @Resource(name="amqpTemplate")
    private AmqpTemplate amqpTemplate;

    public void sendMessage(Object message)throws IOException {
        amqpTemplate.convertAndSend("queueTestKey",message);
    }
}

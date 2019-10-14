package com.qsxh.controller;

import com.qsxh.rabbitmq.MessageProducer2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/rabbit")
public class RabbitmqAction {

    @Qualifier(value="MessageProducer2")
    @Autowired
    private MessageProducer2 messageProducer;

    @RequestMapping("/test")
    public void test() throws IOException {
        messageProducer.sendMessage("生产者生产的消息");

    }
}

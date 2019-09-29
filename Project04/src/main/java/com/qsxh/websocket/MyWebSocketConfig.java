package com.qsxh.websocket;

import com.qsxh.controller.MyWebSocketHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Component
@EnableWebSocket
public class MyWebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {

    @Autowired
    MyWebSocketHandler handler;

    public void registerWebSocketHandlers(WebSocketHandlerRegistry webSocketHandlerRegistry) {

        //添加websocket处理器，添加握手拦截器
        webSocketHandlerRegistry.addHandler(handler, "/ws").addInterceptors(new MyHandShakeInterceptor()).setAllowedOrigins("http://localhost:8080");

        //添加websocket处理器，添加握手拦截器
        webSocketHandlerRegistry.addHandler(handler, "/ws/sockjs").addInterceptors(new MyHandShakeInterceptor()).withSockJS();
    }

}

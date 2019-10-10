package com.qsxh.AopLog;

import com.qsxh.controller.UserAction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
	
	
	public static void main(String[] args){
		 //启动Spring容器        
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"spring-base.xml");
        //获取service或controller组件
        UserAction userAction = (UserAction) ctx.getBean("userAction");
		userAction.testAOP("zhangsan", "123456");
	}
}

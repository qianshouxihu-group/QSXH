package com.qsxh.utiles;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;

import java.lang.reflect.Method;

/**
 * 定义一个睡眠的通知（增强） 同时实现前置 和后置
 */
public class SleepHelper implements MethodBeforeAdvice, AfterReturningAdvice {

	@Override
	public void afterReturning(Object returnValue, Method method,
			Object[] args, Object target) throws Throwable {

		System.out.println("睡觉后要做美梦");
		System.out.println(returnValue);
		System.out.println(method.getName());
		System.out.println(args);
		System.out.println(target);


	}
	@Override
	public void before(Method method, Object[] args, Object target)
			throws Throwable {
		System.out.println(method.getName());
		System.out.println(args.length);
		System.out.println(target);
		System.out.println("睡觉前要敷面膜");

	}

}
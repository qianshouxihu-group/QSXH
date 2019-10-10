package com.qsxh.utiles;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * 定义一个睡眠的通知（增强） 同时实现前置 和后置
 */
	@Aspect
	@Component
	public class SleepHelper {

		//切入点
		@Pointcut("execution(* *.good(..))")
		public void sleeppoint() {
		}

		//前置增强
		@Before("sleeppoint()")
		public void beforeSleep() {
			System.out.println("睡觉前要敷面膜");
		}

		//后置增强
		@AfterReturning("sleeppoint()")
		public void afterSleep() {
			System.out.println("睡觉后要做美梦");
		}
	}



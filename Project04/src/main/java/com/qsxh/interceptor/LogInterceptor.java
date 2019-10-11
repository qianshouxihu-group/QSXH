package com.qsxh.interceptor;


import com.qsxh.entity.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;

@Aspect
@Component
public  class LogInterceptor {
    /**
     * 这里引入的是slf4j与log4j的桥接包，即可用log4j也可用slf4j输出日志
     * log4j：
     *      import org.apache.logging.log4j.LogManager;
     *      import org.apache.logging.log4j.Logger;
     * slf4j:
     *      import org.slf4j.Logger;
     *      import org.slf4j.LoggerFactory;
     */
    private static final Logger logger = LogManager.getLogger(LogInterceptor.class);

    String logStr=null;

    static {
        //    //前置通知
//    public void before(JoinPoint jp){
//        System.out.println("==========aaaaaaaaaaaaaa");
//        logStr=jp.getTarget().getClass().getName()+"类的"
//                +jp.getSignature().getName()+"方法开始执行******Start******";
//        logger.info(logStr);
//    }
//      //最终通知
//    public void after(JoinPoint jp){
//        logStr=jp.getTarget().getClass().getName()+"类的"
//                +jp.getSignature().getName()+"方法执行结束******End******";
//        logger.info(logStr);
//    }
//      //异常抛出后通知
//    public void afterThrowing(JoinPoint call){
//        String className = call.getTarget().getClass().getName();
//        String methodName = call.getSignature().getName();
//        System.out.println(className+"."+methodName+"()方法抛出了异常...");
//    }
//     //后置通知
//    public void afterReturn(JoinPoint call){
//        String className = call.getTarget().getClass().getName();
//        String methodName = call.getSignature().getName();
//        System.out.println(className+"."+methodName+"()方法正常执行结束...");
//    }
    }

    //Controller层切点
    @Pointcut("execution(@Log * *(..))")
    public  void controllerAspect() {
    }


    //用来做环绕通知的方法可以第一个参数定义为org.aspectj.lang.ProceedingJoinPoint类型
    @Around("controllerAspect()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {

        Object result = null;

        //取得类名和方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();

        //相当于前置通知
        logStr=className+"类的"+methodName+"方法开始执行******Start******";
        logger.info(logStr);

        try {
            result = joinPoint.proceed();//方法执行

            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpSession session = request.getSession();
            //读取session中的用户
            User user = (User) session.getAttribute("user");
            //请求的IP
            String ip = request.getRemoteAddr();

            String targetName = joinPoint.getTarget().getClass().getName();
            Object[] arguments = joinPoint.getArgs();
            Class targetClass = Class.forName(targetName);
            Method[] methods = targetClass.getMethods();
            String actionType = "";
            String actionName = "";
            for (Method method : methods) {
                if (method.getName().equals(methodName)) {
                    Class[] clazzs = method.getParameterTypes();
                    if (clazzs.length == arguments.length) {
                        actionType = method.getAnnotation(Log.class).actionType();
                        actionName = method.getAnnotation(Log.class).actionName();
                        break;
                    }
                }
            }

            //*========控制台输出=========*//
            System.out.println("=====controller后置通知开始=====");
            System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+actionType);
            System.out.println("方法描述:" + actionName);
            System.out.println("请求人:" + user.getUname());
            System.out.println("请求IP:" + ip);

            //相当于后置通知
            logStr="请求人:" + user.getUname()+"."+"请求方法:"+ actionName +"()方法正常执行结束...";
            logger.info(logStr);

        }catch (Exception e){
            //记录本地异常日志
            logger.error("==后置通知异常==");
            logger.error("异常信息:{}------"+ e.getMessage());
        }
        catch (Throwable e) {
            //相当于异常抛出后通知
            StackTraceElement stackTraceElement= e.getStackTrace()[e.getStackTrace().length-1];

            Object[] args=joinPoint.getArgs();

            logger.error("----------------------------------------------------------------------------------");
            logger.error ( "===执行{}类的{}()方法的{}行",className,methodName,stackTraceElement.getLineNumber());
            logger.error("===异常信息为：{}  ","e.fillInStackTrace().toString()");
            logger.error("===参数信息为：{}  ",args);
            throw e;

        }finally{
            //相当于最终通知
            logStr=className+"类的" +methodName+"方法执行结束******End******";
            logger.info(logStr);
        }

        return result;
    }

}
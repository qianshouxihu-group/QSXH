package com.qsxh.interceptor;

import java.lang.annotation.*;

@Target({ElementType.PARAMETER, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {

    /** 要执行的操作类型  比如：增加操作 **/
    public String operationType() default "";

    /** 要执行的具体操作  比如：添加用户 **/
    public String operationName() default "";
}

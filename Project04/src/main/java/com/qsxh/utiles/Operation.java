package com.qsxh.utiles;


import java.lang.annotation.*;

@Target({METHOD, TYPe})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface Operation {

    String name();
}
package com.qsxh.utiles;


import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface Operation {

    String name();
}
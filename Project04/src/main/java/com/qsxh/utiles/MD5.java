package com.qsxh.utiles;

import org.junit.jupiter.api.Test;
import org.springframework.util.DigestUtils;

public class MD5 {
    //盐，用于混交md5
    private static final String slat = "&%5123***&&%%$$#@";
    /**
     * 生成md5
     * @param
     * @return
     */
    public static String getMD5(String str) {
        String base = str +"/"+slat;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }

    @Test
    public void test()
    {
        String str = "123456";
        System.out.println(getMD5(str));
    }
}



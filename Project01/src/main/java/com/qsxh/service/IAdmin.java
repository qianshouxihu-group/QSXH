package com.qsxh.service;

import com.qsxh.entity.Manager;
import com.qsxh.entity.Users;
import org.apache.ibatis.annotations.Param;

public interface IAdmin {

    //用户登录
    public Users userLogin(@Param("userid") String userid, @Param("upass") String upass);
}

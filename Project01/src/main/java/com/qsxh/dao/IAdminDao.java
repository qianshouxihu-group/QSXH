package com.qsxh.dao;

import com.qsxh.entity.Manager;
import com.qsxh.entity.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface IAdminDao {

    //管理员登录
    public Users userLogin(@Param("userid") String userid, @Param("upass") String upass);

}

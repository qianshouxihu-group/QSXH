package com.qsxh.dao;


import com.qsxh.entity.TblChatUser;
import com.qsxh.entity.TblUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatUserDao {

    //增加聊天用户
    public Integer addChat(TblChatUser cm);

    //获取聊天列表
    public List<TblUser> findUser(@Param("userid") String userid);

    public Integer clearChat(@Param("userid") String userid);

    //修改用户上下线状态
    public Integer changeLine(@Param("userid") String userid,@Param("uonline") String uonline);

}

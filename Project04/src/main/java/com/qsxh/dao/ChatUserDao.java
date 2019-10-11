package com.qsxh.dao;


import com.qsxh.entity.TblChatMessage;
import com.qsxh.entity.TblUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatUserDao {

    //增加聊天用户
    public Integer addChat(TblChatMessage cm);

    //获取聊天列表
    public List<TblUser> findUser(@Param("userid") String userid);

    //删除聊天对象
    public Integer deleteChat(@Param("fromid") String fromid,@Param("toid") String toid);

    //修改用户上下线状态
    public Integer changeLine(@Param("userid") String userid,@Param("uonline") String uonline);

    //查找聊天记录
    public List<TblChatMessage> findMessage(@Param("fromid") String fromid,@Param("toid") String toid);

    //增加聊天记录
    public Integer addMessage(TblChatMessage chatMessage);

    //删除聊天记录
    public Integer deleteMessage(@Param("fromid") String fromid,@Param("toid") String toid);

    //查找指定记录
    public List<String> findSomeone(TblChatMessage chatMessage);
}

package com.qsxh.dao;

import com.qsxh.entity.Message;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

//留言表
@Repository("messageDao")
public interface MessageDao {
    //留言未读数
    public Integer unreadMsgInform(@Param("userid") String userid);
    //我的留言
    public List<Message> messageInform(@Param("userid") String userid);
    //查看详情
    public Message messageDetails(@Param("msgid") String msgid);
    //更改为已读
    public Integer readMessage(@Param("msgid") String msgid);
    //回复 添加一条记录
    public Integer addOneRecord(Message message);
}

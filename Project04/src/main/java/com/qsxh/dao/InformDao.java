package com.qsxh.dao;

import com.qsxh.entity.Inform;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

//消息表
@Repository("informDao")
public interface InformDao {
    //系统消息未读数
    public Integer unreadSysInform(@Param("userid") String userid);
    //活动消息未读数
    public Integer unreadActiveInform(@Param("userid") String userid);
    //系统消息列表
    public List<Inform> systemInform(@Param("userid") String userid);
    //活动消息列表
    public List<Inform> activeInform(@Param("userid") String userid);
    //查看详情
    public Inform informDetails(@Param("informid") String informid);
    //更改已读
    public Integer readSysOrActive(@Param("informid") String informid);
    //发送系统消息
    public Integer sendSystemInform(Inform inform);


    //历史推送消息 列表
    public List<Inform> informList(Inform inform);
    //历史推送消息 记录数
    public Integer informCount(Inform inform);

    //查询所有的用户id
    public List<String> findAll(@Param("ol") String online);//形参为是否在线
    //查询所有的男性用户id
    public List<String> findAllMan(@Param("ol") String online);
    //查询所有的女性用户id
    public List<String> findAllWomen(@Param("ol") String online);
    //查询所有的普通用户id
    public List<String> findAllUser(@Param("ol") String online);
    //查询所有的vip用户id
    public List<String> findAllVip(@Param("ol") String online);

    //新增消息推送记录
    public Integer addRecord(Inform inform);
}

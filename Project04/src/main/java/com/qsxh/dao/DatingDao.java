package com.qsxh.dao;

import com.qsxh.entity.Dating;
import com.qsxh.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

//约会表
@Repository("datingDao")
public interface DatingDao {
    //约会未处理数
    public Integer unreadDatingInform(@Param("userid") String userid);
    //我的约会
    public List<Dating> datingInform(@Param("userid") String userid);
    //查看详情
    public Dating datingDetails(@Param("dateid") String dateid);
//    //改状态为已读
//    public Integer readDating(@Param("dateid") String dateid);
    //我的约会 回复
    public Integer replyDating(Dating dating);
    //我的约会 接受
    public Integer acceptDating(Dating dating);
    //我的约会 拒绝
    public Integer rejectDating(String dateid);

    //和TA约会
    public Integer dating(Dating dating);

    //后台约会审核 列表
    public List<Dating> datingCheckList(Dating dating);
    //后台约会审核 记录数
    public Integer datingCheckCount(Dating dating);
    //后台约会审核 通过
    public Integer datingCheckPass(@Param("dateid") String dateid);
    //后台约会审核 不通过
    public Integer datingCheckNoPass(@Param("dateid") String dateid);
}

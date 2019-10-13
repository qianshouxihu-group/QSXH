package com.qsxh.dao;

import com.qsxh.entity.UserAndData;
import com.qsxh.entity.UserCondition;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MatchUserDao {
    //按照条件查询排序
    public List<UserAndData> findUserByCondition(UserAndData userAndData);

    //智能匹配,查询所有指数为1和以上的异性用户
    public List<UserAndData> SmartMatchAll(UserCondition userCondition);

    //查询用户的择偶要求
    public UserCondition findUserCondition(@Param("userid") String id);
}

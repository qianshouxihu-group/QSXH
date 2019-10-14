package com.qsxh.service;

import com.qsxh.entity.UserAndData;

import java.util.List;

public interface MatchUserService {
    //按照魅力值查询排序
    public List<UserAndData> findUserByCharisma(UserAndData userAndData);

    //按照搜索条件查询排序
    public List<UserAndData> findUserByCondition(UserAndData userAndData);

    //按照时间查询排序
    public List<UserAndData> findUserByTime(UserAndData userAndData);

    //智能匹配
    public List<UserAndData> SmartUser(String id, String roleid);

    //分页
    public List<UserAndData> Page(UserAndData userAndData);
}

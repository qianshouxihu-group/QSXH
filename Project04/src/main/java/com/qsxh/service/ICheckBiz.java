package com.qsxh.service;

import com.qsxh.entity.User;

import java.util.List;
import java.util.Map;

public interface ICheckBiz {
    //后台注册审核 列表
    public Map<String,Object> regCheckListAndCount(User user);
    //后台注册审核 通过
    public String regCheckPass(String userid);
    //后台注册审核 不通过
    public String regCheckNoPass(String userid);
    //后台注册审核 批量通过
    public void allPass(String[] userids);
    //后台注册审核 批量不通过
    public void allNoPass(String[] userids);
    //后台注册审核 查看资料详情
    public User dataDetails(String userid);
}

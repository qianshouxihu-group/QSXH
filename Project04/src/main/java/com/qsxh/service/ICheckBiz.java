package com.qsxh.service;

import com.qsxh.entity.Dating;
import com.qsxh.entity.Inform;
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
    //发送审核结果消息
    public Integer sendSystemInform(String userid , String result);


    //后台约会审核 列表
    public Map<String,Object> datingCheckListAndCount(Dating dating);
    //后台约会审核 通过
    public String datingCheckPass(String dateid , String dfromid);
    //后台约会审核 不通过
    public String datingCheckNoPass(String dateid , String dfromid);
    //后台约会审核 批量通过
    public void datingAllPass(String dateids  , String dfromids);
    //后台约会审核 批量不通过
    public void datingAllNoPass(String dateids  , String dfromids);
    //后台约会审核 查看约会详情
    public Dating datingDetails(String dateid);
}

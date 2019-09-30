package com.qsxh.service.impl;

import com.qsxh.dao.UserDao;
import com.qsxh.entity.User;
import com.qsxh.service.ICheckBiz;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CheckBizImpl implements ICheckBiz {
    @Resource
    private UserDao userDao;

    //后台注册审核 列表
    @Override
    public Map<String, Object> regCheckListAndCount(User user) {
        int page = user.getPage();
        int limit = user.getLimit();

        user.setPage((page - 1) * limit);
        System.out.println("查询条件："+user.getUserid()+user.getBegindate()+user.getEnddate());
        List<User> list = userDao.regCheckList(user);
        int count = userDao.regCheckCount(user);
        System.out.println("总条数："+count);

        Map<String , Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", list);
        return map;
    }
    //后台注册审核 通过
    @Override
    public String regCheckPass(String userid) {
        //更改该用户角色为普通用户
        Integer num = userDao.regCheckPass(userid);
        //系统发送一条信息给该用户，提示其审核通过
        //......
        if(num > 0)
        {
            return "passSuccess";
        }
        else
        {
            return "passFail";
        }
    }
    //后台注册审核 不通过
    @Override
    public String regCheckNoPass(String userid) {
        //更改该用户角色为未提交
        Integer num = userDao.regCheckNoPass(userid);
        //系统发送一条信息给用户，提示其审核不通过
        //......
        if(num > 0)
        {
            return "noPassSuccess";
        }
        else
        {
            return "noPassFail";
        }
    }
    //后台注册审核 批量通过
    @Override
    public void allPass(String[] userids) {
        for (String userid : userids)
        {
            regCheckPass(userid);
        }
    }
    //后台注册审核 批量不通过
    @Override
    public void allNoPass(String[] userids) {
        for (String userid : userids)
        {
            regCheckNoPass(userid);
        }
    }
    //后台注册审核 查看资料详情
    @Override
    public User dataDetails(String userid) {
        User user = userDao.dataDetails(userid);
        return user;
    }

}

package com.qsxh.service.impl;

import com.qsxh.dao.IAdminDao;
import com.qsxh.entity.Manager;
import com.qsxh.entity.Users;
import com.qsxh.service.IAdmin;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service("iAdmin")
public class IAdminImpl implements IAdmin {

    @Resource
    private IAdminDao iAdminDao;


    @Override
    public Users userLogin(String userid, String upass) {
        return iAdminDao.userLogin(userid,upass);
    }
}

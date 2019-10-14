package com.qsxh.service.impl;

import com.qsxh.dao.DatingDao;
import com.qsxh.entity.Dating;
import com.qsxh.service.IDatingBiz;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("datingBiz")
public class DatingBizImpl implements IDatingBiz {
    @Resource
    private DatingDao datingDao;

    //和TA约会
    @Override
    public String dating(Dating dating) {

        Integer num = datingDao.dating(dating);
        if (num > 0)
        {
            return "success";
        }
        else
        {
            return "fail";
        }
    }
}

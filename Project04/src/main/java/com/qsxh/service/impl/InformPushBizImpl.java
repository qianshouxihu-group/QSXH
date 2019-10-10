package com.qsxh.service.impl;

import com.qsxh.dao.InformDao;
import com.qsxh.entity.Inform;
import com.qsxh.entity.User;
import com.qsxh.service.IInformPushBiz;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//消息推送业务
@Service("informPushBiz")
public class InformPushBizImpl implements IInformPushBiz {

    @Resource
    private InformDao informDao;

    //历史推送消息
    @Override
    public Map<String, Object> informList(Inform inform) {
        int page = inform.getPage();
        int limit = inform.getLimit();

        inform.setPage((page - 1) * limit);
//        System.out.println("查询条件："+inform.getUserid()+inform.getBegindate()+inform.getEnddate());
        List<Inform> list = informDao.informList(inform);
        int count = informDao.informCount(inform);
        System.out.println("总条数："+count);

        Map<String , Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", list);
        return map;
    }
}

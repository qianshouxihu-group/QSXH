package com.qsxh.service;

import com.qsxh.entity.Inform;

import java.util.List;
import java.util.Map;

public interface IInformPushBiz {
    //历史推送列表
    public Map<String,Object> informList(Inform inform);
}

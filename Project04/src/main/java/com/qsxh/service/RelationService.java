package com.qsxh.service;

import com.qsxh.entity.TblRelation;
import com.qsxh.entity.TblUser;

import java.util.List;

public interface RelationService {

    //一对一关系
    public TblRelation findRelation(TblRelation relation);

    //查看关注列表
    public List<TblUser> findFollowed(String userid);

    //点赞
    public boolean good(TblRelation relation);

    // 关注/取消关注
    public boolean follow(TblRelation relation);


}

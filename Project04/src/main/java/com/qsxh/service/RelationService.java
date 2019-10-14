package com.qsxh.service;

import com.qsxh.entity.Account;
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

    //赠送礼物
    public String sendGift(TblRelation relation);

    //增加魅力值
    public boolean addCharm(String userid, int charm);

    //金币消费
    public String goldAccount(Account account);


}
